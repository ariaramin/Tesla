import 'package:flutter/material.dart';
import '../constants/colors.dart';

class PrimaryButton extends StatelessWidget {
  String title = "";
  Null Function() function;
  PrimaryButton(this.title, this.function, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      width: 274,
      child: OutlinedButton(
        onPressed: function,
        style: OutlinedButton.styleFrom(
          foregroundColor: MaterialStateColor.resolveWith((states) => red),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(38),
          ),
          side: BorderSide(
            width: 2,
            color: red,
          ),
        ),
        child: Text(
          title.toUpperCase(),
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}