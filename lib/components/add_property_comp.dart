import 'package:flutter/material.dart';
import 'package:onproperty/utils/colorscheme.dart';



addPropertyTextField(String title) {
  return Container(
    height: 50,
    child: TextFormField(
      style: TextStyle(fontSize: 16),
      keyboardType: TextInputType.text,
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(
          left: 15,
        ),
        fillColor: Color(0xfffafafa),
        filled: true,
        hintText: title,
        hintStyle: TextStyle(color: Colors.grey[500]),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: Colors.grey[300])),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: primaryColor)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          // borderSide: BorderSide(color: Colors.orange)
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          //borderSide: BorderSide(color: Colors.orange)
        ),
      ),
    ),
  );
}
