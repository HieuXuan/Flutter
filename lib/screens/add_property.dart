import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onproperty/components/add_property_comp.dart';
import 'package:onproperty/utils/colorscheme.dart';
import 'package:onproperty/widgets/banner_for_add_property.dart';
import 'package:onproperty/widgets/bathrooms_container.dart';
import 'package:onproperty/widgets/bedrooms_container.dart';
import 'package:onproperty/widgets/custom_button.dart';

class AddProperty extends StatefulWidget {
  @override
  _AddPropertyState createState() => _AddPropertyState();
}

class _AddPropertyState extends State<AddProperty> {
  List searchPropertyCategories = [true, true, true, true];
  List selectedSearchPropertyCategories = [false, false, false, false];
  bool selectedColorForPropertyType1 = true;
  bool selectedColorForPropertyType2 = false;
  bool selectedColorForPropertyType3 = false;
  int selectedView;

  final List<String> _provincesName = [
    "Cầu Giấy",
    "Bắc Từ Liêm",
    "Nam Từ Liêm",
    'Mỹ Đình'
  ];
  String _provinceValue;

  final List<dynamic> _citiesName = [
    "Hà Nội",
    "Bắc Ninh",
    "Vĩnh Phúc",
    'Thái Nguyên'
  ];
  String _cityValue;
  final List<dynamic> _countryCode = ['+1', '+92', "+61", '+31', '+51', '269'];
  String _countryValue;

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
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BannerForAddProperty(),
              _titleAndDescription(),
              _areaField(),
              _priceField(),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  'Loại Bất Động Sản',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              _rowOfButtons(),
              Container(
                child: propertyViews[selectedView],
              ),
              /*...........................Bedrooms.......................*/
              BedroomsContainer(),
              BathroomContainer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Text(
                  'Chọn Ảnh',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              /* ..................Grid View........................*/
              _customGridView(),
              SizedBox(
                height: 10,
              ),
              /*........................Text of Country PKR and Change History...........*/
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    Text(
                      'Địa Chỉ  ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '',
                      style: TextStyle(
                          color: primaryColor, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      '',
                      style: TextStyle(color: primaryColor),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0),
                child: addPropertyTextField('Address'),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0),
                child: addPropertyTextField('Email'),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.0),
                  child: _countryCodeAndPhoneNumberField()),
              SizedBox(
                height: 10,
              ),
              _rowOfDropDowns(),
              SizedBox(
                height: 30,
              ),
              /*.......................Submit Button.................................*/
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                  title: 'SUBMIT NOW',
                  callback: () {},
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _titleAndDescription() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          addPropertyTextField('Title'),
          SizedBox(height: 10),
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: Color(0xfffafafa),
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Colors.grey[300]),
            ),
            child: TextFormField(
              maxLines: 3,
              style: TextStyle(fontSize: 16),
              keyboardType: TextInputType.text,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 15, top: 5),
                hintText: 'Description',
                hintStyle: TextStyle(color: Colors.grey[500]),
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _areaField() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
          child: Row(
            children: [
              Text(
                'Diện tích ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '( Sq Feet )',
                style:
                    TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Text(
                'Change',
                style:
                    TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
          child: addPropertyTextField('Area'),
        ),
      ],
    );
  }

  _priceField() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
          child: Row(
            children: [
              Text(
                'Giá ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '( USD )',
                style:
                    TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Text(
                'Change',
                style:
                    TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
          child: addPropertyTextField('Area'),
        )
      ],
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
                  selectedColorForPropertyType2 = false;
                  selectedColorForPropertyType3 = false;

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
                    'Khu dân cư',
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
                  selectedColorForPropertyType1 = false;
                  selectedColorForPropertyType2 = true;
                  selectedColorForPropertyType3 = false;
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
                    'Thành phố',
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

                  selectedColorForPropertyType1 = false;
                  selectedColorForPropertyType2 = false;
                  selectedColorForPropertyType3 = true;
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
                  child: Text('Công nghiệp',
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
                    selectedSearchPropertyCategories[1] = false;
                    selectedSearchPropertyCategories[2] = false;
                    selectedSearchPropertyCategories[1] = false;
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
                    selectedSearchPropertyCategories[0] = false;
                    selectedSearchPropertyCategories[2] = false;
                    selectedSearchPropertyCategories[3] = false;
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
                    selectedSearchPropertyCategories[1] = false;
                    selectedSearchPropertyCategories[0] = false;
                    selectedSearchPropertyCategories[3] = false;
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
                    selectedSearchPropertyCategories[0] = false;
                    selectedSearchPropertyCategories[1] = false;
                    selectedSearchPropertyCategories[2] = false;
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
                        !selectedSearchPropertyCategories[1];
                    selectedSearchPropertyCategories[1] = false;
                    selectedSearchPropertyCategories[0] = false;
                    selectedSearchPropertyCategories[3] = false;
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
                    selectedSearchPropertyCategories[1] = false;
                    selectedSearchPropertyCategories[2] = false;
                    selectedSearchPropertyCategories[0] = false;
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
                    selectedSearchPropertyCategories[1] = false;
                    selectedSearchPropertyCategories[2] = false;
                    selectedSearchPropertyCategories[3] = false;
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
                    selectedSearchPropertyCategories[0] = false;
                    selectedSearchPropertyCategories[2] = false;
                    selectedSearchPropertyCategories[3] = false;
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
                    selectedSearchPropertyCategories[1] = false;
                    selectedSearchPropertyCategories[3] = false;
                    selectedSearchPropertyCategories[0] = false;
                  });
                },
                child: CircleAvatar(
                  maxRadius: 36,
                  backgroundColor: selectedSearchPropertyCategories[2]
                      ? primaryColor
                      : Colors.grey,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: 35,
                    child: SvgPicture.asset(
                      'assets/icons/Uper.svg',
                      color: selectedSearchPropertyCategories[2]
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
                    selectedSearchPropertyCategories[2] = false;
                    selectedSearchPropertyCategories[3] = false;
                    selectedSearchPropertyCategories[0] = false;
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
                    selectedSearchPropertyCategories[1] = false;
                    selectedSearchPropertyCategories[2] = false;
                    selectedSearchPropertyCategories[0] = false;
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
                    selectedSearchPropertyCategories[1] = false;
                    selectedSearchPropertyCategories[2] = false;
                    selectedSearchPropertyCategories[1] = false;
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

  _countryCodeAndPhoneNumberField() {
    return Row(
      children: <Widget>[
        Container(
          child: Flexible(
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                  color: Color(0xfffafafa),
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(color: Colors.grey[300])),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  iconEnabledColor: Colors.grey[500],
                  iconDisabledColor: Colors.grey[500],
                  hint: Text(
                    '+1',
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                  style: TextStyle(color: Colors.grey[500]),
                  value: _countryValue,
                  onChanged: (newValue) {
                    setState(() {
                      _countryValue = newValue;
                    });
                  },
                  items: _countryCode.map((value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  isExpanded: true,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Container(
          child: Flexible(
              flex: 7,
              child: TextFormField(
                  enabled: true,
                  style: TextStyle(fontSize: 16),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                        left: 15,
                      ),
                      fillColor: Color(0xfffafafa),
                      filled: true,
                      hintText: 'Phone number',
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(color: Colors.grey[300])),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(color: primaryColor)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(color: Colors.orange)),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(color: Colors.grey[300]))))),
        ),
      ],
    );
  }

  _customGridView() {
    return Container(
      height: 220,
      margin: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Color(0xfffafafa), borderRadius: BorderRadius.circular(10.0)),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        crossAxisCount: 3,
        children: List.generate(6, (index) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
            child: Icon(
              Icons.add,
              color: Colors.grey,
            ),
          );
        }),
      ),
    );
  }

  _rowOfDropDowns() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        children: <Widget>[
          Container(
            child: Flexible(
              flex: 1,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                    color: Color(0xfffafafa),
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(color: Colors.grey[300])),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    iconEnabledColor: Colors.grey[500],
                    iconDisabledColor: Colors.grey[500],
                    hint: Text(
                      'Choose Province',
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                    style: TextStyle(color: Colors.grey[500]),
                    value: _provinceValue,
                    onChanged: (newValue) {
                      setState(() {
                        _provinceValue = newValue;
                      });
                    },
                    items: _provincesName.map((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    isExpanded: true,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            child: Flexible(
              flex: 1,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                    color: Color(0xfffafafa),
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(color: Colors.grey[300])),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    iconEnabledColor: Colors.grey[500],
                    iconDisabledColor: Colors.grey[500],
                    hint: Text(
                      'Choose city',
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                    style: TextStyle(color: Colors.grey[500]),
                    value: _cityValue,
                    onChanged: (newValue) {
                      setState(() {
                        _cityValue = newValue;
                      });
                    },
                    items: _citiesName.map((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    isExpanded: true,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
