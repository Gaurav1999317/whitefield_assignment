import 'dart:async';
import 'dart:convert';
import 'package:pinput/pinput.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whitefield_assignment/main_screen/home_screen.dart';
import 'package:whitefield_assignment/widget/error_dialog.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  static const int _initialSeconds = 120;
  late Timer _timer;
  int _currentSeconds = _initialSeconds;
  otpVerifificaton() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST',
        Uri.parse(
            'http://devapiv4.dealsdray.com/api/v2/user/otp/verification'));
    request.body = json.encode({
      "otp": code.trim(),
      "deviceId": "62b43472c84bb6dac82e0504",
      "userId": "62b43547c84bb6dac82e0525"
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (c) {
          return ErrorDialog(
            message: response.reasonPhrase.toString(),
          );
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _currentSeconds = _initialSeconds;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_currentSeconds == 0) {
        timer.cancel();
      } else {
        setState(() {
          _currentSeconds--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String get _formattedTime {
    final minutes = (_currentSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (_currentSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  String code = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Icon(Icons.chevron_left_outlined)),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/otp_Screen.png",
                height: 200,
              ),
              const Text(
                "OTP Verification",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
              ),
              const Text(
                "We have sent a unique OTP number ",
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              const Text(
                "to you mobile +91-9765232817",
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              Pinput(
                length: 4,
                onChanged: (value) {
                  setState(() {
                    //code = value;
                  });
                },
                onSubmitted: (value) {
                  print("on Submitted called");
                  if (value.length == 4) {
                    // code = value;
                    //otpVerifificaton();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _formattedTime,
                    style: const TextStyle(fontSize: 20),
                  ),
                  InkWell(
                    onTap: _startTimer,
                    child: const Text(
                      "SEND AGAIN",
                      style: TextStyle(
                          decoration: TextDecoration.underline, fontSize: 20),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
