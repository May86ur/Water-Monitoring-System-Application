// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable
import 'package:WMS_Application/main.dart';
import 'package:flutter/material.dart';
import 'package:WMS_Application/Screens/Login/login_page_screen.dart';
import 'package:WMS_Application/Screens/Login/State_List_Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawerScreen extends StatefulWidget {
  @override
  State<MyDrawerScreen> createState() => _MyDrawerScreenState();
}

class _MyDrawerScreenState extends State<MyDrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: <Color>[Colors.green, Colors.blue])),
              child: Center(
                child: Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(150.0)),
                    child: Image.asset(
                      'assets/images/img_2068991.png',
                      height: 150,
                      width: 150,
                    )),
              )),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                child: Text("WATER MONITORING SYSTEM",
                    textScaleFactor: 1,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10.0, 3.0, 0.0, 0.0),
                child: Text(
                  'WMS Mobile Application',
                  textScaleFactor: 1,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10.0, 3.0, 0.0, 10.0),
                child: Text('App Version-v1.4',
                    textScaleFactor: 1,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                    )),
              ),
            ],
          ),
          //Process Monitoring

          ListTile(
            leading: ImageIcon(
              AssetImage("assets/images/monitor.png"),
              //  color: Color(0xFF3A5A98),
            ),
            title: Text(
              'PROCESS MONITORING',
              textScaleFactor: 1,
            ),
            // trailing: Icon(
            //   Icons.arrow_right_sharp,
            //   color: Colors.green,
            //   size: 20,
            // ),
            onTap: (() {
              // Navigator.popAndPushNamed(context, '/firstScreen');
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => ProjectsCategoryScreen()),
                (Route<dynamic> route) => false,
              );
            }),
          ),
          Divider(),

          //System Monitoring
          if (MyApp.usertype != 'Engineer_Client' || MyApp.usertype != 'Cli') //
            ListTile(
              leading: ImageIcon(
                AssetImage("assets/images/system_monitering_new.png"),
                //  color: Color(0xFF3A5A98),
              ),
              title: Text(
                'SYSTEM MONITORING',
                textScaleFactor: 1,
              ),
              // trailing: Icon(
              //   Icons.arrow_right_sharp,
              //   color: Colors.green,
              //   size: 20,
              // ),
              onTap: (() {
                // Navigator.pushAndRemoveUntil(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => SystemMonitoring()),
                //   (Route<dynamic> route) => false,
                // );
                Navigator.popAndPushNamed(context, '/secondScreen');
                // pushReplacement(context, MaterialPageRoute(builder: ((context) => SystemMonitoring())));
                // push(context, MaterialPageRoute(builder: (context) => SystemMonitoring()));
              }),
            ),
          if (MyApp.usertype != 'Engineer_Client' || MyApp.usertype != 'Cli')
            Divider(),
          //Add New User
          if (MyApp.usertype != 'Engineer_Client' ||
              MyApp.usertype != 'Cli') //_Clinet
            ListTile(
              leading: ImageIcon(
                AssetImage("assets/images/add-friend.png"),
                //  color: Color(0xFF3A5A98),
              ),
              title: Text(
                'ADD NEW USER',
                textScaleFactor: 1,
              ),
              // trailing: Icon(
              //   Icons.arrow_right_sharp,
              //   color: Colors.green,
              //   size: 20,
              // ),
              onTap: (() {}),
            ),
          if (MyApp.usertype != 'Engineer_Client' || MyApp.usertype != 'Cli')
            Divider(),

          //Change Password
          ListTile(
            leading: ImageIcon(
              AssetImage("assets/images/password.png"),
              //  color: Color(0xFF3A5A98),
            ),
            title: Text(
              'CHANGE PASSWORD',
              textScaleFactor: 1,
            ),
            onTap: (() {
              Navigator.popAndPushNamed(context, '/thirdScreen');
              /*Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => ChangePassword()),
                (Route<dynamic> route) => false,
              );*/
            }),
          ),
          Divider(),
          //Logout
          ListTile(
              leading: ImageIcon(
                AssetImage("assets/images/log-out.png"),
                //  color: Color(0xFF3A5A98),
              ),
              title: Text(
                'LOGOUT',
                textScaleFactor: 1,
              ),
              // trailing: Icon(
              //   Icons.arrow_right_sharp,
              //   color: Colors.green,
              //   size: 20,
              // ),
              onTap: () async {
                SharedPreferences preferences =
                    await SharedPreferences.getInstance();
                await preferences.clear();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPageScreen()),
                  (Route<dynamic> route) => false,
                );
              }),
        ],
      ),
    );
  }

  /*getUsertype() {
    try {
      setState(() async {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        usertype = preferences.getString('usertype')!;
      });
    } catch (_, e) {
      print(e);
    }
  }*/
}
