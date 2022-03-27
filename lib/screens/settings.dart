import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onproperty/utils/colorscheme.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _isSwitched1 = true;
  bool _isSwitched2 = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.grey),
        ),
        iconTheme: IconThemeData(color: Colors.grey),
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
                      color: Colors.grey,
                      height: 20,
                    ),
                  )),
              onTap: () {
                Navigator.pushNamed(context, 'Location');
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
                      color: Colors.grey,
                      height: 20,
                    ),
                  )),
              onTap: () {
                Navigator.pushNamed(context, 'Notifications');
              }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              _profileImg(),
              SizedBox(
                height: 10,
              ),
              Text('Name'),
              TextField(
                cursorColor: primaryColor,
                decoration: InputDecoration(
                    hintText: 'Xuan Hieu',
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: primaryColor))),
              ),
              SizedBox(
                height: 15,
              ),
              Text('Email'),
              TextField(
                cursorColor: primaryColor,
                decoration: InputDecoration(
                    hintText: 'xuanhieu@gmail.com',
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: primaryColor))),
              ),
              SizedBox(
                height: 15,
              ),
              Text('Address'),
              TextField(
                cursorColor: primaryColor,
                decoration: InputDecoration(
                    hintText: 'Ha Noi City',
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: primaryColor))),
              ),
              SizedBox(
                height: 15,
              ),
              Text('Phone number'),
              TextField(
                cursorColor: primaryColor,
                decoration: InputDecoration(
                    hintText: '+84 334 859652',
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: primaryColor))),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'FACEBOOK',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Spacer(),
                  Switch(
                      value: _isSwitched1,
                      onChanged: (val) {
                        setState(() {
                          _isSwitched1 = val;
                          print(val);
                        });
                      })
                ],
              ),
              Divider(),
              Row(
                children: [
                  Text(
                    'NOTIFICATIONS',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Spacer(),
                  Switch(
                      value: _isSwitched2,
                      onChanged: (val) {
                        setState(() {
                          _isSwitched2 = val;
                          print(val);
                        });
                      })
                ],
              ),
              Divider(),
            ],
          ),
        ),
      ),
    ));
  }

  _profileImg() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.20,
      alignment: Alignment.bottomCenter,
      child: Stack(
        children: [
          CircleAvatar(
            maxRadius: 70,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage('assets/images/john.jpg'),
          ),
          Positioned(
              right: 0,
              top: MediaQuery.of(context).size.height * 0.15 / 2 + 35,
              child: CircleAvatar(
                backgroundColor: Colors.grey[300],
                child: Icon(
                  Icons.camera_alt,
                  color: primaryColor,
                ),
              ))
        ],
      ),
    );
  }
}
