import 'package:flutter/material.dart';
import 'package:onproperty/utils/colorscheme.dart';



class AudioCall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                  'assets/images/audio.jpg'),
            ),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: primaryColor.withOpacity(0.8),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                Text(
                  'Ringing...',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                CircleAvatar(
                  maxRadius: 70,
                  backgroundImage: AssetImage('assets/images/person1.jpg'),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'John  Doe',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '(Takaful Real Estate)',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.13,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            maxRadius: 35,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.mic_off,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Mute',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: CircleAvatar(
                              maxRadius: 35,
                              backgroundColor: Colors.red,
                              child: Icon(
                                Icons.call_end,
                                color: Colors.black,
                                size: 30,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Call End',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                            maxRadius: 35,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.volume_up,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Speaker',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
