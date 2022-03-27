import 'package:flutter/material.dart';
import 'package:onproperty/components/profile_components.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey[100],
          body: Column(
            children: [
              Expanded(
                child: anotherList(),
              ),
            ],
          )),
    );
  }
}
