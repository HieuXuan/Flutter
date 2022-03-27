import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


ListView agentsList(){
  List<String> agentImages=['assets/images/person1.jpg','assets/images/person2.jpeg','assets/images/person3.png','assets/images/person4.jpg','assets/images/person5.png','assets/images/person6.jpeg','assets/images/person7.jpg','assets/images/person8.jpg','assets/images/person9.jpg','assets/images/person10.jpg',];

  return ListView.builder(
      itemCount: agentImages.length+1
      ,itemBuilder: (context,index){
    var primaryColor;
    return GestureDetector(onTap: (){
      Navigator.pushNamed(context, 'AgentDetails');
    },
      child: Column(
        children: [
          index==0?SizedBox(height: 10,):
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      maxRadius: 30,
                      backgroundImage: AssetImage(agentImages[index-1]),
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
                        Text(
                          '+(123) 456 789 0',
                          style: TextStyle(color: Colors.grey),
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
                        )
                      ],
                    ),
                    Spacer(),
                    Container(padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),color: primaryColor,

                      ),
                      child: Text('View Details',style: TextStyle(fontSize:11,color: Colors.white),),
                    )
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