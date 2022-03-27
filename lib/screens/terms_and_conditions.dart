import 'package:flutter/material.dart';
import 'package:onproperty/components/terms_and_conditions_comp.dart';

class TermsAndConditions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              bannerForTermsAndConditions(context),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // children: [
                  //   Text('What is Lorem Ipsum?',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  //   SizedBox(height: 5),
                  //   Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ',style: TextStyle(color: Colors.black54),),
                  //   SizedBox(height: 15),
                  //   Text('Why do we use it?',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  //   SizedBox(height: 5),
                  //   Text(' It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English',style: TextStyle(color: Colors.black54),),
                  //   SizedBox(height: 15),
                  //   Text('Where does it come from?',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  //   SizedBox(height: 5),
                  //   Text('Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words ',style: TextStyle(color: Colors.black54),),
                  //   SizedBox(height: 15),
                  //   Text('Where can I get some?',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  //   SizedBox(height: 5),
                  //   Text('There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.  ',style: TextStyle(color: Colors.black54),),
                  // ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
