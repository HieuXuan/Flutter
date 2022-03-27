import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onproperty/utils/colorscheme.dart';
class BannerForAddProperty extends StatefulWidget {
  @override
  _BannerForAddPropertyState createState() => _BannerForAddPropertyState();
}

class _BannerForAddPropertyState extends State<BannerForAddProperty> {
  bool forSaleSelected = true;
  bool forRentSelected = false;
  bool forBuySelected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 230,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/house.jpg'))),
        child: Container(
          color: Colors.black.withOpacity(0.4),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: CircleAvatar(
                        maxRadius: 20,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.arrow_back,
                          color: primaryColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'ADD PROPERTY',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    Spacer(),
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
                                color: Colors.white,
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
                                color: Colors.white,
                                height: 20,
                              ),
                            )),
                        onTap: () {
                          Navigator.pushNamed(context, 'Notifications');
                        }),
                  ],
                ),
              ),


              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 40.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              forSaleSelected=true;
                              forBuySelected=false;
                              forRentSelected=false;
                              print(forSaleSelected);
                            });
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: forSaleSelected == true
                                  ? primaryColor
                                  : Colors.white,
                              borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(20.0),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'FOR SALE',
                                style: TextStyle(
                                    color: forSaleSelected == true
                                        ? Colors.white
                                        : Colors.grey),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              forSaleSelected=false;
                              forBuySelected=true;
                              forRentSelected=false;
                            });
                          },
                          child: Container(
                            height: 50,
                            width: 10,
                            decoration: BoxDecoration(
                                color: forBuySelected == true
                                    ? primaryColor
                                    : Colors.white),
                            child: Center(
                                child: Text(
                                  'FOR BUY',
                                  style: TextStyle(
                                      color: forBuySelected == true
                                          ? Colors.white
                                          : Colors.grey),
                                )),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              forSaleSelected=false;
                              forBuySelected=false;
                              forRentSelected=true;
                            });
                          },
                          child: Container(
                            height: 50,
                            width: 10,
                            decoration: BoxDecoration(
                              color: forRentSelected == true
                                  ? primaryColor
                                  : Colors.white,
                              borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(20.0),
                              ),
                            ),
                            child: Center(
                                child: Text(
                                  'FOR RENT',
                                  style: TextStyle(
                                    color: forRentSelected == true
                                        ? Colors.white
                                        : Colors.grey,
                                  ),
                                )),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),

            ],
          ),
        ));
  }
}
