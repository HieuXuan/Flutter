
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:onproperty/utils/colorscheme.dart';

import '../screens/home.dart';
import '../screens/opt_screen.dart';
import '../screens/sign_in.dart';
import '../screens/sign_up.dart';


class CustomBottomNavigatioBar extends StatefulWidget {
  @override
  _CustomBottomNavigatioBarState createState() => _CustomBottomNavigatioBarState();
}

class _CustomBottomNavigatioBarState extends State<CustomBottomNavigatioBar> {
  int _currentTab = 0;
  Widget currentScreen = Home();
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: Container(
        height: 55,
        padding: EdgeInsets.only(top: 10.0),
        child: Row(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.20,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        currentScreen = Home();
                        _currentTab = 0;
                      });
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.home,
                          color: _currentTab == 0
                              ? primaryColor
                              : Color(0xffb2b2b2),
                        ),
                        Text(
                          'Home',
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.20,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        currentScreen = SignIn();
                        _currentTab = 1;
                      });
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.chat_bubble,
                          color: _currentTab == 1
                              ? primaryColor
                              : Color(0xffb2b2b2),
                        ),
                        Text('Chat', style: TextStyle(fontSize: 12))
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.20,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        currentScreen = SignUp();
                        _currentTab = 2;
                      });
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.notifications,
                          color: _currentTab == 2
                              ? primaryColor
                              : Color(0xffb2b2b2),
                        ),
                        Text('Notifications', style: TextStyle(fontSize: 12))
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.20,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        currentScreen = OtpScreen();
                        _currentTab = 3;
                      });
                    },
                    child: Column(
                      children: [
                        SvgPicture.asset('assets/icons/fb.png',
                            height: 23,
                            color: _currentTab == 3
                                ? primaryColor
                                : Color(0xffb2b2b2)),
                        SizedBox(
                          height: 1,
                        ),
                        Text('Trend', style: TextStyle(fontSize: 12))
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
