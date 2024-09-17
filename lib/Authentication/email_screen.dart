import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:whitefield_assignment/Authentication/otp_verification.dart';
import 'package:whitefield_assignment/widget/customTextField.dart';
import 'package:whitefield_assignment/widget/error_dialog.dart';

class EmailScreen extends StatefulWidget {
  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  emailLogin() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST',
        Uri.parse('http://devapiv4.dealsdray.com/api/v2/user/email/referral'));
    request.body = json.encode({
      "email": "muhammedrafnasvk@gmail.com",
      "password": "1234Rafnas",
      "referralCode": 12345678,
      "userId": "62a833766ec5dafd6780fc85"
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OtpScreen(),
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

  formValidation() {
    if (emailController.text.trim().isNotEmpty &&
        passwordController.text.trim().isNotEmpty) {
      //login
      //loginNow();
      emailLogin();
    } else {
      showDialog(
        context: context,
        builder: (c) {
          return ErrorDialog(
            message: "Please fill the mandatory fields",
          );
        },
      );
    }
  }

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController referralController = TextEditingController();

  bool _isVisibility = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Let's Begin!",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Please enter your credentials to proceed",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Customtextfield(
          controller: emailController,
          hintText: "email",
        ),
        TextFormField(
          controller: passwordController,
          decoration: InputDecoration(
              hintText: "Create Password",
              hintStyle: TextStyle(
                fontSize: 20,
              ),
              suffixIcon: IconButton(
                  padding: EdgeInsetsDirectional.only(end: 12),
                  onPressed: () {
                    setState(() {
                      _isVisibility = !_isVisibility;
                    });
                  },
                  icon: _isVisibility
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility))),
          obscureText: _isVisibility,
        ),
        Customtextfield(
          controller: referralController,
          hintText: "Referral Code(Optional)",
        ),
        const SizedBox(
          height: 60,
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: SizedBox(
            width: 70,
            height: 50,
            child: ElevatedButton(
                onPressed: () {
                  formValidation();
                },
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color.fromARGB(255, 223, 72, 61),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 40, 10),
                  child: Icon(
                    Icons.arrow_right_alt_sharp,
                    color: Colors.white,
                    size: 30,
                  ),
                )),
          ),
        )
      ],
    );
  }
}
