import 'package:flutter/material.dart';
import 'package:onproperty/components/followers_components.dart';


class Followers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
      appBar: AppBar(iconTheme: IconThemeData(color:  Color(0xff979696)),
        backgroundColor: Colors.white,
        elevation: 2,
        title: Text('Followers',style: TextStyle(color: Colors.black),),
      ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                child: followersList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
