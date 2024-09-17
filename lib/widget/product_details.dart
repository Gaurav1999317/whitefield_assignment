//import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final String? imageName;
  final String? productName;
  final String? discount;
  ProductDetails({this.imageName, this.productName, this.discount});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        color: Colors.white
      ),
     // height: 150,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Image.asset(
                "assets/$imageName",

                height: 170,
                ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                decoration: BoxDecoration(color: Colors.green[800]),
                child: Text(
                  "$discount%off",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10
                    ),
                  ),
              )
            ],
          ),
          Text(productName!)
        ],
      ),
    );
  }
}
