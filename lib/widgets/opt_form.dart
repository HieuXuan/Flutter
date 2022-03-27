import 'package:flutter/material.dart';
import 'package:onproperty/utils/constants.dart';

class OptForm extends StatefulWidget {
  @override
  _OptFormState createState() => _OptFormState();
}

class _OptFormState extends State<OptForm> {
  FocusNode pin2FocusNode;
  FocusNode pin3FocusNode;
  FocusNode pin4FocusNode;
  FocusNode pin5FocusNode;
  FocusNode pin6FocusNode;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    pin5FocusNode = FocusNode();
    pin6FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
    pin5FocusNode.dispose();
    pin6FocusNode.dispose();
  }

  void nextField({String value, FocusNode focusNode}) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 60,
            width: 50,
            child: TextFormField(
                autofocus: true,
                style: TextStyle(fontSize: 24),
                obscureText: true,
                onChanged: (value) {
                  nextField(value: value, focusNode: pin2FocusNode);
                },
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: optInputDecoration),
          ),
          Container(
            height: 60,
            width: 50,
            child: TextFormField(
                autofocus: false,
                style: TextStyle(fontSize: 24),
                focusNode: pin2FocusNode,
                obscureText: true,
                onChanged: (value) {
                  nextField(value: value, focusNode: pin3FocusNode);
                },
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: optInputDecoration),
          ),
          Container(
            height: 60,
            width: 50,
            child: TextFormField(
                style: TextStyle(fontSize: 24),
                focusNode: pin3FocusNode,
                obscureText: true,
                onChanged: (value) {
                  nextField(value: value, focusNode: pin4FocusNode);
                },
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: optInputDecoration),
          ),
          Container(
            height: 60,
            width: 50,
            child: TextFormField(
                style: TextStyle(fontSize: 24),
                focusNode: pin4FocusNode,
                obscureText: true,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  nextField(value: value, focusNode: pin5FocusNode);
                },
                decoration: optInputDecoration),
          ),
          Container(
            height: 60,
            width: 50,
            child: TextFormField(
                style: TextStyle(fontSize: 24),
                focusNode: pin5FocusNode,
                obscureText: true,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  nextField(value: value, focusNode: pin6FocusNode);
                },
                decoration: optInputDecoration),
          ),
          Container(
            height: 60,
            width: 50,
            child: TextFormField(
                style: TextStyle(fontSize: 24),
                obscureText: true,
                focusNode: pin6FocusNode,
                onChanged: (value) {
                  pin6FocusNode.unfocus();
                },
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: optInputDecoration),
          ),
        ],
      ),
    );
  }
}
