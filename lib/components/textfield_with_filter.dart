import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onproperty/utils/colorscheme.dart';

textFieldWithFilter({BuildContext context, Function callback}) {
  return Container(
    height: 50,
    margin: EdgeInsets.only(top: 10.0, left: 8.0, right: 8.0),
    decoration: BoxDecoration(
        border: Border.all(color: primaryColor),
        borderRadius: BorderRadius.circular(30.0)),
    child: Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: callback ??
                () {
                  Navigator.pushNamed(context, 'SearchProperty');
                },
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.search,
                  color: primaryColor,
                ),
                Text(
                  'Tìm kiếm',
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'Filters');
            },
            child: Padding(
              padding:
                  const EdgeInsets.only(right: 12.0, top: 12.0, bottom: 12.0),
              child: SvgPicture.asset(
                'assets/icons/filter.svg',
                height: 20,
                width: 20,
                color: primaryColor,
              ),
            )),
      ],
    ),
  );
}
