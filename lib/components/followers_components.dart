import 'package:flutter/material.dart';
import 'package:onproperty/utils/colorscheme.dart';



ListView followersList() {
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
  List<String> personNames=['Aiden Ken','Paul Phoenix','Ricardo John','John Smith ','Joe Smith ','Juan Carlos','Mike Jones ','David Smith','Peter Parker','Tony Hector'];


  return ListView.builder(
      itemCount: images.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
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
                              image: AssetImage(images[index]),
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
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    personNames[index],
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Container(
                    height: 30,
                    width: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        border: Border.all(color: primaryColor)),
                    child: Center(
                        child: Text(
                          'FOLLOW',
                          style: TextStyle(color: primaryColor),
                        )),
                  )
                ],
              ),
            ),
          ],
        );
      });
}