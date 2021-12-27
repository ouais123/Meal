import 'package:flutter/material.dart';

class ErrorLoadImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 275,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            size: 40,
            color: Colors.red,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            "No Network",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
