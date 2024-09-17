import 'dart:convert';

import 'package:flutter/material.dart';
//import 'package:http/http.dart';

import 'package:toggle_switch/toggle_switch.dart';
import 'package:whitefield_assignment/Authentication/email_screen.dart';
import 'package:whitefield_assignment/Authentication/otp_verification.dart';
import 'package:whitefield_assignment/Authentication/phone.dart';
import 'package:whitefield_assignment/widget/customTextField.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  List<String> labels = ["phone", "email"];
  int counter = 0;

  bool toggleValue = false;

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
            // mainAxisAlignment: MainAxisAlignment.center,
            //mainAxisSize: MainAxisSize.min,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset("assets/dealsdray_logo.png"),
             
              const SizedBox(
                height: 20,
              ),
              ToggleSwitch(
                labels: labels,
                cornerRadius: 50,
                activeBgColor: const [Color.fromARGB(255, 209, 86, 77)],
                activeFgColor: Colors.white,
                inactiveFgColor: Colors.black,
                inactiveBgColor: const Color.fromARGB(255, 229, 227, 227),
                minWidth: 90,
                onToggle: (index) {
                  counter = index!;
                  setState(() {});
                },
                initialLabelIndex: counter,
              ),
              const SizedBox(
                height: 30,
              ),

              counter == 0 ? PhoneScreen() : EmailScreen()
            ],
          ),
        ),
      ),
      
    );
  }
}
