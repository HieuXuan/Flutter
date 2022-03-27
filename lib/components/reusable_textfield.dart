import 'package:flutter/material.dart';
import 'package:onproperty/utils/colorscheme.dart';

Container reusableTextField({@required String hint,Icon icon}) {
  return Container(
    height: 50,
    decoration: BoxDecoration(
        border: Border.all(color: primaryColor),
        borderRadius: BorderRadius.circular(30.0)),
    child: TextField(
      obscureText: hint == 'Enter Password' ? true : false,
      autocorrect: false,
      cursorColor: primaryColor,
      decoration: InputDecoration(
        prefixIcon: icon,
        contentPadding: EdgeInsets.only(left: 16.0),
        suffixIcon: hint == 'Enter Password'
            ? GestureDetector(onTap: () {}, child: Icon(Icons.visibility))
            : null,
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Color(0xfff5f6f6),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          borderSide: BorderSide(color: Colors.transparent),
        ),
      ),
    ),
  );
}
