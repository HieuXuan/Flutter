import 'package:flutter/material.dart';
import 'package:onproperty/components/agents_components.dart';



class Agents extends StatefulWidget {
  @override
  _AgentsState createState() => _AgentsState();
}

class _AgentsState extends State<Agents> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(elevation: 1,
          backgroundColor: Colors.white,
          title: Text(
            'AGENTS',
            style: TextStyle(color: Colors.black, fontSize: 17),
          ),
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),

        ),
        body: agentsList(),
      ),
    );
  }
}
