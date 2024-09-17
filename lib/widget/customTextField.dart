import 'package:flutter/material.dart';

class Customtextfield extends StatelessWidget {
  final TextEditingController? controller;
  final IconData? iconData;

  final String? hintText;
  bool? isObsecur = true;

  Customtextfield({
    this.controller,
    this.iconData,
    this.hintText,
    this.isObsecur,
  });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: Icon(iconData),
            hintStyle: const TextStyle(
              fontSize: 20,
            )),
      ),
    );
  }
}
