// ignore_for_file: must_call_super, non_constant_identifier_names, must_be_immutable

import 'dart:async';

import 'package:WMS_Application/Screens/Login/ChangePassword.dart';
import 'package:WMS_Application/Screens/Login/login_page_screen.dart';
import 'package:WMS_Application/Screens/Login/splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/Login/State_List_Screen.dart';
import 'Screens/SystemMonitoring/SystemMonitoring_New.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await SharedPreferences.getInstance();
  runApp(MyApp());
}

late Widget? showFirstScreen;

class MyApp extends StatefulWidget {
  static String? usertype = '';
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    getInitialScreen().whenComplete(() => setState(() {
          isFirstLoad = false;
        }));
  }

  bool isFirstLoad = true;

  Future<void> getInitialScreen() async {
    String mobileno = '';
    var userType = '';
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      mobileno = preferences.getString('mobileno')!;
      userType = preferences.getString('usertype')!;
    } catch (Exception) {}

    showFirstScreen =
        mobileno.length > 0 ? ProjectsCategoryScreen() : LoginPageScreen();
    await Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () async {
      String mobileno = '';
      var userType = '';
      try {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        mobileno = preferences.getString('mobileno')!;
        userType = preferences.getString('usertype')!;
        setState(() {
          MyApp.usertype = userType;
        });
      } catch (Exception) {}

      showFirstScreen =
          mobileno.length > 0 ? ProjectsCategoryScreen() : LoginPageScreen();
    });
    return MaterialApp(
      // initialRoute: '/firstScreen',
      routes: {
        '/firstScreen': (context) => ProjectsCategoryScreen(),
        '/secondScreen': (context) => SystemMonitoring_New(),
        '/thirdScreen': (context) => ChangePassword(),
      },
      debugShowCheckedModeBanner: false,
      title: 'WMS_Application',
      home: isFirstLoad ? SplashScreen() : showFirstScreen,
    );
  }
}
