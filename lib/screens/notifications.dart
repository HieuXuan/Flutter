import 'package:flutter/material.dart';
import 'package:onproperty/models/notification_model.dart';
import 'package:onproperty/screens/profile.dart';
import 'package:onproperty/utils/colorscheme.dart';

class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        title: Text(
          'Notifications',
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
          Icon(
            Icons.more_vert,
            color: Colors.black,
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: notificationList(),
    );
  }

  notificationList() {
    List<NotificationModel> myNotificationsList = [
      NotificationModel(
        img: 'assets/images/person1.jpg',
        notification: 'Ayaz sent you a friend request',
      ),
      NotificationModel(
        img: 'assets/images/person2.jpeg',
        notification: 'Kevin sent you a friend request from Kepp Trucking',
      ),
      NotificationModel(
        img: 'assets/images/person3.png',
        notification: 'Charles approved your request to join the group',
      ),
      NotificationModel(
        img: 'assets/images/person4.jpg',
        notification: 'Quincy Mauger sent you a friend request from general',
      ),
      NotificationModel(
        img: 'assets/images/person5.png',
        notification: 'John Bryant sent you a friend request from J.B Hunt',
      ),
      NotificationModel(
        img: 'assets/images/person6.jpeg',
        notification: 'Ayaz sent you a friend request',
      ),
      NotificationModel(
        img: 'assets/images/person7.jpg',
        notification: 'Kevin sent you a friend request from Kepp Trucking,',
      ),
      NotificationModel(
        img: 'assets/images/person8.jpg',
        notification: 'Charles approved your request to join the group',
      ),
      NotificationModel(
          img: 'assets/images/person9.jpg',
          notification: 'John Bryant sent you a friend request from J.B Hunt'),
      NotificationModel(
        img: 'assets/images/person5.png',
        notification: 'John Bryant sent you a friend request from J.B Hunt',
      ),
      NotificationModel(
        img: 'assets/images/person6.jpeg',
        notification: 'Ayaz sent you a friend request',
      ),
    ];

    return ListView.builder(
        itemCount: myNotificationsList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              index == 0
                  ? SizedBox(
                      height: 10,
                    )
                  : GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Profile(),
                          ),
                        );
                      },
                      child: Container(
                        height: 80,
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  maxRadius: 30,
                                  backgroundImage: AssetImage(
                                      myNotificationsList[index - 1].img),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        width: 270,
                                        child: Text(
                                          myNotificationsList[index - 1]
                                              .notification,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '08 August,2020',
                                      style: TextStyle(color: primaryColor),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Divider()
                          ],
                        ),
                      ),
                    ),
            ],
          );
        });
  }
}
