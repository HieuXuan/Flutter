import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onproperty/components/copyright.dart';
import 'package:onproperty/components/reusable_textfield.dart';
import 'package:onproperty/components/textfield_with_filter.dart';
import 'package:onproperty/utils/colorscheme.dart';

import 'package:onproperty/widgets/custom_button.dart';

class SearchProperty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SearchPropertyBody(),
      ),
    );
  }
}

class SearchPropertyBody extends StatefulWidget {
  @override
  _SearchPropertyBodyState createState() => _SearchPropertyBodyState();
}

class _SearchPropertyBodyState extends State<SearchPropertyBody> {
  int selectedView = 1;
  List propertyViews = [];

  List searchPropertyCategories = [true, true, true, true];
  List selectedSearchPropertyCategories = [true, false, false, false];
  List<bool> selectedProperty = [false, false, false, false];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List propertyViews = [
      _industrialView(),
      _commercialView(),
      _residentialView()
    ];
    return SingleChildScrollView(
      child: Column(
        children: [
          textFieldWithFilter(context: context, callback: () {}),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Loại bất động sản',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
          _rowOfButtons(),
          Container(
            child: propertyViews[selectedView],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: reusableTextField(
                hint: 'Search Properties', icon: Icon(Icons.search)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: reusableTextField(
                hint: 'Location,Country or City', icon: Icon(Icons.room)),
          ),
          SizedBox(
            height: 20,
          ),
          CustomButton(
            title: 'Search',
            callback: () {},
          ),
          SizedBox(
            height: 30,
          ),
          copyright(),
          SizedBox(
            height: 20,
          )
        ],
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
                  selectedProperty[0] = true;
                  selectedProperty[1] = false;
                  selectedProperty[2] = false;
                });
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    color: selectedProperty[0] == true
                        ? primaryColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                        color: selectedProperty[0] == true
                            ? primaryColor
                            : Colors.grey[300])),
                child: Center(
                  child: Text(
                    'Khu dân cư',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: selectedProperty[0] == true
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
                  selectedProperty[0] = false;
                  selectedProperty[1] = true;
                  selectedProperty[2] = false;
                });
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    color: selectedProperty[1] == true
                        ? primaryColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                        color: selectedProperty[1] == true
                            ? primaryColor
                            : Colors.grey[300])),
                child: Center(
                  child: Text(
                    'Thành phố',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: selectedProperty[1] == true
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
                  selectedProperty[0] = false;
                  selectedProperty[1] = false;
                  selectedProperty[2] = true;
                });
              },
              child: Container(
                height: 40,
                width: 120,
                decoration: BoxDecoration(
                    color: selectedProperty[2] == true
                        ? primaryColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                        color: selectedProperty[2] == true
                            ? primaryColor
                            : Colors.grey[300])),
                child: Center(
                  child: Text('Công nghiệp',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: selectedProperty[2] == true
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
