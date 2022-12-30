// ignore_for_file: non_constant_identifier_names, must_be_immutable
import 'dart:convert';
import 'package:WMS_Application/Model/Project/countModel.dart';
import 'package:WMS_Application/Screens/Login/MyDrawerScreen.dart';
import 'package:WMS_Application/Screens/RMS/RMS_Details_Screen.dart';
import 'package:WMS_Application/Screens/RMS/RMS_Graphical_Screen.dart';
import 'package:WMS_Application/styles.dart';
import 'package:http/http.dart' as http;
import 'package:WMS_Application/Model/AreaModel.dart';
import 'package:WMS_Application/Model/DistibutoryModel.dart';
import 'package:WMS_Application/Model/Project/RMS_Overview_model.dart';
import 'package:WMS_Application/Model/Project/RMSMastermodel.dart';
import 'package:WMS_Application/Operations/StateselectionOperation.dart';
import 'package:flutter/material.dart';
import 'package:darq/darq.dart';
import 'package:WMS_Application/core/app_export.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Rms_Screen_Updated extends StatefulWidget {
  String? ProjectName;

  Rms_Screen_Updated(String project) {
    ProjectName = project;
  }
  @override
  State<Rms_Screen_Updated> createState() => _Rms_Screen_UpdatedState();
}

class _Rms_Screen_UpdatedState extends State<Rms_Screen_Updated> {
  get status => null;

  void display_list_checkbox(bool? value) {
    return setState(() {
      // value = false;
      this.value = value;
    });
  }

  // Initial Selected Value
  var area = 'All';
  var distibutory = 'ALL';

  int TotalRms = 0, OnlineRms = 0, OfflineRms = 0, DamageRms = 0;

  bool? value = false;

  //bool? _Busy = false;

  int? nodes;

  bool? TotalValue = false;
  bool? OnlineValue = false;
  bool? OfflineValue = false;
  bool? DamageValue = false;
  bool? isSelected = false;

  String? RMSStatusCheck = 'ALL';
  String? DamageStatusCheck = 'ALL';
  String? btnViewText = 'DISPLAY LIST';

  String? _search = '';

  AreaModel? selectedArea;
  DistibutroryModel? selectedDistributory;

  List<RMS_Overview_model>? PopupModelList;

  Future<List<DistibutroryModel>>? futureDistributory;
  Future<List<AreaModel>>? futureArea;
  List<DistibutroryModel>? DistriList;
  Future getDropDownAsync() async {
    setState(() {
      futureArea = getAreaid();
      futureDistributory = getDistibutoryid();
    });
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? project = preferences.getString('project');
  }

  // List<RMSMastermodel>? _RmsList;
  List<RMSMastermodel>? _DisplayList = <RMSMastermodel>[];

  var cheklist = ['All'];

  getDist(BuildContext context, List<DistibutroryModel> values) {
    try {
      return Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 168, 211, 237),
            borderRadius: BorderRadius.circular(5)),
        child: DropdownButton(
          value: selectedDistributory == null ||
                  (values
                          .where((e) => e.id == selectedDistributory!.id)
                          .count() ==
                      0)
              ? values.first
              : selectedDistributory,
          underline: Container(color: Colors.transparent),
          isExpanded: true,
          items: values.map((DistibutroryModel distibutroryModel) {
            return DropdownMenuItem<DistibutroryModel>(
              value: distibutroryModel,
              child: Center(
                child: Text(
                  distibutroryModel.description!,
                  textScaleFactor: 1,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }).toList(),
          onChanged: (textvalue) async {
            setState(() {
              _page = 0;
              _hasNextPage = true;
              _isFirstLoadRunning = false;
              _isLoadMoreRunning = false;
              _DisplayList = <RMSMastermodel>[];

              selectedDistributory = textvalue as DistibutroryModel;
              distibutory = selectedDistributory!.id == 0
                  ? "All"
                  : selectedDistributory!.id.toString();
            });

            await GetRmsOverviewModel();
          },
        ),
      );
    } catch (_, ex) {
      return Container();
    }
  }

