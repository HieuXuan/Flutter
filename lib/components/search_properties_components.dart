
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onproperty/utils/constants.dart';
import 'package:onproperty/widgets/heart_container.dart';



List<String> prices=['\$567,900','\$335,900','\$289,700','\$470,000','\$224,670','\$490,270','\$300,600','\$651,230','\$980,000','\$300,000',];
List<String> addresses=['16523 Choke Cherry Dr,Victorville,CA 8728','Station,Hampton,GA 23423','129 Hoper Ln,Folsom,CA 95300','13598 Lagrone St,Powder Springs,GA 30127','4625 Careyback Ave,Elk Grove,CA 7689','4592 Eldywood Ln Batavia,OH 45103','4028 Timber Creek Dr, Cincinnati,OH45623','11456 57th St E Parrish,Fl 341219','67 Marvin Park,Powder Springs,GA 30178','24019 Doverwick Dr Tomball,Tx' ];
List<String> houseImg=['assets/images/house.jpg','assets/images/house1.jpg','assets/images/house2.jpg','assets/images/house3.jpg','assets/images/house4.jpg','assets/images/house5.jpg','assets/images/house6.jpg','assets/images/house7.jpg','assets/images/house8.jpg','assets/images/house9.jpg'];

listOfProperties() {
  return ListView.builder(
      itemCount: houseImg.length,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, 'HouseDetails');
                },
                child: Card(
                  margin: EdgeInsets.only(bottom: 10.0, left: 8.0, right: 8.0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  child: Container(
                    height: 140,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Container(
                            margin: EdgeInsets.only(
                                right: 18.0, top: 8.0, left: 8.0, bottom: 8.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(houseImg[index]))),
                          ),
                        ),
                        Expanded(
                            flex: 6,
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
                                    style: TextStyle(color: Colors.grey, fontSize: 11),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  IntrinsicHeight(
                                    child: Row(
                                      children: [
                                        Text(
                                          '3 ',
                                          style: TextStyle(fontWeight: FontWeight.bold),
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
                                          style: TextStyle(fontWeight: FontWeight.bold),
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
                                          style: TextStyle(fontWeight: FontWeight.bold),
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
                                    padding: const EdgeInsets.only(bottom:8.0),
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
                                      HeartContainer(index)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                ))
          ],
        );
      });
}

