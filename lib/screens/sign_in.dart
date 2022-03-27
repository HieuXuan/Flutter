import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:onproperty/screens/dashboard.dart';
import 'package:onproperty/screens/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key key}) : super(key: key);
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  // firebase
  final _auth = FirebaseAuth.instance;
  String errorMessage;

  Widget build(BuildContext context) {
    //email field
    final emailField = TextFormField(
        autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value.isEmpty) {
            return ("Vui lòng hãy điền Email của bạn");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Vui lòng nhập Email hợp lệ");
          }
          return null;
        },
        onSaved: (value) {
          emailController.text = value;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //password field
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordController,
        obscureText: true,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{6,}$');
          if (value.isEmpty) {
            return ("Hãy nhập mật khẩu!");
          }
          if (!regex.hasMatch(value)) {
            return ("Hãy nhập mật khẩu hợp lệ (Tối thiểu 6 ký tự)");
          }
        },
        onSaved: (value) {
          passwordController.text = value;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            signIn(emailController.text, passwordController.text);
          },
          child: Text(
            "Đăng Nhập",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        height: 200,
                        child: Image.asset(
                          "assets/logo.jpg",
                          fit: BoxFit.contain,
                        )),
                    SizedBox(height: 45),
                    emailField,
                    SizedBox(height: 25),
                    passwordField,
                    SizedBox(height: 35),
                    loginButton,
                    SizedBox(height: 15),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Bạn Chưa Có Tài Khoản? "),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUp()));
                            },
                            child: Text(
                              "Đăng Ký",
                              style: TextStyle(
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          )
                        ])
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // login function
  void signIn(String email, String password) async {
    if (_formKey.currentState.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(msg: "Đăng nhập thành công! Welcome"),
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => DashBoard())),
                });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Email của bạn không đúng định dạng!";

            break;
          case "wrong-password":
            errorMessage = "Sai mật khẩu! Hãy nhập lại.";
            break;
          case "user-not-found":
            errorMessage = "Người dùng có Email này không tồn tại!";
            break;
          case "user-disabled":
            errorMessage = "Người dùng có Email này đã bị vô hiệu hóa!";
            break;
          case "too-many-requests":
            errorMessage = "Quá nhiều yêu cầu!";
            break;
          case "operation-not-allowed":
            errorMessage = "Đăng nhập bằng Email và Mật khẩu không được bật!";
            break;
          default:
            errorMessage = "Đã xảy ra lỗi không xác định!";
        }
        Fluttertoast.showToast(msg: errorMessage);
        print(error.code);
      }
    }
  }
}
