import 'package:flutter/material.dart';


socialMediaButton({Function callback, String img, String text,Color color}) {
  return GestureDetector(
    onTap: callback,
    child: Container(
      height: 50,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.0),
        color:color??Colors.white,
      ),
      child: Row(
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Image.asset(
                img,
                height: 40,
              )),
          Text(
            text,
            style: TextStyle(fontWeight: FontWeight.w700),
          )
        ],
      ),
    ),
  );
}