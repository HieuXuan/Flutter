import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onproperty/utils/colorscheme.dart';
import 'package:onproperty/utils/constants.dart';

class Filters extends StatefulWidget {
  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  static double _lowerValue = 1000.0;
  static double _upperValue = 10000.0;
  RangeValues values = RangeValues(_lowerValue, _upperValue);
  List<bool> buttonLookingFor = [false, false];
  List<bool> isSelected = [false, true];
  List<bool> propertyType = [false, false, false, false, false, false];
  List<bool> isSelectedPropertyType = [false, true, true, true, true, true];
  bool selectedColorForPropertyType1 = true;
  bool selectedColorForPropertyType2 = false;
  bool selectedColorForPropertyType3 = false;
  List searchPropertyCategories = [true, true, true, true];
  List selectedSearchPropertyCategories = [false, false, false, false];

  List<bool> bedRooms = [
    true,
    false,
    false,
    false,
    false,
  ];
  List<bool> bedRoomsSelected = [true, true, true, true, true];
  List<bool> bathRooms = [
    true,
    false,
    false,
    false,
    false,
  ];
  List<bool> bathRoomsSelected = [true, true, true, true, true];
  int selectedView;

  @override
  void initState() {
    super.initState();

    selectedView = 0;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> propertyViews = [
      _residentialView(),
      _commercialView(),
      _industrialView()
    ];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          title: Text(
            'Bộ lọc',
            style: TextStyle(color: Colors.black),
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
            Center(
                child: GestureDetector(
              onTap: () {
                for (int i = 1; i <= 4; i++) {
                  setState(() {
                    bedRoomsSelected[i] = true;
                  });
                }
              },
              child: Text(
                'Reset',
                style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            )),
            SizedBox(
              width: 10,
            )
          ],
        ),
        body: ListView(
          children: [
            /*............................Looking For Button...............................*/
            Container(
              height: MediaQuery.of(context).size.height * 0.12,
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Text(
                    'LOOKING FOR',
                    style: kh3,
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () => setState(() {
                      isSelected[0] = !isSelected[0];
                      if (isSelected[1] == buttonLookingFor[1] &&
                          isSelected[0] == buttonLookingFor[0]) {
                        isSelected[1] = !isSelected[1];
                      }
                    }),
                    child: Container(
                      height: 50,
                      width: 90,
                      decoration: BoxDecoration(
                          color: buttonLookingFor[0] == isSelected[0]
                              ? primaryColor
                              : Colors.grey[300],
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(30.0))),
                      child: Center(
                        child: Text(
                          'FOR SALE',
                          style: TextStyle(
                            color: buttonLookingFor[0] == isSelected[0]
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setState(() {
                      isSelected[1] = !isSelected[1];
                      if (isSelected[0] == buttonLookingFor[0]) {
                        isSelected[0] = !isSelected[0];
                      }
                    }),
                    child: Container(
                      height: 50,
                      width: 90,
                      decoration: BoxDecoration(
                          color: buttonLookingFor[1] == isSelected[1]
                              ? primaryColor
                              : Colors.grey[300],
                          borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(30.0))),
                      child: Center(
                          child: Text(
                        'FOR RENT',
                        style: TextStyle(
                          color: buttonLookingFor[1] == isSelected[1]
                              ? Colors.white
                              : Colors.black,
                        ),
                      )),
                    ),
                  )
                ],
              ),
            ),
            Divider(),
            SizedBox(height: 30),
            /*.............Residential, Commercial, Industrial Buttons*/
            _rowOfButtons(),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: propertyViews[selectedView],
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.13,
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        'PRICE RANGE',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        '\$',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(values.start.truncateToDouble().toString(),
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(
                        '    -   \$',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(values.end.truncateToDouble().toString(),
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(
                        width: 23,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(trackHeight: 2),
                    child: RangeSlider(
                      activeColor: primaryColor,
                      inactiveColor: Colors.grey,
                      min: _lowerValue,
                      max: _upperValue,
                      values: values,
                      onChanged: (val) {
                        print(val);
                        setState(() {
                          values = val;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            /* ............................Bedrooms.......................*/
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'BEDROOMS',
                      style: kh3,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            bedRoomsSelected[0] = !bedRoomsSelected[0];
                          });
                        },
                        child: Container(
                          height: 50,
                          width: 70,
                          decoration: BoxDecoration(
                              color: bedRoomsSelected[0] == bedRooms[0]
                                  ? primaryColor
                                  : Colors.grey[300],
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(30.0))),
                          child: Center(
                            child: Text(
                              '1',
                              style: TextStyle(
                                  color: bedRoomsSelected[0] == bedRooms[0]
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            bedRoomsSelected[1] = !bedRoomsSelected[1];
                          });
                        },
                        child: Container(
                          height: 50,
                          width: 70,
                          color: bedRoomsSelected[1] == bedRooms[1]
                              ? primaryColor
                              : Colors.grey[300],
                          child: Center(
                            child: Text(
                              '2',
                              style: TextStyle(
                                  color: bedRoomsSelected[1] == bedRooms[1]
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            bedRoomsSelected[2] = !bedRoomsSelected[2];
                          });
                        },
                        child: Container(
                          height: 50,
                          width: 70,
                          color: bedRoomsSelected[2] == bedRooms[2]
                              ? primaryColor
                              : Colors.grey[300],
                          child: Center(
                            child: Text(
                              '3',
                              style: TextStyle(
                                  color: bedRoomsSelected[2] == bedRooms[2]
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            bedRoomsSelected[3] = !bedRoomsSelected[3];
                          });
                        },
                        child: Container(
                          height: 50,
                          width: 70,
                          color: bedRoomsSelected[3] == bedRooms[3]
                              ? primaryColor
                              : Colors.grey[300],
                          child: Center(
                            child: Text(
                              '4',
                              style: TextStyle(
                                  color: bedRoomsSelected[3] == bedRooms[3]
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            bedRoomsSelected[4] = !bedRoomsSelected[4];
                          });
                        },
                        child: Container(
                          height: 50,
                          width: 70,
                          decoration: BoxDecoration(
                              color: bedRoomsSelected[4] == bedRooms[4]
                                  ? primaryColor
                                  : Colors.grey[300],
                              borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(30.0))),
                          child: Center(
                            child: Text(
                              '4+',
                              style: TextStyle(
                                  color: bedRoomsSelected[4] == bedRooms[4]
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            /* ...........................Bathrooms..............*/
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'BATHROOMS',
                      style: kh3,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            bathRoomsSelected[0] = !bathRoomsSelected[0];
                          });
                        },
                        child: Container(
                          height: 50,
                          width: 70,
                          decoration: BoxDecoration(
                              color: bathRoomsSelected[0] == bathRooms[0]
                                  ? primaryColor
                                  : Colors.grey[300],
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(30.0))),
                          child: Center(
                            child: Text(
                              '1',
                              style: TextStyle(
                                  color: bathRoomsSelected[0] == bathRooms[0]
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            bathRoomsSelected[1] = !bathRoomsSelected[1];
                          });
                        },
                        child: Container(
                          height: 50,
                          width: 70,
                          color: bathRoomsSelected[1] == bathRooms[1]
                              ? primaryColor
                              : Colors.grey[300],
                          child: Center(
                            child: Text(
                              '2',
                              style: TextStyle(
                                  color: bathRoomsSelected[1] == bathRooms[1]
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            bathRoomsSelected[2] = !bathRoomsSelected[2];
                          });
                        },
                        child: Container(
                          height: 50,
                          width: 70,
                          color: bathRoomsSelected[2] == bathRooms[2]
                              ? primaryColor
                              : Colors.grey[300],
                          child: Center(
                            child: Text(
                              '3',
                              style: TextStyle(
                                  color: bathRoomsSelected[2] == bathRooms[2]
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            bathRoomsSelected[3] = !bathRoomsSelected[3];
                          });
                        },
                        child: Container(
                          height: 50,
                          width: 70,
                          color: bathRoomsSelected[3] == bathRooms[3]
                              ? primaryColor
                              : Colors.grey[300],
                          child: Center(
                            child: Text(
                              '4',
                              style: TextStyle(
                                  color: bathRoomsSelected[3] == bathRooms[3]
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            bathRoomsSelected[4] = !bathRoomsSelected[4];
                          });
                        },
                        child: Container(
                          height: 50,
                          width: 70,
                          decoration: BoxDecoration(
                              color: bathRoomsSelected[4] == bathRooms[4]
                                  ? primaryColor
                                  : Colors.grey[300],
                              borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(30.0))),
                          child: Center(
                            child: Text(
                              '4+',
                              style: TextStyle(
                                  color: bathRoomsSelected[4] == bathRooms[4]
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'SeeAllScreen');
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 14, left: 8.0, right: 8.0),
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: primaryColor),
                child: Center(
                    child: Text(
                  'Show Properties',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }

  _rowOfButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedView = 0;
                  selectedColorForPropertyType1 = true;
                  if (selectedColorForPropertyType2 == true ||
                      selectedColorForPropertyType3 == true) {
                    selectedColorForPropertyType3 = false;
                    selectedColorForPropertyType2 = false;
                  }
                  print(selectedView);
                });
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    color: selectedColorForPropertyType1 == true
                        ? primaryColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                        color: selectedColorForPropertyType1 == true
                            ? primaryColor
                            : Colors.grey[300])),
                child: Center(
                  child: Text(
                    'Residential',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: selectedColorForPropertyType1 == true
                            ? Colors.white
                            : Colors.black),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedView = 1;
                  print(selectedView);
                  selectedColorForPropertyType2 = true;
                  if (selectedColorForPropertyType1 == true ||
                      selectedColorForPropertyType3 == true) {
                    selectedColorForPropertyType1 = false;
                    selectedColorForPropertyType3 = false;
                  }
                });
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    color: selectedColorForPropertyType2 == true
                        ? primaryColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                        color: selectedColorForPropertyType2 == true
                            ? primaryColor
                            : Colors.grey[300])),
                child: Center(
                  child: Text(
                    'Commerical',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: selectedColorForPropertyType2 == true
                            ? Colors.white
                            : Colors.black),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedView = 2;
                  print(selectedView);
                  selectedColorForPropertyType3 = true;
                  if (selectedColorForPropertyType2 == true ||
                      selectedColorForPropertyType1 == true) {
                    selectedColorForPropertyType1 = false;
                    selectedColorForPropertyType2 = false;
                  }
                });
              },
              child: Container(
                height: 40,
                width: 120,
                decoration: BoxDecoration(
                    color: selectedColorForPropertyType3 == true
                        ? primaryColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                        color: selectedColorForPropertyType3 == true
                            ? primaryColor
                            : Colors.grey[300])),
                child: Center(
                  child: Text('Industrial',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: selectedColorForPropertyType3 == true
                            ? Colors.white
                            : Colors.black,
                      )),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _residentialView() {
    return Container(
      height: 120,
      width: double.infinity,
      margin: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedSearchPropertyCategories[0] =
                        !selectedSearchPropertyCategories[0];
                    if (selectedSearchPropertyCategories[1] =
                        searchPropertyCategories[1]) {
                      selectedSearchPropertyCategories[1] =
                          !searchPropertyCategories[1];
                      if (selectedSearchPropertyCategories[2] =
                          searchPropertyCategories[2]) {
                        selectedSearchPropertyCategories[2] =
                            !searchPropertyCategories[2];
                        if (selectedSearchPropertyCategories[3] =
                            searchPropertyCategories[3]) {
                          selectedSearchPropertyCategories[3] =
                              !searchPropertyCategories[3];
                        }
                      }
                    }
                  });
                },
                child: CircleAvatar(
                  maxRadius: 36,
                  backgroundColor: selectedSearchPropertyCategories[0] ==
                          searchPropertyCategories[0]
                      ? primaryColor
                      : Colors.grey,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: 35,
                    child: SvgPicture.asset(
                      'assets/icons/house.svg',
                      color: selectedSearchPropertyCategories[0] ==
                              searchPropertyCategories[0]
                          ? primaryColor
                          : Colors.grey,
                      height: 35,
                      width: 35,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Residential',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 13),
              )
            ],
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedSearchPropertyCategories[1] =
                        !selectedSearchPropertyCategories[1];
                    if (selectedSearchPropertyCategories[0] =
                        searchPropertyCategories[0]) {
                      selectedSearchPropertyCategories[0] =
                          !searchPropertyCategories[0];
                      if (selectedSearchPropertyCategories[2] =
                          searchPropertyCategories[2]) {
                        selectedSearchPropertyCategories[2] =
                            !searchPropertyCategories[2];
                        if (selectedSearchPropertyCategories[3] =
                            searchPropertyCategories[3]) {
                          selectedSearchPropertyCategories[3] =
                              !searchPropertyCategories[3];
                        }
                      }
                    }
                  });
                },
                child: CircleAvatar(
                  maxRadius: 36,
                  backgroundColor: selectedSearchPropertyCategories[1] ==
                          searchPropertyCategories[1]
                      ? primaryColor
                      : Colors.grey,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: 35,
                    child: SvgPicture.asset(
                      'assets/icons/appartment.svg',
                      color: selectedSearchPropertyCategories[1] ==
                              searchPropertyCategories[1]
                          ? primaryColor
                          : Colors.grey,
                      height: 35,
                      width: 35,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Commercial',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 13),
              )
            ],
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedSearchPropertyCategories[2] =
                        !selectedSearchPropertyCategories[2];
                    if (selectedSearchPropertyCategories[1] =
                        searchPropertyCategories[1]) {
                      selectedSearchPropertyCategories[1] =
                          !searchPropertyCategories[1];
                      if (selectedSearchPropertyCategories[0] =
                          searchPropertyCategories[0]) {
                        selectedSearchPropertyCategories[0] =
                            !searchPropertyCategories[0];
                        if (selectedSearchPropertyCategories[3] =
                            searchPropertyCategories[3]) {
                          selectedSearchPropertyCategories[3] =
                              !searchPropertyCategories[3];
                        }
                      }
                    }
                  });
                },
                child: CircleAvatar(
                  maxRadius: 36,
                  backgroundColor: selectedSearchPropertyCategories[2] ==
                          searchPropertyCategories[2]
                      ? primaryColor
                      : Colors.grey,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: 35,
                    child: SvgPicture.asset(
                      'assets/icons/Uper.svg',
                      color: selectedSearchPropertyCategories[2] ==
                              searchPropertyCategories[2]
                          ? primaryColor
                          : Colors.grey,
                      height: 35,
                      width: 35,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Upper portion',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 13),
              )
            ],
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedSearchPropertyCategories[3] =
                        !selectedSearchPropertyCategories[3];
                    if (selectedSearchPropertyCategories[1] =
                        searchPropertyCategories[1]) {
                      selectedSearchPropertyCategories[1] =
                          !searchPropertyCategories[1];
                      if (selectedSearchPropertyCategories[2] =
                          searchPropertyCategories[2]) {
                        selectedSearchPropertyCategories[2] =
                            !searchPropertyCategories[2];
                        if (selectedSearchPropertyCategories[0] =
                            searchPropertyCategories[0]) {
                          selectedSearchPropertyCategories[0] =
                              !searchPropertyCategories[0];
                        }
                      }
                    }
                  });
                },
                child: CircleAvatar(
                  maxRadius: 36,
                  backgroundColor: selectedSearchPropertyCategories[3] ==
                          searchPropertyCategories[3]
                      ? primaryColor
                      : Colors.grey,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: 35,
                    child: SvgPicture.asset(
                      'assets/icons/Lower.svg',
                      color: selectedSearchPropertyCategories[3] ==
                              searchPropertyCategories[3]
                          ? primaryColor
                          : Colors.grey,
                      height: 35,
                      width: 35,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Lower portion',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 13),
              )
            ],
          ),
        ],
      ),
    );
  }

  _commercialView() {
    return Container(
      height: 120,
      margin: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedSearchPropertyCategories[2] =
                        !selectedSearchPropertyCategories[2];
                    if (selectedSearchPropertyCategories[1] =
                        searchPropertyCategories[1]) {
                      selectedSearchPropertyCategories[1] =
                          !searchPropertyCategories[1];
                      if (selectedSearchPropertyCategories[0] =
                          searchPropertyCategories[0]) {
                        selectedSearchPropertyCategories[0] =
                            !searchPropertyCategories[0];
                        if (selectedSearchPropertyCategories[3] =
                            searchPropertyCategories[3]) {
                          selectedSearchPropertyCategories[3] =
                              !searchPropertyCategories[3];
                        }
                      }
                    }
                  });
                },
                child: CircleAvatar(
                  maxRadius: 36,
                  backgroundColor: selectedSearchPropertyCategories[2] ==
                          searchPropertyCategories[2]
                      ? primaryColor
                      : Colors.grey,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: 35,
                    child: SvgPicture.asset(
                      'assets/icons/Uper.svg',
                      color: selectedSearchPropertyCategories[2] ==
                              searchPropertyCategories[2]
                          ? primaryColor
                          : Colors.grey,
                      height: 35,
                      width: 35,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Upper portion',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 13),
              )
            ],
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedSearchPropertyCategories[3] =
                        !selectedSearchPropertyCategories[3];
                    if (selectedSearchPropertyCategories[1] =
                        searchPropertyCategories[1]) {
                      selectedSearchPropertyCategories[1] =
                          !searchPropertyCategories[1];
                      if (selectedSearchPropertyCategories[2] =
                          searchPropertyCategories[2]) {
                        selectedSearchPropertyCategories[2] =
                            !searchPropertyCategories[2];
                        if (selectedSearchPropertyCategories[0] =
                            searchPropertyCategories[0]) {
                          selectedSearchPropertyCategories[0] =
                              !searchPropertyCategories[0];
                        }
                      }
                    }
                  });
                },
                child: CircleAvatar(
                  maxRadius: 36,
                  backgroundColor: selectedSearchPropertyCategories[3] ==
                          searchPropertyCategories[3]
                      ? primaryColor
                      : Colors.grey,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: 35,
                    child: SvgPicture.asset(
                      'assets/icons/Lower.svg',
                      color: selectedSearchPropertyCategories[3] ==
                              searchPropertyCategories[3]
                          ? primaryColor
                          : Colors.grey,
                      height: 35,
                      width: 35,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Lower portion',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 13),
              )
            ],
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedSearchPropertyCategories[0] =
                        !selectedSearchPropertyCategories[0];
                    if (selectedSearchPropertyCategories[1] =
                        searchPropertyCategories[1]) {
                      selectedSearchPropertyCategories[1] =
                          !searchPropertyCategories[1];
                      if (selectedSearchPropertyCategories[2] =
                          searchPropertyCategories[2]) {
                        selectedSearchPropertyCategories[2] =
                            !searchPropertyCategories[2];
                        if (selectedSearchPropertyCategories[3] =
                            searchPropertyCategories[3]) {
                          selectedSearchPropertyCategories[3] =
                              !searchPropertyCategories[3];
                        }
                      }
                    }
                  });
                },
                child: CircleAvatar(
                  maxRadius: 36,
                  backgroundColor: selectedSearchPropertyCategories[0] ==
                          searchPropertyCategories[0]
                      ? primaryColor
                      : Colors.grey,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: 35,
                    child: SvgPicture.asset(
                      'assets/icons/house.svg',
                      color: selectedSearchPropertyCategories[0] ==
                              searchPropertyCategories[0]
                          ? primaryColor
                          : Colors.grey,
                      height: 35,
                      width: 35,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Residential',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 13),
              )
            ],
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedSearchPropertyCategories[1] =
                        !selectedSearchPropertyCategories[1];
                    if (selectedSearchPropertyCategories[0] =
                        searchPropertyCategories[0]) {
                      selectedSearchPropertyCategories[0] =
                          !searchPropertyCategories[0];
                      if (selectedSearchPropertyCategories[2] =
                          searchPropertyCategories[2]) {
                        selectedSearchPropertyCategories[2] =
                            !searchPropertyCategories[2];
                        if (selectedSearchPropertyCategories[3] =
                            searchPropertyCategories[3]) {
                          selectedSearchPropertyCategories[3] =
                              !searchPropertyCategories[3];
                        }
                      }
                    }
                  });
                },
                child: CircleAvatar(
                  maxRadius: 36,
                  backgroundColor: selectedSearchPropertyCategories[1] ==
                          searchPropertyCategories[1]
                      ? primaryColor
                      : Colors.grey,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: 35,
                    child: SvgPicture.asset(
                      'assets/icons/appartment.svg',
                      color: selectedSearchPropertyCategories[1] ==
                              searchPropertyCategories[1]
                          ? primaryColor
                          : Colors.grey,
                      height: 35,
                      width: 35,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Commercial',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 13),
              )
            ],
          ),
        ],
      ),
    );
  }

  _industrialView() {
    return Container(
      height: 120,
      margin: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedSearchPropertyCategories[2] =
                        !selectedSearchPropertyCategories[2];
                    if (selectedSearchPropertyCategories[1] =
                        searchPropertyCategories[1]) {
                      selectedSearchPropertyCategories[1] =
                          !searchPropertyCategories[1];
                      if (selectedSearchPropertyCategories[0] =
                          searchPropertyCategories[0]) {
                        selectedSearchPropertyCategories[0] =
                            !searchPropertyCategories[0];
                        if (selectedSearchPropertyCategories[3] =
                            searchPropertyCategories[3]) {
                          selectedSearchPropertyCategories[3] =
                              !searchPropertyCategories[3];
                        }
                      }
                    }
                  });
                },
                child: CircleAvatar(
                  maxRadius: 36,
                  backgroundColor: selectedSearchPropertyCategories[2] ==
                          searchPropertyCategories[2]
                      ? primaryColor
                      : Colors.grey,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: 35,
                    child: SvgPicture.asset(
                      'assets/icons/Uper.svg',
                      color: selectedSearchPropertyCategories[2] ==
                              searchPropertyCategories[2]
                          ? primaryColor
                          : Colors.grey,
                      height: 35,
                      width: 35,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Upper portion',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 13),
              )
            ],
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedSearchPropertyCategories[1] =
                        !selectedSearchPropertyCategories[1];
                    if (selectedSearchPropertyCategories[0] =
                        searchPropertyCategories[0]) {
                      selectedSearchPropertyCategories[0] =
                          !searchPropertyCategories[0];
                      if (selectedSearchPropertyCategories[2] =
                          searchPropertyCategories[2]) {
                        selectedSearchPropertyCategories[2] =
                            !searchPropertyCategories[2];
                        if (selectedSearchPropertyCategories[3] =
                            searchPropertyCategories[3]) {
                          selectedSearchPropertyCategories[3] =
                              !searchPropertyCategories[3];
                        }
                      }
                    }
                  });
                },
                child: CircleAvatar(
                  maxRadius: 36,
                  backgroundColor: selectedSearchPropertyCategories[1] ==
                          searchPropertyCategories[1]
                      ? primaryColor
                      : Colors.grey,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: 35,
                    child: SvgPicture.asset(
                      'assets/icons/appartment.svg',
                      color: selectedSearchPropertyCategories[1] ==
                              searchPropertyCategories[1]
                          ? primaryColor
                          : Colors.grey,
                      height: 35,
                      width: 35,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Commercial',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 13),
              )
            ],
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedSearchPropertyCategories[3] =
                        !selectedSearchPropertyCategories[3];
                    if (selectedSearchPropertyCategories[1] =
                        searchPropertyCategories[1]) {
                      selectedSearchPropertyCategories[1] =
                          !searchPropertyCategories[1];
                      if (selectedSearchPropertyCategories[2] =
                          searchPropertyCategories[2]) {
                        selectedSearchPropertyCategories[2] =
                            !searchPropertyCategories[2];
                        if (selectedSearchPropertyCategories[0] =
                            searchPropertyCategories[0]) {
                          selectedSearchPropertyCategories[0] =
                              !searchPropertyCategories[0];
                        }
                      }
                    }
                  });
                },
                child: CircleAvatar(
                  maxRadius: 36,
                  backgroundColor: selectedSearchPropertyCategories[3] ==
                          searchPropertyCategories[3]
                      ? primaryColor
                      : Colors.grey,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: 35,
                    child: SvgPicture.asset(
                      'assets/icons/Lower.svg',
                      color: selectedSearchPropertyCategories[3] ==
                              searchPropertyCategories[3]
                          ? primaryColor
                          : Colors.grey,
                      height: 35,
                      width: 35,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Lower portion',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 13),
              )
            ],
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedSearchPropertyCategories[0] =
                        !selectedSearchPropertyCategories[0];
                    if (selectedSearchPropertyCategories[1] =
                        searchPropertyCategories[1]) {
                      selectedSearchPropertyCategories[1] =
                          !searchPropertyCategories[1];
                      if (selectedSearchPropertyCategories[2] =
                          searchPropertyCategories[2]) {
                        selectedSearchPropertyCategories[2] =
                            !searchPropertyCategories[2];
                        if (selectedSearchPropertyCategories[3] =
                            searchPropertyCategories[3]) {
                          selectedSearchPropertyCategories[3] =
                              !searchPropertyCategories[3];
                        }
                      }
                    }
                  });
                },
                child: CircleAvatar(
                  maxRadius: 36,
                  backgroundColor: selectedSearchPropertyCategories[0] ==
                          searchPropertyCategories[0]
                      ? primaryColor
                      : Colors.grey,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: 35,
                    child: SvgPicture.asset(
                      'assets/icons/house.svg',
                      color: selectedSearchPropertyCategories[0] ==
                              searchPropertyCategories[0]
                          ? primaryColor
                          : Colors.grey,
                      height: 35,
                      width: 35,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Residential',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 13),
              )
            ],
          ),
        ],
      ),
    );
  }
}
