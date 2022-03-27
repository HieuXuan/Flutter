import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onproperty/utils/colorscheme.dart';

List<String> images = [
  'assets/images/person1.jpg',
  'assets/images/person2.jpeg',
  'assets/images/person3.png',
  'assets/images/person4.jpg',
  'assets/images/person5.png',
  'assets/images/person6.jpeg',
  'assets/images/person7.jpg',
  'assets/images/person8.jpg',
  'assets/images/person9.jpg',
  'assets/images/person10.jpg',
];
List<String> msgStatus = [
  'Read...',
  'Pending...',
  'Read...',
  'Read...',
  'Read...',
  'Read...',
  'Pending...',
  'Read...',
  'Read...',
  'Pending...'
];
List<String> msg = [
  'Hey !Please make sure to Check my document',
  'Hello!',
  'Hey pal! I need a favour from you',
  'We will meet at 10 p.m',
  'What\'s the status of your work',
  'Please! email your resume at the mentioned email address',
  'Let\'s have some coffee tonight',
  ' I will be at office at sharp 8 a.m',
  'Can we meet',
  'Just received your docs!'
];
List<String> personNames = [
  'John Smith',
  'Paul Phoenix',
  'Ricardo John',
  'John Smith ',
  'Joe Smith ',
  'Juan Carlos',
  'Mike Jones ',
  'David Smith',
  'Peter Parker',
  'Tony Hector'
];
verticalChatList(BuildContext context, int index) {
  return Padding(
    padding: const EdgeInsets.only(
      left: 8.0,
      right: 8.0,
    ),
    child: GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'InnerChat');
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*...............Chat Bubble.........................*/
                Stack(
                  children: [
                    Container(
                      child: Container(
                        height: 60,
                        width: 60,
                        margin: EdgeInsets.only(right: 8.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            alignment: Alignment.topCenter,
                            fit: BoxFit.cover,
                            image: AssetImage(images[index - 1]),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        right: 2,
                        bottom: 12,
                        child: CircleAvatar(
                          maxRadius: 6,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            backgroundColor: Color(0xff51ce6a),
                            maxRadius: 5,
                          ),
                        ))
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          personNames[index - 1],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          msg[index - 1],
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 11,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            Text(
                              '2m ago',
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black45),
                            ),
                            Spacer(),
                            Text(msgStatus[index - 1],
                                style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w300,
                                    color: msgStatus[index - 1] == 'Read...'
                                        ? primaryColor
                                        : Colors.grey)),
                            Icon(
                              Icons.done_all,
                              size: 15,
                              color: msgStatus[index - 1] == 'Read...'
                                  ? primaryColor
                                  : Colors.grey,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider()
        ],
      ),
    ),
  );
}
