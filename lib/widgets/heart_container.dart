import 'package:flutter/material.dart';
import 'package:onproperty/utils/colorscheme.dart';

class HeartContainer extends StatefulWidget {
  final int index;
  HeartContainer(this.index);
  @override
  _HeartContainerState createState() => _HeartContainerState();
}

class _HeartContainerState extends State<HeartContainer> {
  List <bool> selected=[false,false,false,false,false,false,false,false,false,false,];
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        setState(() {
          selected[widget.index]=!selected[widget.index];
        });
      },
      child: Container(
        child: selected[widget.index]?Icon(
          Icons.favorite,color: primaryColor,
          size: 22,
        ):Icon(
          Icons.favorite_border,
          size: 22,
        ),
      ),
    );
  }
}
