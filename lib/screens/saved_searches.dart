import 'package:flutter/material.dart';
import 'package:onproperty/components/location_icon.dart';
import 'package:onproperty/components/notification_icon.dart';
import 'package:onproperty/models/saved_searches_model.dart';

class SavedSearches extends StatefulWidget {
  @override
  _SavedSearchesState createState() => _SavedSearchesState();
}

class _SavedSearchesState extends State<SavedSearches> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.grey),
          brightness: Brightness.light,
          title: Text(
            'Saved Searches',
            style: TextStyle(color: Colors.black),
          ),
          actions: [locationIcon(context), notificationIcon(context)],
        ),
        body: listOfSavedSearches());
  }

  listOfSavedSearches() {
    List<SavedSearchesModel> savedSearchesData = [
      SavedSearchesModel(
          title: '235 Hoàng Quốc Việt, Hà Nội',
          location: 'Hà Nội',
          purpose: 'Sell',
          propertyType: 'Commercial'),
      SavedSearchesModel(
          title: 'Plot 005,Street no 67, LA',
          location: 'Los Angeles',
          purpose: 'Sell',
          propertyType: 'Residential'),
      SavedSearchesModel(
          title: 'Plot 12,Street no 23, Chicago',
          location: 'Chicago',
          purpose: 'Sell',
          propertyType: 'Commercial'),
      SavedSearchesModel(
          title: '235 Hoàng Quốc Việt, Hà Nội',
          location: 'Hà Nội',
          purpose: 'Sell',
          propertyType: 'Commercial'),
      SavedSearchesModel(
          title: 'Plot 002,Street no 70, Californiaaa',
          location: 'California',
          purpose: 'Sell',
          propertyType: 'Residential'),
      SavedSearchesModel(
          title: 'Plot 052,Street no 56, Michigan',
          location: 'Michigan',
          purpose: 'Sell',
          propertyType: 'Commercial')
    ];

    return ListView.builder(
        itemCount: savedSearchesData.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Card(
                margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
                child: Container(
                  height: 100,
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        savedSearchesData[index].title,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              Text('PURPOSE: ', style: TextStyle(fontSize: 13)),
                              Text(savedSearchesData[index].purpose,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13))
                            ],
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Row(
                            children: [
                              Text(
                                'TYPE: ',
                                style: TextStyle(fontSize: 13),
                              ),
                              Text(
                                savedSearchesData[index].propertyType,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              Text('LOCATION: ',
                                  style: TextStyle(fontSize: 13)),
                              Text(savedSearchesData[index].location,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13))
                            ],
                          ),
                          Spacer(),
                          Icon(
                            Icons.delete,
                            color: Colors.grey[500],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }
}
