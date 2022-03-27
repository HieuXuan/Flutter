import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'colorscheme.dart';


const TextStyle kh1=TextStyle(
  fontWeight: FontWeight.bold,
      fontSize: 20
);

const TextStyle kh2=TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18
);
const TextStyle kh3=TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16
);
const TextStyle kh4=TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 14
);

 BoxDecoration roundCorners=BoxDecoration(
borderRadius:BorderRadius.circular(30.0),
color: primaryColor);


 final optInputDecoration=InputDecoration(
hintText: '0',
   enabledBorder: OutlineInputBorder(
       borderRadius: BorderRadius.circular(10.0),
       borderSide: BorderSide(color: Colors.grey)
   ),

   focusedBorder: OutlineInputBorder(
       borderRadius: BorderRadius.circular(10.0),
       borderSide: BorderSide(color: primaryColor)
   ),
     border: OutlineInputBorder(
 borderRadius: BorderRadius.circular(10.0),
),
     disabledBorder: OutlineInputBorder(
 borderRadius: BorderRadius.circular(10.0),
)
 );