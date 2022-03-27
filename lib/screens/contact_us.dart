import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onproperty/components/contact_us_components.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Column(
                  children: [
                    bannerForContactUs(context),
                    Expanded(
                      child: Container(
                        color: Colors.transparent,
                      ),
                    )
                  ],
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height*0.3-40,
                  child: tabViewForContactUs(context),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }


}
