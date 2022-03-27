import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onproperty/components/myleads_components.dart';



class MyLeads extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(elevation: 1,
        backgroundColor: Colors.white,
        title: Text(
          'My Leads',
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        actions: [
          GestureDetector(
              child: Container(
                  height: 40,
                  width: 40,
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.transparent),
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: SvgPicture.asset(
                      'assets/icons/location.svg',
                      color: Colors.black,
                      height: 20,
                    ),
                  )),
              onTap: () {
                Scaffold.of(context).openDrawer();
                print('Appbar opening');
              }),
          GestureDetector(
              child: Container(
                  height: 40,
                  width: 40,
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.transparent),
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: SvgPicture.asset(
                      'assets/icons/bell.svg',
                      color: Colors.black,
                      height: 20,
                    ),
                  )),
              onTap: () {
                Scaffold.of(context).openDrawer();
                print('Appbar opening');
              }),
        ],
      ),
      body: myLeadsAgentsList(),
    ));
  }
}
