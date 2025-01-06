import 'package:flutter/material.dart';

class CustomChat extends StatelessWidget {
  const CustomChat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        // width: 150,
        // height: 65,
        // alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
        child: Text(
          "data",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
