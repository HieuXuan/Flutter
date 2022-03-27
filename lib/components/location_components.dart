import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onproperty/utils/colorscheme.dart';

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
  '13598 GA 30127',
  '4625 Careyback CA 7689',
  '4592 Eldywood,OH 45103',
  '4028 Timber Creek ,OH45623',
  '11456 57th St E Parrish',
  '67 Marvin Park,GA 30178',
  '24019 Doverwick,Tx'
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
List<String> reviews = ['29', '4', '67', '32', '12', '45', '50', '59', '67'];
List<String> name = [
  'Chapman Ford',
  'Jackie Brown',
  'Steve White',
  'Bret John',
  'Peter Shaw',
  'Branson Brown',
  'Mitchel Stark',
  'Shawn Tait',
  'Paul Phoenix'
];
listOfLocations() {
  return ListView.builder(
      itemCount: houseImg.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Row(
          children: [
            index == 0
                ? SizedBox(
                    width: 10,
                  )
                : GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'HouseDetails');
                    },
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      height: 200,
                      margin: EdgeInsets.only(right: 8.0),
                      padding: EdgeInsets.all(8.0),
                      width: MediaQuery.of(context).size.width - 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          color: Colors.white),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              margin: EdgeInsets.only(right: 6),
                              height: double.infinity,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(houseImg[index]))),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        prices[index],
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: primaryColor,
                                            fontSize: 18),
                                      ),
                                      Spacer(),
                                      CircleAvatar(
                                        maxRadius: 12,
                                        backgroundColor: primaryColor,
                                        child: Icon(
                                          Icons.favorite,
                                          color: Colors.white,
                                          size: 17,
                                        ),
                                      ),
                                    ],
                                  ),
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
                                      ],
                                    ),
                                  ),
                                  Text(
                                    addresses[index],
                                    maxLines: 2,
                                    overflow: TextOverflow.fade,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 11,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  IntrinsicHeight(
                                    child: Row(
                                      children: [
                                        Text(
                                          '3 ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        ),
                                        Text(
                                          'bds ',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        VerticalDivider(
                                          width: 1,
                                          color: Colors.grey,
                                        ),
                                        Text(
                                          ' 5 ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        ),
                                        Text(
                                          'baths ',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        VerticalDivider(
                                          width: 1,
                                          color: Colors.grey,
                                        ),
                                        Text(
                                          ' 1750 ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        ),
                                        Text(
                                          'sqft',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Row(
                                    children: [
                                      Text(
                                        'Agent: ',
                                        style: TextStyle(
                                            color: primaryColor, fontSize: 13),
                                      ),
                                      Text(
                                        name[index - 1],
                                        style: TextStyle(
                                            color: primaryColor, fontSize: 13),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
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
                                      Icon(Icons.star,
                                          size: 16, color: Colors.orange),
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
                                      Text(
                                        '(${reviews[index - 1]} Reviews)',
                                        style: TextStyle(color: Colors.grey),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ],
        );
      });
}
