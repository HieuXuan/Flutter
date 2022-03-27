import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


Container bannerForTermsAndConditions(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.3,
    width: double.infinity,
    decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/terms.png'))),
    child: Container(
      color: Colors.black.withOpacity(0.4),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: CircleAvatar(
                    maxRadius: 20,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Spacer(),
                GestureDetector(
                    child: Container(
                        height: 40,
                        width: 40,
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.transparent),
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: SvgPicture.asset(
                            'assets/icons/location.svg',
                            color: Colors.white,
                            height: 20,
                          ),
                        )),
                    onTap: () {
                      Navigator.pushNamed(context, 'Location');

                    }),
                GestureDetector(
                    child: Container(
                        height: 40,
                        width: 40,
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.transparent),
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: SvgPicture.asset(
                            'assets/icons/bell.svg',
                            color: Colors.white,
                          ),
                        )),
                    onTap: () {
                      Navigator.pushNamed(context, 'Notifications');
                    }),
              ],
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(bottom: 30),
                alignment: Alignment.center,
                child: Text(
                  'TERMS AND CONDITIONS',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}