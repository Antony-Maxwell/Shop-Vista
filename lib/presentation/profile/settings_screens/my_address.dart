import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_vista/application/home/user_bloc/user_bloc.dart';
import 'package:shop_vista/application/profile/address_selection/address_selection_bloc.dart';
import 'package:shop_vista/core/constants/sizedBox.dart';
import 'package:shop_vista/domain/User/user_model/user_model.dart';
import 'package:shop_vista/helpers/helper.dart';
import 'package:shop_vista/presentation/profile/settings_screens/add_new_address.dart';
import 'package:shop_vista/presentation/profile/widgets/address_container.dart';
import 'package:shop_vista/presentation/widgets/appbar_widgets/appbar.dart';
import 'package:shop_vista/presentation/widgets/blue_button.dart';
import 'package:shop_vista/presentation/widgets/product_cart/shimmer.dart';

class MyAddressScreen extends StatefulWidget {
  const MyAddressScreen({Key? key}) : super(key: key);

  @override
  _MyAddressScreenState createState() => _MyAddressScreenState();
}

class _MyAddressScreenState extends State<MyAddressScreen> {
  int? selectedAddressIndex;
  List<Address>? addresse;

  Future<void> _refreshData() async {
    // Simulate a network request or any asynchronous operation
    await Future.delayed(Duration(seconds: 2));

    // Update the list data or perform any other refresh operation
    setState(() {
      BlocProvider.of<UserBloc>(context).add(const UserEvent.loadUserDetails());
    });
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UserBloc>(context).add(const LoadUserDetails());
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddNewAddressScreen(),
                ),
              );
            },
            icon: const Icon(
              Icons.add,
              size: 35,
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state.user.addresses.isEmpty) {
              return const Center(
                child: Text('No Addresses you have added'),
              );
            } else if (state.isLoading) {
              return ShimmerProduct().buildShimmerEffectCategoryDark();
            } else {
              final addresses = state.user.addresses;
              return ListView.builder(
                itemCount: addresses.length,
                itemBuilder: (context, index) {
                  final address = addresses[index];
                  return Column(
                    children: [
                      AddressDisplayContainer(
                        address: address,
                        isSelected: index == selectedAddressIndex,
                        onSelected: () {
                          setState(() {
                            addresse = addresses;
                            selectedAddressIndex = index;
                          });
                        },
                      ),
                      if (selectedAddressIndex != null && index == selectedAddressIndex)
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Sign(
                            title: 'Choose',
                            color: Colors.blue,
                            fontColor: Colors.white,
                            isSignUp: false,
                            onTap: () => onSelectAddress(addresse![selectedAddressIndex!]),
                          ),
                        ),
                    ],
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

  void onSelectAddress(Address selectedAddress) {
    // Dispatch an event to the bloc to store the selected address
    context.read<AddressBloc>().add(AddAddressEvent(selectedAddress));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Address saved successfully')));
  }
}
