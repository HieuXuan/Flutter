import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

locationIcon(BuildContext context){
  return    GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, 'Location');
    },
    child: Container(
        height: 40,
        width: 40,
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: SvgPicture.asset(
            'assets/icons/location.svg',
            color: Color(0xff979696),
            height: 20,
          ),
        )),
  );
}