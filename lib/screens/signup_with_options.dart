import 'package:flutter/material.dart';
import 'package:onproperty/widgets/custom_button.dart';

class SignUpWithOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: AssetImage('assets/images/apartement.jpg'))),
        child: Container(
            color: Colors.black.withOpacity(0.4), child: mainBody(context)),
      ),
    );
  }

  mainBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          Text(
            'Hello There ',
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text('Chào mừng bạn đến với ứng dụng bất động sản',
              style: TextStyle(color: Colors.white)),
          Container(
            height: 5,
            width: 70,
            margin: EdgeInsets.only(top: 10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.40,
          ),
          /*......................Row of Social Media Button Containers..............................*/
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // socialMediaButton(
              //     img: 'assets/icons/google.png',
              //     callback: () {},
              //     text: 'Google'),
              // socialMediaButton(
              //     img: 'assets/icons/fb.png',
              //     callback: () {},
              //     text: 'Facebook'),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          Center(
              child: Text(
            '',
            style: TextStyle(color: Colors.white),
          )),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),

          /* ........................Container for Sign up with email or phone....................*/
          CustomButton(
            title: 'Đăng Ký Thành Viên',
            callback: () {
              Navigator.pushNamed(context, 'SignUp');
            },
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Bạn đã có tài khoản? ',
                  style: TextStyle(color: Colors.white),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'SignIn');
                  },
                  child: Text(
                    'Đăng nhập',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
