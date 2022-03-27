import 'package:flutter/material.dart';
import 'package:onproperty/utils/colorscheme.dart';


contactTabComp(BuildContext context){
  return DefaultTabController(length: 2, child:Container(
    color: Colors.transparent,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 40,
          width: double.infinity,
          child: TabBar(
            labelColor: primaryColor,
            unselectedLabelColor: Colors.white,
            tabs: [Text('Inquiry Form'), Text('Contact Information')],
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            child: TabBarView(
              children: [
               Text('asdkj'),
               Text('asdj')
              ],
            ),
          ),
        )
      ],
    ),
  ) );
}