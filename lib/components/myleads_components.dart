import 'package:flutter/material.dart';
import 'package:onproperty/utils/colorscheme.dart';




ListView myLeadsAgentsList(){

  return ListView.builder(
      itemCount: 6
      ,itemBuilder: (context,index){
    return GestureDetector(onTap: (){
      Navigator.pushNamed(context, 'AgentDetails');
    },
      child: Column(
        children: [
          index==0?SizedBox(height: 10,):
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 3.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      maxRadius: 35,
                      backgroundImage: AssetImage('assets/images/john.jpg'),
                    ),
                    SizedBox(width: 10,)
                    ,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'John Smith',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 3,),

                        Row(
                          children: [
                            Text(
                              'Real Estate',
                              style: TextStyle(color: Colors.grey,fontSize: 12),
                            ),
                            SizedBox(width: 5),
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
                            )
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          children: [
                            Icon(
                              Icons.place,
                              size: 16,
                              color: primaryColor,
                            ),
                            Text(
                              '00000 Susan Apartment,New York ,USA',
                              style: TextStyle(color: Colors.grey,fontSize: 12),
                            ),
                            SizedBox(width: 5),

                          ],
                        ),
                        SizedBox(height: 3,),
                        Text('View Details',style:TextStyle(
                          color: primaryColor,decoration: TextDecoration.underline,fontWeight: FontWeight.w500
                        ),)

                      ],
                    ),

                  ],
                ),
              ),
              Divider()
            ],
          ),
        ],
      ),
    );
  });
}