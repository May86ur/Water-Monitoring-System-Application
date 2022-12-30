// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

import 'package:WMS_Application/Model/Project/OmsMasterModel.dart';
import 'package:WMS_Application/Model/Project/ScheduleMasterModel.dart';
import 'package:WMS_Application/Screens/Login/MyDrawerScreen.dart';
import 'package:WMS_Application/styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:WMS_Application/core/app_export.dart';
import 'package:shared_preferences/shared_preferences.dart';

OmsMasterModel? modelData;

class Schedule_Screen extends StatefulWidget {
  String? ProjectName;

  Schedule_Screen(String project, OmsMasterModel? _modelData) {
    ProjectName = project;
    modelData = _modelData ?? null;
  }
  @override
  State<Schedule_Screen> createState() => _Schedule_ScreenState();
}

class _Schedule_ScreenState extends State<Schedule_Screen> {
  int dropdownvalue = 1;
  List<int> items = [];
  List<ScheduleMasterModel>? _DisplayList = <ScheduleMasterModel>[];

  @override
  void initState() {
    super.initState();
    setState(() {
      _DisplayList = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    for (var i = 1; i <= modelData!.subChakQty!; i++) {
      items.add(i);
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        drawer: MyDrawerScreen(),
        appBar: AppBar(
            title: Text(
              'New Page',
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
        body: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(image: backgroundImage),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ///Chak No. & Sub Chak No.
                /*DropdownButton(
                  value: dropdownvalue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: items.map((items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items.toString()),
                    );
                  }).toList(),
                  onChanged: (int? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  },
                ),
                */
                DropdownButton(
                  value: items.first,
                  underline: Container(color: Colors.transparent),
                  isExpanded: true,
                  items: items.map((int items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Center(
                        child: Text(
                          items.toString(),
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
                      dropdownvalue = textvalue as int;
                    });
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
