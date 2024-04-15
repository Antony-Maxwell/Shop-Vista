import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_vista/application/home/categories/bloc/categories_bloc.dart';
import 'package:shop_vista/presentation/home/categories/category_screen.dart';
import 'package:shop_vista/presentation/widgets/home_widgets/category/category_shimmer.dart';
import 'package:shop_vista/presentation/widgets/product_cart/shimmer.dart';
import 'package:shop_vista/presentation/widgets/vertical_categories/vertical_categories.dart';

class VerticalCategoryList extends StatelessWidget {
  const VerticalCategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CategoriesBloc>(context).add(FetchCategories());
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is CategoryLoading) {
          return TProductCardShimmer();
        } else if (state is CategoryLoaded) {
          return SizedBox(
            height: 80,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: state.Categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final category = state.Categories[index];
                  return TVerticalCategories(
                    ontap: () { Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoryScreen(
                              categoryName: state.Categories[index].name),
                        ));
                      fetchUserDetails();
                    },
                    image: state.Categories[index].image,
                    title: category.name,
                    backGroundColor: Colors.white,
                  );
                }),
          );
        } else if (state is CategoryError) {
          return Text(state.message);
        } else {
          return Container();
        }
      },
    );
  }
    Future<void> fetchUserDetails() async {
  try {
    // Get the current user's UID after successful login
    String uid = FirebaseAuth.instance.currentUser!.uid;
    print(uid);

    // Access Firestore collection 'Users' and get the document corresponding to the user's UID
    DocumentSnapshot<Map<String, dynamic>> userSnapshot =
        await FirebaseFirestore.instance.collection('Users').doc(uid).get();

    // Check if the document exists
    if (userSnapshot.exists) {
      // Extract user details from the document
      Map<String, dynamic> userData = userSnapshot.data()!;
      
      // Example: Print the user's email
      print('User email: ${userData['Email']}');
      print('details are $userData');      
      // You can extract other user details in a similar manner
    } else {
      // Document corresponding to the user does not exist
      print('User document does not exist');
    }
  } catch (e) {
    // Handle any errors that may occur during the process
    print('Error fetching user details: $e');
  }
}
}
