import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_vista/domain/core/debouncer/debouncer.dart';
import 'package:shop_vista/helpers/helper.dart';
import 'package:shop_vista/presentation/home/search/search_screen.dart';

class TSearchBarWidget extends StatelessWidget {
  TSearchBarWidget({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.isSearch = false,
    this.controller = '',
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder, isSearch;
  final dynamic controller;

  final _debouncer = Debouncer(delay: Duration(milliseconds: 1 * 1000));

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return isSearch
        ? TextFormField(
            controller: controller,
            decoration: InputDecoration(
                hintText: 'Search',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          )
        : GestureDetector(
            onTap: () {
              getDataFromFirebase();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(),
                  ));
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: showBackground
                    ? dark
                        ? Colors.black
                        : Colors.white
                    : Colors.transparent,
                border: showBorder ? Border.all(color: Colors.grey) : null,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Icon(
                    icon,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Text(
                    text,
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
            ),
          );
  }
  Future<void> getDataFromFirebase() async {
                // Access Firestore instance
                FirebaseFirestore firestore = FirebaseFirestore.instance;

                try {
                  // Retrieve data from Firestore
                  QuerySnapshot querySnapshot =
                      await firestore.collection('Users').get();

                  // Iterate through documents and convert them to JSON
                  List<Object?> jsonDataList =
                      querySnapshot.docs.map((doc) => doc.data()).toList();

                  // Now you have a list of JSON data from Firebase
                  print(jsonDataList);
                } catch (e) {
                  print('Error retrieving data: $e');
                }
              }
}
