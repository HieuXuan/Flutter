import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onproperty/models/user_model.dart';
import 'package:onproperty/screens/sign_in.dart';
import 'package:onproperty/utils/colorscheme.dart';

import '../screens/dashboard.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  User user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
            children: [
              Container(
                height: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        print('dashboard');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DashBoard(
                                      page: 4,
                                    )));
                      },
                      child: Container(
                        height: 75,
                        margin: EdgeInsets.only(left: 12, right: 6.0),
                        width: 75,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                                image: AssetImage('assets/images/john.jpg'))),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "${loggedInUser.firstName} ${loggedInUser.lastName}",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    Text(
                      '',
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    )
                  ],
                ),
              ),
              Divider(
                color: dividerColor,
              ),
              drawerTile(
                  title: 'Home',
                  svgIconLoc: 'assets/icons/home_drawer.svg',
                  routeName: 'Dashboard'),
              Divider(
                color: dividerColor,
              ),
              drawerTile(
                  title: 'Tạo bài đăng',
                  svgIconLoc: 'assets/icons/add_property.svg',
                  routeName: 'AddProperty'),
              Divider(
                color: dividerColor,
              ),
              drawerTile(
                  title: 'Tìm Kiếm',
                  svgIconLoc: 'assets/icons/search_property.svg',
                  routeName: 'SearchProperty'),
              Divider(
                color: dividerColor,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DashBoard(
                              page: 1,
                            )),
                  );
                },
                child: Container(
                  height: 40,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      SvgPicture.asset(
                        'assets/icons/new_project.svg',
                        color: dividerTextColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Các dự án mới',
                        style: TextStyle(color: dividerTextColor),
                      )
                    ],
                  ),
                ),
              ),
              Divider(
                color: dividerColor,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => DashBoard(page: 2)),
                  );
                },
                child: Container(
                  height: 40,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      SvgPicture.asset(
                        'assets/icons/favourite.svg',
                        color: dividerTextColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Yêu thích',
                        style: TextStyle(color: dividerTextColor),
                      )
                    ],
                  ),
                ),
              ),
              Divider(
                color: dividerColor,
              ),
              drawerTile(
                  title: 'Tìm kiếm đã lưu',
                  svgIconLoc: 'assets/icons/saved_searches.svg',
                  routeName: 'SavedSearches'),
              Divider(
                color: dividerColor,
              ),
              drawerTile(
                  title: 'Agents',
                  svgIconLoc: 'assets/icons/agents.svg',
                  routeName: 'Agents'),
              Divider(
                color: dividerColor,
              ),
              drawerTile(
                  title: 'Tin tức',
                  svgIconLoc: 'assets/icons/news_and_blog.svg',
                  routeName: 'NewsAndBlog'),
              Divider(
                color: dividerColor,
              ),
              drawerTile(
                  title: 'About Us',
                  svgIconLoc: 'assets/icons/about_us.svg',
                  routeName: 'AboutUs'),
              Divider(
                color: dividerColor,
              ),
              drawerTile(
                  title: 'Liên hệ',
                  svgIconLoc: 'assets/icons/contact_us.svg',
                  routeName: 'ContactUs'),
              Divider(
                color: dividerColor,
              ),
              drawerTile(
                  title: 'Terms and Policies',
                  svgIconLoc: 'assets/icons/terms_and_privacy.svg',
                  routeName: 'TermsAndConditions'),
              Divider(
                color: dividerColor,
              ),
              drawerTile(
                  title: 'Settings',
                  svgIconLoc: 'assets/icons/setting.svg',
                  routeName: 'Settings'),
              Divider(
                color: dividerColor,
              ),
              drawerTile(
                  title: 'Log Out',
                  svgIconLoc: 'assets/icons/logout.svg',
                  routeName: 'SignIn'),
              Divider(
                color: dividerColor,
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  drawerTile({String title, String svgIconLoc, String routeName}) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Container(
        height: 40,
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            SvgPicture.asset(
              svgIconLoc,
              color: dividerTextColor,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: TextStyle(color: dividerTextColor),
            )
          ],
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => SignIn()));
  }
}
