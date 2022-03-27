import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:onproperty/screens/signup_with_options.dart';
import 'package:onproperty/utils/colorscheme.dart';



class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    new Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => SignUpWithOptions()));
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light));

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: primaryColor.withOpacity(0.4),
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage('assets/images/house.jpg')),
        ),
        child: Center(child: Image.asset(
              'assets/images/splash_img.png',
              height: 350,
              width: 350,color: Colors.white,
            ),),

      ),
    );
  }
}
