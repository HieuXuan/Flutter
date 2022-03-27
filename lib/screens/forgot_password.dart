import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onproperty/components/horizontal_line.dart';
import 'package:onproperty/components/reusable_textfield.dart';
import 'package:onproperty/utils/constants.dart';
import 'package:onproperty/widgets/custom_button.dart';

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Text(
                'FORGOT PASSWORD',
                style: kh1,
              ),
              SizedBox(height: 8),
              Text(
                'Please Enter Your Email Address or Phone Number to Reset Your Password',
                style: TextStyle(color: Colors.black87),
              ),
              horizontalLine(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Text(
                'Email or Phone',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              reusableTextField(hint: 'Email,Address or Phone Number'),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
             CustomButton(
               title: 'Send Now',
               callback: (){
                 Navigator.pushNamed(context,'OtpScreen');
               },
             ),
              SizedBox(
                height: 20,
              ),
              Center(child: Text('Cancel',style: TextStyle(color:Colors.grey,fontWeight: FontWeight.bold ),))
            ],
          ),
        ),
      ),
    ));
  }
}
