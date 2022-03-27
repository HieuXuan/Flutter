import 'package:flutter/material.dart';
import 'package:onproperty/screens/dashboard.dart';
import 'package:onproperty/utils/colorscheme.dart';


appBarForChatScreen(BuildContext context) {
  return PreferredSize(
      preferredSize: Size(double.infinity, 100),
      child: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 1)
        ]),
        height: 56,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                print('presses');

                Navigator.pop(context);
              },
              child: Container(
                height: 40,
                width: 40,
                padding: EdgeInsets.all(8.0),
                margin: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Icon(
                    Icons.arrow_back,
                    color: Color(0xff979696),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DashBoard(page:4),
                  ),
                );
              },
              child: Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 45,
                        child: Container(
                          height: 40,
                          width: 40,
                          margin: EdgeInsets.only(
                              left: 0.0, right: 8.0, top: 8.0, bottom: 8.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage('assets/images/john.jpg'),
                                fit: BoxFit.fill),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 2,
                        top: 30,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          maxRadius: 5,
                          child: CircleAvatar(
                            maxRadius: 4,
                            backgroundColor: Color(0xff51ce6a),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('John Smith'),
                      Text(
                        'online',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'AudioCall');
              },
              child: Container(
                  height: 40,
                  width: 40,
                  padding: EdgeInsets.all(4.0),
                  margin: EdgeInsets.only(
                      left: 0.0, right: 0.0, top: 0.0, bottom: 0.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Icon(
                    Icons.phone,
                    color: Colors.grey,
                  )),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'VideoCall');
              },
              child: Container(
                  height: 40,
                  width: 40,
                  padding: EdgeInsets.all(4.0),
                  margin: EdgeInsets.only(
                      left: 8.0, right: 8.0, top: 8.0, bottom: 8.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Icon(Icons.videocam, color: Colors.grey)),
            ),

          ],
        ),
      ));
}

userChatBubble(String message) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 40,
            alignment: Alignment.topCenter,

            padding: EdgeInsets.symmetric(horizontal: 18.0),
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0))),
            child: Center(
                child: Text(
              message,
              style: TextStyle(color: Colors.white),
            )),
          ),
        ],
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        '4.15 pm',
        style: TextStyle(color: Colors.grey, fontSize: 12),
      )
    ],
  );
}

otherUserChatBubble(String message) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Container(
            height: 40,
            padding: EdgeInsets.symmetric(horizontal: 18.0),
            decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0))),
            child: Center(
                child: Text(
              message,
              style: TextStyle(color: Colors.white),
            )),
          ),
        ],
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        '4.15 pm',
        style: TextStyle(color: Colors.grey, fontSize: 12),
      )
    ],
  );
}
