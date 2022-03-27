import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

notificationIcon(BuildContext context){
  return  GestureDetector(
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
              'assets/icons/bell.svg',
              color: Color(0xff979696),
              height: 20,
            ),
          )),
      onTap: () {
        Navigator.pushNamed(context, 'Notifications');
        print('Appbar opening');
      });
}