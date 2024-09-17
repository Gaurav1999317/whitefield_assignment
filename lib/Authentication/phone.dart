import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:whitefield_assignment/Authentication/otp_verification.dart';
import 'package:whitefield_assignment/main_screen/home_screen.dart';
import 'package:whitefield_assignment/widget/customTextField.dart';
import 'package:whitefield_assignment/widget/error_dialog.dart';

class PhoneScreen extends StatefulWidget {
  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  phoneLogin() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('http://devapiv4.dealsdray.com/api/v2/user/otp'));
    request.body = json.encode({
      "mobileNumber": phoneController.text.trim(),
      "deviceId": "62b341aeb0ab5ebe28a758a3"
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

  TextEditingController phoneController = TextEditingController();

  formValidation() {
    if (phoneController.text.trim().isNotEmpty) {
      //login
      //loginNow();
      phoneLogin();
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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        const Text(
          "Glad to see you!",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Please provide your number",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Customtextfield(
          controller: phoneController,
          hintText: "Phone",
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: double.infinity,
          height: 70,
          child: ElevatedButton(
            onPressed: () {
              formValidation();
            },
            style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(255, 247, 148, 141),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: const Text(
              "SEND CODE",
              style: TextStyle(fontSize: 18),
            ),
          ),
        )
      ],
    );
  }
}
