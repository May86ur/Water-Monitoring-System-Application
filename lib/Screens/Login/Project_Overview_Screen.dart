// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:WMS_Application/Model/Project/ProjectOverviewModel.dart';
import 'package:WMS_Application/Operations/StateselectionOperation.dart';
import 'package:WMS_Application/Screens/AMS/AMS_SQL_Screen.dart';
import 'package:WMS_Application/Screens/AMS/Ams_Overview_Screen.dart';
import 'package:WMS_Application/Screens/Active%20Alarm/AlarmScreen_dba.dart';
import 'package:WMS_Application/Screens/Active%20Alarm/AlarmScreen_new.dart';
import 'package:WMS_Application/Screens/Canal_Gate/Canal_Gate_Intake.dart';
import 'package:WMS_Application/Screens/Delevery%20Chamber/Delevery_Chamber_Screen_New.dart';
import 'package:WMS_Application/Screens/Login/MyDrawerScreen.dart';
import 'package:WMS_Application/Screens/Lora/lora.dart';
import 'package:WMS_Application/Screens/OMS/Oms_Screen_Updated.dart';
import 'package:WMS_Application/Screens/OMS/Oms_sql_Screen.dart';
import 'package:WMS_Application/Screens/RMS/Rms_Screen_Updated.dart';
import 'package:WMS_Application/Screens/widgets/CanalStatus_widget.dart';
import 'package:WMS_Application/Screens/widgets/Lora_gateway_widget.dart';
import 'package:WMS_Application/Screens/widgets/RMS_Widget.dart';
import 'package:WMS_Application/core/app_export.dart';
import 'package:WMS_Application/styles.dart';
import 'package:flutter/material.dart';
import 'package:WMS_Application/Screens/Pump Station/PumpStation_Screen_new.dart';
import 'package:WMS_Application/Screens/widgets/Delevery_Chamber_widget.dart';
import 'package:WMS_Application/Screens/widgets/Oms_widget.dart';
import 'package:WMS_Application/Screens/widgets/AMS_widget.dart';
import 'package:WMS_Application/Screens/widgets/PumpStation_widget.dart';
import 'package:WMS_Application/Screens/widgets/Active_Alarm_widget.dart';
// import 'package:async_builder/async_builder.dart';

class AndroidSmall5Screen extends StatefulWidget {
  String? ProjectName;
  String? ConString;
  AndroidSmall5Screen(String project, String constring) {
    ProjectName = project;
    ConString = constring;
  }

  @override
  State<AndroidSmall5Screen> createState() => _AndroidSmall5ScreenState();
}

class _AndroidSmall5ScreenState extends State<AndroidSmall5Screen> {
  Future? projectoverview;
  @override
  void initState() {
    super.initState();
    getProjectOverview();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        drawer: MyDrawerScreen(),
        appBar: AppBar(
            title: Text(
              widget.ProjectName!.toUpperCase(),
              textScaleFactor: 1,
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
            await getProjectOverview();
          },
          child: Container(
            decoration: BoxDecoration(image: backgroundImage),
            height: size.height,
            width: size.width,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: FutureBuilder(
                future: projectoverview!,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    ProjectOverviewModel data = snapshot.data!;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ///OMS
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: InkWell(
                              child: Group78ItemWidget(snapshot.data!),
                              onTap: () {
                                if (widget.ConString.toString()
                                        .contains('User ID=sa') ==
                                    true) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Oms_Screen_Sql(
                                              widget.ProjectName!)));
                                } else {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Oms_Screen_Updated(
                                                  widget.ProjectName!)));
                                }
                              },
                            ),
                          ),

                          ///AMS
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: InkWell(
                              child: Group78aItemWidget(snapshot.data!),
                              onTap: () {
                                if (widget.ConString.toString()
                                        .contains('User ID=sa') ==
                                    true) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Ams_SQL_screen(
                                              widget.ProjectName!)));
                                } else {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AmsOvervire_screen(
                                                  widget.ProjectName!)));
                                }
                              },
                            ), // AMS WIDGETS
                          ),

                          ///RMS
                          if (data.totalRms != 0)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                child: Rms_widget(snapshot.data!),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Rms_Screen_Updated(
                                                  widget.ProjectName!)));
                                  /*showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Container(
                                            child: AlertDialog(
                                                title: Center(
                                                    child: Text(
                                                  'RMS',
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
                                },
                              ),
                            ),

                          ///PS
                          if (data.noOfPS != 0)
                            Padding(
                                padding: EdgeInsets.all(10.0),
                                child: InkWell(
                                  child: Group79ItemWidget(snapshot.data!),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PumpStation_Screen(
                                                    widget.ProjectName!)));
                                  },
                                ) //PUMPING STATION WIDGETS
                                ),

                          ///DC
                          if (data.noOfDC != 0)
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: InkWell(
                                child: Group79aItemWidget(snapshot.data!,
                                    widget.ProjectName.toString()),
                                onTap: () {
                                  /* if (ConString.toString()
                                          .contains("User ID=sa") ==
                                      true) {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Container(
                                              child: AlertDialog(
                                                  title: Center(
                                                      child: Text(
                                                    'Delevery Chameber',
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
                                        });
                                  } else {*/
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Delevery_chember_Screen(
                                                  widget.ProjectName!)));
                                  // }
                                },
                              ), // DELIVERY CHAMBER WIDGETS
                            ),

                          if (data.noOfLoRaGateway != 0)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                child: Lora_gateway_widget(snapshot.data!),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoraPage()));
                                },
                              ),
                            ),

                          ///Active Alarms
                          if (data.activeAlarms != 0)
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: InkWell(
                                child: Group80ItemWidget(snapshot.data!),
                                onTap: () {
                                  if (widget.ConString.toString()
                                          .contains("User ID=sa") ==
                                      true) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ActiveAlarm_new(
                                                    widget.ProjectName!)));
                                    /*showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Container(
                                              child: AlertDialog(
                                                  title: Center(
                                                      child: Text(
                                                    'Active Alarm',
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
                                  } else {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ActiveAlarm_dba(
                                                    widget.ProjectName!)));
                                  }
                                },
                              ), // ACTIVE ALARMS WIDGETS
                            ),

                          if (data.canalStatus != null)
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: InkWell(
                                child: CanalStatusWidget(snapshot.data!),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Canal_Gate_Intake_Screen(
                                                  widget.ProjectName!)));
                                },
                              ), // ACTIVE ALARMS WIDGETS
                            ),
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Container(
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.all(15),
                      width: size.width,
                      height: size.height * 0.2,
                      decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(
                          child: Text(
                        "Data Not Available.",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: ColorConstant.cyan302),
                      )),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future getProjectOverview() async {
    var data = GetProjectOverviewStatus();
    setState(() {
      projectoverview = data;
    });
  }
}
