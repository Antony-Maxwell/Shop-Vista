import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_vista/application/home/user_bloc/user_bloc.dart';
import 'package:shop_vista/core/constants/sizedBox.dart';
import 'package:shop_vista/presentation/profile/settings_screens/add_new_address.dart';
import 'package:shop_vista/presentation/widgets/appbar_widgets/appbar.dart';

class MyAddressScreen extends StatelessWidget {
  const MyAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          "Addresses",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        action: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AddNewAddressScreen(),));
            },
            icon: const Icon(
              Icons.add,
              size: 35,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              final address = state.user.addresses[0];
              return Container(
                width: double.infinity,
                height: 250,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          'Current Address',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                      kHeight,
                      Text(
                        state.user.userName,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${address.street}, ${address.city}, ${address.country} ',
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                      Text(state.user.phoneNumber.toString(),
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500)),
                      Text(address.postalCode,
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
