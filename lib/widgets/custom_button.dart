import 'package:flutter/material.dart';
import 'package:onproperty/utils/colorscheme.dart';

class CustomButton extends StatelessWidget {
  final Function callback;
  final String title;
  final Function onPressed;

  CustomButton({this.callback, this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0), color: primaryColor),
        child: Center(
            child: Text(
          title,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
        )),
      ),
    );
  }
}
