import 'package:flutter/material.dart';
import 'package:onproperty/components/search_properties_components.dart';
import 'package:onproperty/components/wishlist_components.dart';

class Wishlist extends StatefulWidget {
  @override
  _WishlistState createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 12.0),
            child: listOfProperties1()),
      ),
    );
  }
}
