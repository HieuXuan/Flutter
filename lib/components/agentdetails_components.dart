import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onproperty/utils/colorscheme.dart';
import 'package:onproperty/utils/constants.dart';
import 'package:onproperty/widgets/heart_container.dart';


firstHalfOfAgentDetails(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.40,
    width: MediaQuery.of(context).size.width,
    color: Colors.grey[100],
    child: Column(
      children: [
        SizedBox(
          height: 80,
        ),
        CircleAvatar(
          maxRadius: 60,
          backgroundImage: AssetImage('assets/images/john.jpg'),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'John Smith',
          style: kh1,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          'New York,USA',
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.star,
              size: 16,
              color: Colors.orange,
            ),
            Icon(
              Icons.star,
              size: 16,
              color: Colors.orange,
            ),
            Icon(
              Icons.star,
              size: 16,
              color: Colors.orange,
            ),
            Icon(
              Icons.star,
              size: 16,
              color: Colors.orange,
            ),
            Icon(
              Icons.star,
              size: 16,
              color: Colors.orange,
            ),
            Text('(5.0)')
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 30),
          padding: EdgeInsets.all(8.0),
          height: 30,
          width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: primaryColor),
          child: Center(
            child: Text(
              'CONTACT US',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    ),
  );
}

introduction() {
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
  List<String> houseImgs = [
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

  return ListView.builder(
      itemCount: prices.length,
      itemBuilder: (context, index) {
        return index == 0
            ? SizedBox(
                height: 10,
              )
            : GestureDetector(
          onTap:(){
            Navigator.pushNamed(context, 'HouseDetails');
          },
              child: Card(
                  margin: EdgeInsets.only(bottom: 10.0, left: 8.0, right: 8.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Container(
                    height: 120,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            margin: EdgeInsets.only(
                                right: 18.0, top: 8.0, left: 8.0, bottom: 8.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(houseImgs[index]))),
                          ),
                        ),
                        Expanded(
                            flex: 3,
                            child: Container(
                              padding: EdgeInsets.only(
                                top: 8.0,
                                right: 8.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    prices[index],
                                    style: kh2,
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    addresses[index],
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 11),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  IntrinsicHeight(
                                    child: Row(
                                      children: [
                                        Text(
                                          '4 ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'bds ',
                                        ),
                                        VerticalDivider(
                                          width: 1,
                                          color: Colors.grey,
                                        ),

                                        Text(
                                          ' 5 ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'baths ',
                                        ),
                                        VerticalDivider(
                                          width: 1,
                                          color: Colors.grey,
                                        ),

                                        Text(
                                          ' 1,767 ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'sqft',
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          maxRadius: 5,
                                          backgroundColor: Colors.green,
                                        ),
                                        Text(
                                          ' House for Sale',
                                          style: TextStyle(fontSize: 12),
                                        ),

                                        Spacer(),
                                       HeartContainer(index),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
            );
      });
}

reusableCard(String price, address, img) {
  return Card(
    elevation: 2,
    margin: EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    child: Container(
      height: 105,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(
                  right: 18.0, top: 8.0, left: 8.0, bottom: 8.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      fit: BoxFit.fill, image: AssetImage(img))),
            ),
          ),
          Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.only(
                    right: 18.0, top: 8.0, left: 8.0, bottom: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'HOME',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      address,
                      style: TextStyle(color: Colors.grey, fontSize: 11),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 13,
                        ),
                        Text(
                          ' 4.5',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Estimated Price',
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              price,
                              style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )),
        ],
      ),
    ),
  );
}

Container contactInformation(TabController tabController) {
  return Container(
      height: 200,
      padding: EdgeInsets.all(18.0),
      child: Column(
        children: [
          customListTile(
              Icons.place, 'Address', '000 Susan Apartemnet,New York, USA'),
          SizedBox(
            height: 15,
          ),
          customListTile(Icons.phone_in_talk, 'Phone Number',
              '+123 456 789 | +789 234 567 '),
          SizedBox(
            height: 15,
          ),
          customListTile(Icons.email, 'Email Us', 'info@youremail.com'),
          SizedBox(
            height: 15,
          ),
          customListTile(Icons.language, 'Website URL', 'www.yourdomain.com')
        ],
      ));
}

Row customListTile(IconData iconData, String title, subtitle) {
  return Row(
    children: [
      Icon(
        iconData,
        color: primaryColor,
        size: 30,
      ),
      SizedBox(
        width: 10,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            subtitle,
            style: TextStyle(color: Colors.grey),
          )
        ],
      )
    ],
  );
}
