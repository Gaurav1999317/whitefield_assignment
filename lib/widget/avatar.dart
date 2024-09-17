import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Avatar extends StatelessWidget {
  final IconData? iconData;
  Color? color;

  final String? text;
  Avatar({
    this.iconData, 
    this.text,
    this.color
    });

  @override
  Widget build(context) {
    return Container(
      child: Column(
        children: [
          CircleAvatar(
            radius: 35,
            
            backgroundColor: color,
            child: Icon(
              iconData,
              color: Colors.white,
              size: 40,
              ),
              
          ),
          const SizedBox(height: 10,),
          Text(text!)
        ],
      ),
    );
  }
}
