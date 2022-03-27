import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onproperty/utils/colorscheme.dart';
import 'package:onproperty/utils/constants.dart';
import 'package:onproperty/widgets/contactUsDropDown.dart';

Container bannerForContactUs(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.3,
    width: double.infinity,
    decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/shaded_house.png'))),
    child: Container(
      color: Colors.black.withOpacity(0.4),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      color: Colors.grey,
                    ),
                  ),
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
                      Scaffold.of(context).openDrawer();
                      print('Appbar opening');
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
                          ),
                        )),
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                      print('Appbar opening');
                    }),
              ],
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(bottom: 30),
                alignment: Alignment.center,
                child: Text(
                  'Contact Us',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

DefaultTabController tabViewForContactUs(BuildContext context) {
  return DefaultTabController(
      length: 2,
      child: Container(
        color: Colors.transparent,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.7 + 1.800 + 90,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,
              width: double.infinity,
              child: TabBar(
                indicatorColor: Colors.white,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white,
                tabs: [Text('Form'), Text('Contact Information')],
              ),
            ),
            Expanded(
              child: Container(
                height: 489.30,
                margin: EdgeInsets.symmetric(horizontal: 8.0),
                child: TabBarView(
                  children: [
                    inquiryForm(context),
                    contactInformation(),
                  ],
                ),
              ),
            )
          ],
        ),
      ));
}

inquiryForm(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          'Inquiry Form',
          style: kh2,
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Expanded(
              child: textFieldForContactUs('First Name'),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: textFieldForContactUs('Last Name'),
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        textFieldForContactUs('Email'),
        SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: ContactUsDropDown(),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 5,
              child: Container(
                height: 50,
                child: TextFormField(
                    style: TextStyle(fontSize: 16),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                          left: 15,
                        ),
                        fillColor: Color(0xfffafafa),
                        filled: true,
                        hintText: 'Phone Number',
                        hintStyle: TextStyle(color: Colors.grey[500]),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(color: Colors.grey[300])),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(color: primaryColor)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ))),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 120,
          decoration: BoxDecoration(
              color: Color(0xfffafafa),
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(color: Colors.grey[300])),
          child: TextFormField(
            maxLines: 3,
            style: TextStyle(fontSize: 16),
            keyboardType: TextInputType.text,
            textAlign: TextAlign.start,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 15, top: 5),
              hintText: 'Message',
              hintStyle: TextStyle(color: Colors.grey[500]),
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Container(
          height: 50,
          width: double.infinity,
          child: Center(
              child: Text(
            'SUBMIT NOW',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          )),
          decoration: BoxDecoration(
              color: primaryColor, borderRadius: BorderRadius.circular(30.0)),
        ),
        Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom))
      ],
    ),
  );
}

textFieldForContactUs(String title) {
  return Container(
    height: 50,
    child: TextFormField(
        style: TextStyle(fontSize: 16),
        keyboardType: TextInputType.text,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
              left: 15,
            ),
            fillColor: Color(0xfffafafa),
            filled: true,
            hintText: title,
            hintStyle: TextStyle(color: Colors.grey[500]),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(color: Colors.grey[300])),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(color: primaryColor)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
            ))),
  );
}

Container contactInformation() {
  return Container(
      color: Colors.white,
      padding: EdgeInsets.all(22.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Contact Information',
              style: kh2,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          customListTile(Icons.place, 'Address', 'Ha Noi City'),
          SizedBox(
            height: 15,
          ),
          customListTile(
              Icons.phone_in_talk, 'Phone Number', '+84 334 859652 '),
          SizedBox(
            height: 15,
          ),
          customListTile(Icons.email, 'Email', 'hieu@gmail.com'),
          SizedBox(
            height: 15,
          ),
          customListTile(Icons.language, 'Website URL', 'www.hieukv.com')
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
