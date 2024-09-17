import "package:flutter/material.dart";

class ErrorDialog extends StatelessWidget {
  ErrorDialog({this.message});
  final String? message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(message!),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          child: const Center(
            child: Text("Ok"),
          ),
        ),
      ],
    );
  }
}
