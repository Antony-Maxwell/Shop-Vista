import 'package:flutter/material.dart';

class FilterSheet{
  
  Future<dynamic> FilterBottomSheet(BuildContext context) {
    return showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                'This is a simple bottom sheet.',
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Close'),
                              ),
                            ],
                          ),
                        );
                      },
                    );
  }
}