  getArea(BuildContext context, List<AreaModel> values) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 168, 211, 237),
          borderRadius: BorderRadius.circular(5)),
      child: DropdownButton(
        underline: Container(color: Colors.transparent),
        value: selectedArea == null ||
                (values.where((element) => element == selectedArea)).count() ==
                    0
            ? values.first
            : selectedArea,
        isExpanded: true,
        items: values.map((AreaModel areaModel) {
          return DropdownMenuItem<AreaModel>(
            value: areaModel,
            child: Center(
              child: Text(
                areaModel.areaName!,
                textScaleFactor: 1,
                style: TextStyle(fontSize: 16),
              ),
            ),
          );
        }).toList(),
        onChanged: (textvalue) async {
          //onAreaChange(textvalue);
          var data = textvalue as AreaModel;
          var distriFuture = getDistibutoryid(
              areaId: data.areaid == 0 ? 'All' : data.areaid.toString());
          await distriFuture.then((value) => setState(() {
                selectedDistributory = value.first;
                distibutory = "All";
              }));
          setState(() {
            _page = 0;
            _hasNextPage = true;
            _isFirstLoadRunning = false;
            _isLoadMoreRunning = false;
            _DisplayList = <RMSMastermodel>[];

            selectedArea = data;
            futureDistributory = distriFuture;

            area = selectedArea!.areaid == 0
                ? "All"
                : selectedArea!.areaid.toString();
          });
          await GetRmsOverviewModel();
          // setState(() {
          //   try {
          //     selectedState = textvalue as AreaModel;
          //   } catch (_, ex) {
          //     print(ex);
          //   }
          // });
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getDropDownAsync().whenComplete(() async => await GetRmsOverviewModel());
    setState(() {
      _DisplayList = [];
    });
    _firstLoad();
    _controller = new ScrollController()..addListener(_loadMore);
  }

  @override
  void dispose() {
    _controller.removeListener(_loadMore);
    super.dispose();
  }

  Future<List<RMS_Overview_model>>? RmsListFuture;
  List<RMS_Overview_model>? RmsOverviewList = [];
  Future<List<RMSMastermodel>>? DisplayListFuture;

  Future GetRmsOverviewModel() async {
    try {
      setState(() {
        RmsListFuture = getRmsOverviewdata(RMSStatusCheck!, DamageStatusCheck!,
            area.toString(), distibutory.toString());
        RmsListFuture!.then((value) {
          setState(() {
            RmsOverviewList = value;
          });
          SetTotalStatusCount(value);
        });
      });
      _DisplayList = [];
      getScount();
      _firstLoad();
      return RmsListFuture;
    } catch (_, ex) {}
  }

  var usertype;
  getUserType() {
    setState(() async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      usertype = preferences.getString('usertype')!;
    });
    return usertype;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      drawer: MyDrawerScreen(),
      appBar: AppBar(
          title: Text(
            widget.ProjectName!.toString().toUpperCase() + " - RMS",
            textScaleFactor: 1,
            //"Kundalia_LBC-Rms",
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(color: Colors.lightBlue),
          ),
          leading: BackButton(
            onPressed: () => Navigator.of(context).pop(),
          )),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            _page = 0;
          });
          _DisplayList = [];
          await GetRmsOverviewModel();
        },
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
          child: Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(image: backgroundImage),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // if (_Busy!)
                  Stack(
                    children: [
                      Positioned(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    onChanged: (value) async {
                                      // if (value.isEmpty) {
                                      //   getScount();
                                      //   GetRmsOverviewModel();
                                      // } else
                                      setState(() {
                                        _search = value;
                                      });
                                    },
                                    // onSubmitted: (value) async {
                                    //   setState(() {
                                    //     _search = myController.text;
                                    //   });
                                    //   await GetRmsOverviewModel();
                                    // },
                                    cursorColor: Colors.black,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.go,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 15),
                                        hintText: "Search"),
                                  ),
                                ),
                                IconButton(
                                  splashColor: Colors.blue,
                                  icon: Icon(Icons.search),
                                  onPressed: () {
                                    getpop(context);

                                    setState(() {
                                      _page = 0;
                                      _hasNextPage = true;
                                      _isFirstLoadRunning = false;
                                      _isLoadMoreRunning = false;
                                      _DisplayList = <RMSMastermodel>[];
                                    });
                                    GetRmsOverviewModel();

                                    new Future.delayed(new Duration(seconds: 1),
                                        () {
                                      Navigator.pop(context); //pop dialog
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  //dropDown Menu List
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// This Future Builder is Used for Area DropDown list
                        FutureBuilder(
                          future: futureArea,
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              return SizedBox(
                                  height: 40,
                                  width: 200,
                                  child: getArea(context, snapshot.data!));
                            } else if (snapshot.hasError) {
                              return Text(
                                "Something Went Wrong: " +
                                    snapshot.error.toString(),
                                textScaleFactor: 1,
                              );
                            } else {
                              return Center(child: Container());
                            }
                          },
                        ),
                        SizedBox(
                          width: 5,
                        ),

                        ///This Future Builder is Used for Distibutory DropDown List
                        FutureBuilder(
                          future: futureDistributory,
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              return SizedBox(
                                  height: 40,
                                  width: 180,
                                  child: getDist(context, snapshot.data!));
                            } else if (snapshot.hasError) {
                              return Container() /*Text(
                                "Something Went Wrong: " /*+
                                    snapshot.error.toString()*/
                                ,
                                textScaleFactor: 1,
                              )*/
                                  ;
                            } else {
                              return Center(child: Container());
                            }
                          },
                        ),
                      ],
                    ),
                  ),

                  //CheckBox Selection
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ///Total
                        Container(
                          //height: 120,
                          margin: EdgeInsets.only(
                            bottom: getVerticalSize(
                              12.58,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: ColorConstant.lightBlue600,
                            borderRadius: BorderRadius.circular(5.0),
                            boxShadow: [
                              BoxShadow(
                                color: ColorConstant.black90026,
                                spreadRadius: getHorizontalSize(
                                  2.00,
                                ),
                                blurRadius: getHorizontalSize(
                                  2.00,
                                ),
                                offset: Offset(
                                  0,
                                  2,
                                ),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              children: [
                                Checkbox(
                                  value: RMSStatusCheck == 'ALL',
                                  onChanged: (value) {
                                    getpop(context);
                                    setState(() {
                                      _page = 0;
                                      _hasNextPage = true;
                                      _isFirstLoadRunning = false;
                                      _isLoadMoreRunning = false;
                                      _DisplayList = <RMSMastermodel>[];

                                      RMSStatusCheck = 'ALL';
                                      DamageStatusCheck = 'ALL';
                                      nodes = TotalRms.toInt();
                                    });
                                    GetRmsOverviewModel();
                                    new Future.delayed(new Duration(seconds: 1),
                                        () {
                                      Navigator.pop(context); //pop dialog
                                    });
                                  },
                                ),
                                Text(
                                  "TOTAL RMS",
                                  textScaleFactor: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: ColorConstant.black900,
                                    fontSize: getFontSize(
                                      9,
                                    ),
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  TotalRms.toString(),
                                  textScaleFactor: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: ColorConstant.whiteA700,
                                    fontSize: getFontSize(
                                      14,
                                    ),
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        ///Online
                        Container(
                          // height: 120,
                          margin: EdgeInsets.only(
                            bottom: getVerticalSize(
                              12.58,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(5.0),
                            boxShadow: [
                              BoxShadow(
                                color: ColorConstant.black90026,
                                spreadRadius: getHorizontalSize(
                                  2.00,
                                ),
                                blurRadius: getHorizontalSize(
                                  2.00,
                                ),
                                offset: Offset(
                                  0,
                                  2,
                                ),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Checkbox(
                                  value: RMSStatusCheck == 'ON',
                                  onChanged: (value) {
                                    getpop(context);
                                    setState(() {
                                      _page = 0;
                                      _hasNextPage = true;
                                      _isFirstLoadRunning = false;
                                      _isLoadMoreRunning = false;
                                      _DisplayList = <RMSMastermodel>[];

                                      RMSStatusCheck = 'ON';
                                    });
                                    GetRmsOverviewModel();
                                    new Future.delayed(new Duration(seconds: 1),
                                        () {
                                      Navigator.pop(context); //pop dialog
                                    });
                                  },
                                ),
                                Text(
                                  "ONLINE RMS",
                                  textScaleFactor: 1,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: ColorConstant.black900,
                                    fontSize: getFontSize(
                                      9,
                                    ),
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  OnlineRms.toString(),
                                  textScaleFactor: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: ColorConstant.black900,
                                    fontSize: getFontSize(
                                      14,
                                    ),
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        ///Offline
                        Container(
                          //height: 120,
                          margin: EdgeInsets.only(
                            bottom: getVerticalSize(
                              12.58,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(5.0),
                            boxShadow: [
                              BoxShadow(
                                color: ColorConstant.black90026,
                                spreadRadius: getHorizontalSize(
                                  2.00,
                                ),
                                blurRadius: getHorizontalSize(
                                  2.00,
                                ),
                                offset: Offset(
                                  0,
                                  2,
                                ),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Checkbox(
                                  value: RMSStatusCheck == 'OFF',
                                  onChanged: (value) {
                                    getpop(context);
                                    setState(() {
                                      _page = 0;
                                      _hasNextPage = true;
                                      _isFirstLoadRunning = false;
                                      _isLoadMoreRunning = false;
                                      _DisplayList = <RMSMastermodel>[];

                                      RMSStatusCheck = 'OFF';
                                    });
                                    GetRmsOverviewModel();
                                    new Future.delayed(new Duration(seconds: 1),
                                        () {
                                      Navigator.pop(context); //pop dialog
                                    });
                                  },
                                ),
                                Text(
                                  "OFFLINE RMS",
                                  textScaleFactor: 1,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: ColorConstant.black900,
                                    fontSize: getFontSize(
                                      9,
                                    ),
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  OfflineRms.toString(),
                                  textScaleFactor: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: ColorConstant.black900,
                                    fontSize: getFontSize(
                                      14,
                                    ),
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        ///Damage
                        Container(
                          margin: EdgeInsets.only(
                            bottom: getVerticalSize(
                              12.58,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(5.0),
                            boxShadow: [
                              BoxShadow(
                                color: ColorConstant.black90026,
                                spreadRadius: getHorizontalSize(
                                  2.00,
                                ),
                                blurRadius: getHorizontalSize(
                                  2.00,
                                ),
                                offset: Offset(
                                  0,
                                  2,
                                ),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Checkbox(
                                  value: DamageStatusCheck != 'ALL',
                                  onChanged: (value) {
                                    getpop(context);
                                    setState(() {
                                      _page = 0;
                                      _hasNextPage = true;
                                      _isFirstLoadRunning = false;
                                      _isLoadMoreRunning = false;
                                      _DisplayList = <RMSMastermodel>[];

                                      DamageStatusCheck =
                                          DamageStatusCheck == 'ALL'
                                              ? '1'
                                              : 'ALL';
                                    });
                                    GetRmsOverviewModel();
                                    new Future.delayed(new Duration(seconds: 1),
                                        () {
                                      Navigator.pop(context); //pop dialog
                                    });
                                  },
                                ),
                                Text(
                                  "DAMAGE RMS",
                                  textScaleFactor: 1,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: ColorConstant.black900,
                                    fontSize: getFontSize(
                                      9,
                                    ),
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  DamageRms.toString(),
                                  textScaleFactor: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: ColorConstant.black900,
                                    fontSize: getFontSize(
                                      14,
                                    ),
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //Display Buttons
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: size.height * 0.045,
                          // width: size.width,
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(
                                -0.11693549743786386,
                                5.232387891851431e-7,
                              ),
                              end: Alignment(
                                1.016128983862346,
                                0.8571436124054905,
                              ),
                              colors: [
                                ColorConstant.lightBlue701,
                                ColorConstant.cyan301,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: ElevatedButton(
                            child: Text(
                              "GRAPHICAL \nRMS DETAILS",
                              textScaleFactor: 1,
                              maxLines: null,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: ColorConstant.whiteA700,
                                fontSize: getFontSize(
                                  10,
                                ),
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            onPressed: () {
                              /*showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                        child: AlertDialog(
                                            title: Center(
                                                child: Text(
                                              'Graphical RMS Details Page',
                                              textScaleFactor: 1,
                                            )),
                                            content: Container(
                                              height: 100,
                                              child: Center(
                                                child: Text(
                                                  "Page Under Development",
                                                  textScaleFactor: 1,
                                                ),
                                              ),
                                            )));
                                  });*/
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          RMS_Graphical_Screen(
                                            area_: selectedArea ??
                                                new AreaModel(
                                                    areaid: 0,
                                                    areaName: 'DISTRIBUTORY'),
                                            dist_: selectedDistributory ??
                                                new DistibutroryModel(
                                                    id: 0, description: 'AREA'),
                                            RmsStatus_check: RMSStatusCheck,
                                            DamageStatus_check_:
                                                DamageStatusCheck,
                                            ListStatus_:
                                                cheklist.join(',').toString(),
                                          )));
                            },
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.only(
                                  left: 44,
                                  right: 44,
                                ),
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                        ///Total Nodes and Filtter
                        Container(
                          width: size.width,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(
                                -0.11693549743786386,
                                5.232387891851431e-7,
                              ),
                              end: Alignment(
                                1.016128983862346,
                                0.8571436124054905,
                              ),
                              colors: [
                                ColorConstant.lightBlue701,
                                ColorConstant.cyan302,
                              ],
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          child: Align(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'TOTAL NODE:' + scount!.toString(),
                                        textScaleFactor: 1,
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: ColorConstant.whiteA700),
                                      ),
                                    ),
                                    Container(
                                      height: 40,
                                      width: 40,
                                      child: InkWell(
                                        child: Icon(
                                          Icons.menu,
                                          color: Colors.white,
                                        ),
                                        onTap: () async {
                                          await showFilterPopup(context);
                                          //var tempList = RmsOverviewList;
                                          // RmsOverviewList!.forEach((element) {
                                          //   element.isChecked = false;
                                          // });
                                        },
                                      ),
                                    )
                                  ]),
                            ),
                            alignment: Alignment.bottomRight,
                          ),
                        ),

                        ///Table Header
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(
                                -0.11693549743786386,
                                5.232387891851431e-7,
                              ),
                              end: Alignment(
                                1.016128983862346,
                                0.8571436124054905,
                              ),
                              colors: [
                                ColorConstant.lightBlue701,
                                ColorConstant.cyan302,
                              ],
                            ),
                            // borderRadius: BorderRadius.only(
                            //   // topLeft: Radius.circular(5),
                            //   // topRight: Radius.circular(10),
                            //   bottomLeft: Radius.circular(10),
                            //   bottomRight: Radius.circular(10),
                            // ),
                          ),
                          //BoxDecoration(color: Color.fromARGB(255, 235, 232, 169)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'RMS NO.\n(DIST-AREA)',
                                textScaleFactor: 1,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w900),
                              ),
                              /*Text(
                                'ALARM',
                                textScaleFactor: 1,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w900),
                              ),
                              */ // Text(
                              //   'Status',
                              //   style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                              // ),
                              Text(
                                'DAMAGE',
                                textScaleFactor: 1,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w900),
                              ),
                              Text(
                                'BATTERY',
                                textScaleFactor: 1,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w900),
                              ),
                              Text(
                                'LAST \nRESPONSE \n\tTIME',
                                textScaleFactor: 1,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w900),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  getRmsList(context),
                ]),
          ),
        ),
      ),
    ));
  }

  Future<void> showFilterPopup(context) async {
    setState(() {
      if ((cheklist.where((element) => element == 'All').length == 0) &&
          cheklist.length != 0)
        cheklist.forEach((element) {
          RmsOverviewList!
              .where((item) => item.chkData == element)
              .first
              .isChecked = true;
        });
      else {
        cheklist = ['All'];
        RmsOverviewList!.forEach((element) {
          element.isChecked = false;
        });
      }
      //PopupModelList = items;
    });
    var items = RmsOverviewList!
        .where(
            (element) => !(element.subProcess!.contains('NODE COMMUNICATION')))
        .toList();
    Set<String> SubProcesses = new Set<String>();
    items.forEach((x) => SubProcesses.add(x.subProcess!));
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setState) {
            return Column(
              children: [
                Expanded(
                  child: AlertDialog(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(),
                        Center(
                            child: Text(
                          'Display List Filter',
                          textScaleFactor: 1,
                        )),
                        _getCloseButton(context),
                      ],
                    ),
                    content: Container(
                      width: size.width,
                      // height: MediaQuery.of(context).size.height,
                      child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              for (String pr in SubProcesses)
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 4.0, bottom: 4),
                                  child: ExpansionTile(
                                    backgroundColor: ColorConstant.whiteA700,
                                    title: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: Container(
                                        width: getHorizontalSize(
                                          340.00,
                                        ),
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment(
                                              -0.11693549743786386,
                                              5.232387891851431e-7,
                                            ),
                                            end: Alignment(
                                              1.016128983862346,
                                              0.8571436124054905,
                                            ),
                                            colors: [
                                              ColorConstant.lightBlue701,
                                              ColorConstant.cyan301,
                                            ],
                                          ),
                                        ),
                                        child: Text(
                                          pr.toString(),
                                          maxLines: null,
                                          textAlign: TextAlign.center,
                                          textScaleFactor: 1,
                                          style: TextStyle(
                                            color: ColorConstant.whiteA700,
                                            fontSize: getFontSize(
                                              11,
                                            ),
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                    children: [
                                      //checkbox part
                                      GridView.count(
                                        crossAxisCount: 3,
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        crossAxisSpacing: 3.0,
                                        mainAxisSpacing: 5.0,
                                        children: [
                                          for (var item in RmsOverviewList!
                                              .where((element) =>
                                                  element.subProcess == pr)
                                              .toList())
                                            Column(
                                              children: [
                                                Checkbox(
                                                    value: item.isChecked!,
                                                    onChanged: (bool? value) {
                                                      setState(() {
                                                        item.isChecked = value;
                                                      });
                                                    }),
                                                Expanded(
                                                  child: Text(
                                                    // item.dESCRIPTION!,
                                                    item.dESCRIPTION!
                                                            .replaceAll(
                                                                '_', ' ') +
                                                        "\n" +
                                                        item.vALUE.toString(),
                                                    maxLines: null,
                                                    textAlign: TextAlign.center,
                                                    textScaleFactor: 1,
                                                    style: TextStyle(
                                                      color: getColor(
                                                          item.dESCRIPTION!),
                                                      fontSize: getFontSize(
                                                        10,
                                                      ),
                                                      fontFamily: 'Inter',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                            ],
                          )),
                    ),
                    actions: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              //getpop(context);
                              setState(() {
                                // _page = 0;
                                // _hasNextPage =
                                //     true;
                                // _isFirstLoadRunning =
                                //     false;
                                // _isLoadMoreRunning =
                                //     false;
                                // _DisplayList = <
                                //     RMSMastermodel>[];
                                // var items = RmsOverviewList!
                                //     .where((element) => !(element
                                //         .subProcess!
                                //         .contains('NODE COMMUNICATION')))
                                //     .toList();
                                // Set<String>
                                //     SubProcesses =
                                //     new Set<
                                //         String>();
                                // items.forEach((x) =>
                                //     SubProcesses.add(
                                //         x.subProcess!));
                                RmsOverviewList!
                                    .where(
                                        (element) => element.isChecked == true)
                                    .forEach((item) {
                                  item.isChecked = false;
                                });
                                cheklist = ['All'];
                              });

                              await GetRmsOverviewModel();
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                                // alignment: Alignment.center
                                padding: EdgeInsets.only(right: 30, left: 30),
                                primary: ColorConstant.cyan300),
                            child: Text(
                              "Clear",
                              textScaleFactor: 1,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: ColorConstant.whiteA700,
                                fontSize: getFontSize(
                                  12,
                                ),
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              //getpop(context);
                              setState(() {
                                _page = 0;
                                _hasNextPage = true;
                                _isFirstLoadRunning = false;
                                _isLoadMoreRunning = false;
                                _DisplayList = <RMSMastermodel>[];
                                if (RmsOverviewList!
                                        .where((element) =>
                                            element.isChecked == true)
                                        .length !=
                                    0) {
                                  cheklist = RmsOverviewList!
                                      .where((element) =>
                                          element.isChecked == true)
                                      .select((element, index) =>
                                          element.chkData!.toString())
                                      .toList();
                                } else {
                                  cheklist = ['All'];
                                }
                              });

                              await GetRmsOverviewModel();
                              // new Future.delayed(
                              //     new Duration(
                              //         seconds: 1),
                              //     () {
                              //   Navigator.pop(
                              //       context); //pop dialog
                              // });
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                                // alignment: Alignment.center
                                padding: EdgeInsets.only(right: 30, left: 30),
                                primary: ColorConstant.cyan300),
                            child: Text(
                              "Apply",
                              textScaleFactor: 1,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: ColorConstant.whiteA700,
                                fontSize: getFontSize(
                                  12,
                                ),
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            );
          });
        });
  }

  getColor(String description) {
    if (description == 'IN_IRRIGATION' ||
        description == 'VOLUME_PASSED' ||
        description == 'ONOFF_MODE' ||
        description == 'MANUAL_MODE' ||
        description == 'POSITION_CONTROL_MODE' ||
        description == 'TESTING_MODE' ||
        description == 'WITH_SCHEDULE') {
      return ColorConstant.cyan301;
    } else if (description == 'SOLAR_PANEL' ||
        description == 'WRF_ANTENNA' ||
        description == 'SOLAR_CABLE' ||
        description == 'BATTERY' ||
        description == 'Rms_PCB') {
      return ColorConstant.amber501;
    } else if (description == 'FLOW_CONTROL_MODE' ||
        description == 'AUTO_MODE') {
      return ColorConstant.lightGreen900;
    } else {
      return ColorConstant.redA701;
    }
  }

  SetTotalStatusCount(List<RMS_Overview_model> list) {
    list
        .where((element) => element.subProcess!.contains('NODE COMMUNICATION'))
        .forEach((element) {
      setState(() {
        if (element.dESCRIPTION!.contains('TotalRms'))
          TotalRms = element.vALUE!;
        if (element.dESCRIPTION!.contains('OnlineRms'))
          OnlineRms = element.vALUE!;
        if (element.dESCRIPTION!.contains('OfflineRms'))
          OfflineRms = element.vALUE!;
        if (element.dESCRIPTION!.contains('DamageRms'))
          DamageRms = element.vALUE!;
      });
    });
  }

  String getBattreydata(double LevelStatus) {
    try {
      if (LevelStatus <= 100 && LevelStatus >= 90) {
        return "assets/images/battery100.png";
      } else if (LevelStatus < 90 && LevelStatus >= 80) {
        return "assets/images/battery80.png";
      } else if (LevelStatus < 80 && LevelStatus >= 60) {
        return "assets/images/battery70.png";
      } else if (LevelStatus < 60 && LevelStatus >= 40) {
        return "assets/images/battery55.png";
      } else if (LevelStatus < 40 && LevelStatus > 20) {
        return "assets/images/battery25.png";
      } else {
        return "assets/images/battery10.png";
      }
    } catch (_, ex) {
      return "assets/images/battery10_2.png";
    }
  }

  getBatpercentage(double BatLevel) {
    var batper;
    try {
      var batVoltage;
      var batper;
      try {
        batVoltage = BatLevel;
        batper = (batVoltage - 11) * 100 / (16.5 - 11);
        if (batper < 0.0) {
          return 0.0;
        } else if (batper > 100.0) {
          return 0.0;
        } else {
          return batper;
        }
      } catch (_, ex) {}

      // return batper > 0 ? 0.0 : batper;
      return batper;
    } catch (_, ex) {}
    // return batper;
  }

  getRmsList(BuildContext context) {
    return Expanded(
      child: Scrollbar(
        controller: _controller,
        interactive: true,
        thickness: 12,
        thumbVisibility: true,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          controller: _controller,
          child: Container(
            margin: EdgeInsets.only(
                left: getHorizontalSize(
                  8.00,
                ),
                right: getHorizontalSize(
                  8.00,
                ),
                bottom: getVerticalSize(13.00)),
            decoration: BoxDecoration(
              color: ColorConstant.whiteA700,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  color: ColorConstant.black90026,
                  spreadRadius: getHorizontalSize(
                    2.00,
                  ),
                  blurRadius: getHorizontalSize(
                    2.00,
                  ),
                  offset: Offset(
                    0,
                    2,
                  ),
                ),
              ],
            ),
            width: size.width,
            child: _isFirstLoadRunning
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(children: [
                    getBody(),
                    // when the _loadMore function is running
                    if (_isLoadMoreRunning == true)
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 40),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),

                    // When nothing else to load
                    if (_hasNextPage == false)
                      Container(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                      ),
                  ]),
          ),
        ),
      ),
    );
  }

  Widget getBody() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: _DisplayList!.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RMS_Details_Screen(
                                    _DisplayList![index], widget.ProjectName!)))
                        .whenComplete(() async {
                      {
                        setState(() {
                          _page = 0;
                        });
                        _DisplayList = [];
                        await GetRmsOverviewModel();
                      }
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //chak No.
                      Container(
                          height: 70,
                          width: 90,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Center(
                                  child: Text(_DisplayList![index].rmsNo!,
                                      textScaleFactor: 1,
                                      // textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: _DisplayList![index].oNLINE !=
                                                  'OFF'
                                              ? Colors.green
                                              : Colors.red)),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                      '( ' +
                                          _DisplayList![index]
                                              .distributaryName
                                              .toString() +
                                          '-' +
                                          _DisplayList![index]
                                              .areaName
                                              .toString() +
                                          ' )',
                                      textScaleFactor: 1,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                          color: _DisplayList![index].oNLINE !=
                                                  'OFF'
                                              ? Colors.green
                                              : Colors.red)),
                                ),
                              ),
                            ],
                          )),

                      ///Alarm Count
