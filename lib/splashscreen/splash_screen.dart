import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whitefield_assignment/Authentication/login_screen.dart';
import 'package:whitefield_assignment/widget/error_dialog.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  startTimer() {
    Timer(
      const Duration(seconds: 5),
      () async {
        var headers = {
  'Content-Type': 'application/json'
};
var request = http.Request('POST', Uri.parse('http://devapiv4.dealsdray.com/api/v2/user/device/add'));
request.body = json.encode({
  "deviceType": "andriod",
  "deviceId": "C6179909526098",
  "deviceName": "Samsung-MT200",
  "deviceOSVersion": "2.3.6",
  "deviceIPAddress": "11.433.445.66",
  "lat": 9.9312,
  "long": 76.2673,
  "buyer_gcmid": "",
  "buyer_pemid": "",
  "app": {
    "version": "1.20.5",
    "installTimeStamp": "2022-02-10T12:33:30.696Z",
    "uninstallTimeStamp": "2022-02-10T12:33:30.696Z",
    "downloadTimeStamp": "2022-02-10T12:33:30.696Z"
  }
});
request.headers.addAll(headers);

http.StreamedResponse response = await request.send();

        if (response.statusCode == 200) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        } else {
          print(response.statusCode);
          
          showDialog(
            context: context,
            builder: (c) {
              return ErrorDialog(
                message: response.reasonPhrase.toString(),
              );
            },
          );
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  "assets/dealsdraysplashscreen.png",
                  
                  height: 300,
                  ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.all(18.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
