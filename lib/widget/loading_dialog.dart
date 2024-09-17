import "package:flutter/material.dart";

import "package:whitefield_assignment/widget/progress_bar.dart";

class LoadingDialog extends StatelessWidget {
  LoadingDialog({this.message});
  final String? message;

  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          circularProgress(),
          const SizedBox(height: 10,),
           Text("${message!} Please wait....")

          
        ],
      ),
      
    );
  }
}