/*                      Container(
                        width: 70,
                        // height: 60,
                        child: Center(
                          child: Stack(children: [
                            Center(
                                child: InkWell(
                              child: Image(
                                image: AssetImage(
                                  ImageConstant.img62,
                                ),
                                height: 25,
                                width: 25,
                              ),
                              onTap: () {
                                _DisplayList![index].activeAlarm != 0
                                    ? showDialog(
                                        context: context,
                                        builder: (ctx) => AlertDialog(
                                          title: Text(
                                            "Alarms",
                                            textScaleFactor: 1,
                                          ),
                                          content: Text(
                                            "You have got an alarm on this Rms.",
                                            textScaleFactor: 1,
                                          ),
                                          actions: <Widget>[
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(ctx).pop();
                                              },
                                              child: Text(
                                                "okay",
                                                textScaleFactor: 1,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : print(
                                        'No Alarm',
                                      );
                              },
                            )),
                            _DisplayList![index].activeAlarm != 0
                                ? Positioned(
                                    top: 14.0,
                                    left: 33.0,
                                    child: Stack(
                                      children: [
                                        Icon(Icons.brightness_1,
                                            size: 20.0, color: Colors.blue),
                                        Positioned(
                                            top: 4.0,
                                            left: 6.0,
                                            child: Center(
                                              child: Text(
                                                _DisplayList![index]
                                                            .activeAlarm! <
                                                        9
                                                    ? _DisplayList![index]
                                                        .activeAlarm!
                                                        .toString()
                                                    : "9+",
                                                textAlign: TextAlign.center,
                                                textScaleFactor: 1,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 8.0,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            )),
                                      ],
                                    ))
                                : Container()
                          ]),
                        ),
                      ),
*/

                      ///damage Count
                      Container(
                        width: 60,
                        child: Center(
                          child: Wrap(
                              direction: Axis.vertical,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              spacing: 0.0,
                              children: [
                                Center(
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.0),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        color:
                                            (_DisplayList![index].totalDamage !=
                                                    0
                                                ? Colors.yellow
                                                : Colors.green),
                                        borderRadius:
                                            BorderRadius.circular(4.0)),
                                    child: Text(
                                      _DisplayList![index]
                                          .totalDamage!
                                          .toString(),
                                      textScaleFactor: 1,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                      ),

                      ///Battery level
                      Container(
                        width: 60,
                        child: Center(
                          child: Stack(
                            children: [
                              Center(
                                child: Image(
                                  image: AssetImage(getBattreydata(
                                      getBatpercentage(_DisplayList![index]
                                                  .batteryLevel !=
                                              null
                                          ? _DisplayList![index].batteryLevel!
                                          : 0.0))),
                                  width: 30,
                                  height: 30,
                                ),
                              ),
                              Positioned(
                                top: 44,
                                left: 20,
                                child: Text(
                                    getBatpercentage(_DisplayList![index]
                                                    .batteryLevel ??
                                                0.0)
                                            .toStringAsFixed(1) +
                                        "%",
                                    textScaleFactor: 1,
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700)),
                              )
                            ],
                          ),
                        ),
                      ),

                      ///last Response time
                      Container(
                        width: 80,
                        child: Center(
                          child:
                              _DisplayList![index].lastResponseTime1!.length >=
                                      19
                                  ? Text(
                                      _DisplayList![index]
                                              .lastResponseTime1!
                                              .substring(0, 10)
                                              .split('-')
                                              .reversed
                                              .join('-') +
                                          "\n" +
                                          _DisplayList![index]
                                              .lastResponseTime1!
                                              .substring(11),
                                      textScaleFactor: 1,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    )
                                  : Text(
                                      "Never Connected",
                                      textScaleFactor: 1,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                        ),
                      ),
                    ],
                  )),
            ),
            const Divider(
              height: 3,
              color: Colors.blueGrey,
            ),
          ],
        );
      },
    );
  }

  int _page = 0;
  int _limit = 20;

  // There is next page or not
  bool _hasNextPage = true;

  // Used to display loading indicators when _firstLoad function is running
  bool _isFirstLoadRunning = false;

  // Used to display loading indicators when _loadMore function is running
  bool _isLoadMoreRunning = false;

  late ScrollController _controller;

  // This function will be called when the app launches (see the initState function)
  void _firstLoad() async {
    setState(() {
      _isFirstLoadRunning = true;
    });
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? conString = preferences.getString('conString');
      String? liststatus = cheklist.join(',');
      final res = await http.get(Uri.parse(
          'http://wmsservices.seprojects.in/api/Project/RMSDisplayList?Search=$_search&_aid=$area&_did=$distibutory&_RMSStatus=$RMSStatusCheck&_DamageStatus=$DamageStatusCheck&_ListStatus=$liststatus&pageIndex=$_page&pageSize=$_limit&conString=$conString'));

      print(
          'http://wmsservices.seprojects.in/api/Project/RMSDisplayList?Search=$_search&_aid=$area&_did=$distibutory&_RMSStatus=$RMSStatusCheck&_DamageStatus=$DamageStatusCheck&_ListStatus=$liststatus&pageIndex=$_page&pageSize=$_limit&conString=$conString');

      var json = jsonDecode(res.body);
      List<RMSMastermodel> fetchedData = <RMSMastermodel>[];
      json.forEach((e) => fetchedData.add(new RMSMastermodel.fromJson(e)));
      _DisplayList = [];
      if (fetchedData.length > 0) {
        setState(() {
          _DisplayList!.addAll(fetchedData);
        });
      }
    } catch (err) {
      print('Something went wrong');
    }

    setState(() {
      _isFirstLoadRunning = false;
    });
  }

  /* void _firstLoad() async {
    setState(() {
      _isFirstLoadRunning = true;
    });
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      //int? userid = preferences.getInt('userid');
      String? conString = preferences.getString('conString');
      //String? project = preferences.getString('project');
      String? liststatus = cheklist.join(',');
      final res = await http.get(Uri.parse(
          'http://wmsservices.seprojects.in/api/Project/RMSDisplayList?Search=$_search&_aid=$area&_did=$distibutory&_RMSStatus=$RMSStatusCheck&_DamageStatus=$DamageStatusCheck&_ListStatus=$liststatus&pageIndex=$_page&pageSize=$_limit&conString=$conString'));

      print(
          'http://wmsservices.seprojects.in/api/Project/RMSDisplayList?Search=$_search&_aid=$area&_did=$distibutory&_RMSStatus=$RMSStatusCheck&_DamageStatus=$DamageStatusCheck&_ListStatus=$liststatus&pageIndex=$_page&pageSize=$_limit&conString=$conString');

      var json = jsonDecode(res.body);
      List<RMSMastermodel> fetchedData = <RMSMastermodel>[];
      json.forEach((e) => fetchedData.add(RMSMastermodel.fromJson(e)));
      _DisplayList = [];
      if (fetchedData.length > 0) {
        setState(() {
          _DisplayList!.addAll(fetchedData);
        });
      }
    } catch (err) {
      print('Something went wrong');
    }

    setState(() {
      _isFirstLoadRunning = false;
    });
  }
*/
  void _loadMore() async {
    if (_hasNextPage == true &&
        _isFirstLoadRunning == false &&
        _isLoadMoreRunning == false &&
        _controller.position.extentAfter < 300) {
      setState(() {
        _isLoadMoreRunning = true; // Display a progress indicator at the bottom
      });
      _page += 1; // Increase _page by 1
      try {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        //int? userid = preferences.getInt('userid');
        String? conString = preferences.getString('conString');
        //String? project = preferences.getString('project');
        String? liststatus = cheklist.join(',');
        final res = await http.get(Uri.parse(
            'http://wmsservices.seprojects.in/api/Project/RMSDisplayList?Search=$_search&_aid=$area&_did=$distibutory&_RMSStatus=$RMSStatusCheck&_DamageStatus=$DamageStatusCheck&_ListStatus=$liststatus&pageIndex=$_page&pageSize=$_limit&conString=$conString'));
        var json = jsonDecode(res.body);
        List<RMSMastermodel> fetchedData = <RMSMastermodel>[];
        json.forEach((e) => fetchedData.add(new RMSMastermodel.fromJson(e)));
        if (fetchedData.length > 0) {
          setState(() {
            _DisplayList!.addAll(fetchedData);
          });
        } else {
          // This means there is no more data
          // and therefore, we will not send another GET request
          setState(() {
            _hasNextPage = false;
          });
        }
      } catch (err) {
        print('Something went wrong!');
      }

      setState(() {
        _isLoadMoreRunning = false;
      });
    }
  }

  int? scount = 0;
  Future<void> getScount() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? conString = preferences.getString('conString');
      String? liststatus = cheklist.join(',');
      final response = await http.get(Uri.parse(
          'http://wmsservices.seprojects.in/api/Project/RMSDisplayListCount?Search=$_search&_aid=$area&_did=$distibutory&_RMSStatus=$RMSStatusCheck&_DamageStatus=$DamageStatusCheck&_ListStatus=$liststatus&conString=$conString'));

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        List<countModel> Result = <countModel>[];
        json.forEach((v) => Result.add(new countModel.fromJson(v)));
        setState(() {
          scount = Result.first.scount;
        });
        // if (json['Status'] == WebApiStatusOk) {

        // } else
        //   throw Exception();
      } else {
        throw Exception('Failed to load API');
      }
    } catch (e) {
      throw Exception('Failed to load API');
    }
  }

  getpop(context) {
    return showDialog(
      barrierDismissible: false,
      useSafeArea: false,
      context: context,
      builder: (ctx) => Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  _getCloseButton(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          alignment: FractionalOffset.topRight,
          child: GestureDetector(
            child: Icon(
              Icons.clear,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}
