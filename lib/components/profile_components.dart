import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onproperty/components/home_componets.dart';
import 'package:onproperty/models/user_model.dart';
import 'package:onproperty/utils/colorscheme.dart';
import 'package:onproperty/utils/constants.dart';

List<String> prices = [
  '\$567,900',
  '\$335,900',
  '\$289,700',
  '\$470,000',
  '\$224,670',
  '\$490,270',
  '\$300,600',
  '\$651,230',
  '\$980,000',
  '\$300,000',
];
List<String> addresses = [
  '16523 Choke Cherry Dr,Victorville,CA 8728',
  'Station,Hampton,GA 23423',
  '129 Hoper Ln,Folsom,CA 95300',
  '13598 Lagrone St,Powder Springs,GA 30127',
  '4625 Careyback Ave,Elk Grove,CA 7689',
  '4592 Eldywood Ln Batavia,OH 45103',
  '4028 Timber Creek Dr, Cincinnati,OH45623',
  '11456 57th St E Parrish,Fl 341219',
  '67 Marvin Park,Powder Springs,GA 30178',
  '24019 Doverwick Dr Tomball,Tx'
];
List<String> houseImg = [
  'assets/images/house.jpg',
  'assets/images/house1.jpg',
  'assets/images/house2.jpg',
  'assets/images/house3.jpg',
  'assets/images/house4.jpg',
  'assets/images/house5.jpg',
  'assets/images/house6.jpg',
  'assets/images/house7.jpg',
  'assets/images/house8.jpg',
  'assets/images/house9.jpg'
];

Widget firstHalf(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.45,
    width: MediaQuery.of(context).size.width,
    margin: EdgeInsets.only(bottom: 10.0),
    color: Colors.white,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(
          maxRadius: 60,
          backgroundImage: AssetImage('assets/images/john.jpg'),
        ),
        Text(
          'Xuan Hieu',
          style: kh1,
        ),
        Text(
          'Ha Noi City',
          style: TextStyle(color: Colors.grey),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'ContactUs');
          },
          child: Container(
            height: 30,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), color: primaryColor),
            child: Center(
              child: Text(
                'Message',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Divider(),
        ),
        Container(
          height: 40,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'Followers');
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '50',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Followers',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'Properties');
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '60',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Properties',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 30,
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'Following'),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '60',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Followings',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Divider(),
        ),
      ],
    ),
  );
}

anotherList() {
  return ListView.builder(
      itemCount: 10,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return index == 0
            ? firstHalf(context)
            : GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'HouseDetails');
                },
                child: thirdComponent(index));
      });
}
