import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_vista/application/home/user_bloc/user_bloc.dart';
import 'package:shop_vista/core/constants/sizedBox.dart';
import 'package:shop_vista/infrastructure/profile/address/add_address_impl.dart';
import 'package:shop_vista/presentation/profile/widgets/address_custom_textfeild.dart';
import 'package:shop_vista/presentation/widgets/appbar_widgets/appbar.dart';
import 'package:shop_vista/presentation/widgets/blue_button.dart';

class AddNewAddressScreen extends StatelessWidget {
  AddNewAddressScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController postalController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Add new address',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if(state.isLoading){
            return SizedBox();
          }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: _key,
                child: Column(
                  children: [
                    CustomAddressTextFeild(
                      isNumber: false,
                      errMsg: 'Enter you name',
                      nameController: nameController,
                      icon: Icons.person,
                      hint: 'Name',
                    ),
                    kHeight,
                    CustomAddressTextFeild(
                      isNumber: true,
                      errMsg: 'Enter your mobile number',
                      nameController: phoneController,
                      icon: Icons.phone,
                      hint: 'Phone Number',
                    ),
                    kHeight,
                    Row(
                      children: [
                        Expanded(
                          child: CustomAddressTextFeild(
                            isNumber: false,
                            errMsg: 'Enter your street',
                            nameController: streetController,
                            icon: Icons.streetview,
                            hint: 'Street',
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: CustomAddressTextFeild(
                            isNumber: false,
                            errMsg: 'Enter your nearest postal code',
                            nameController: postalController,
                            icon: Icons.location_city,
                            hint: 'Postal code',
                          ),
                        )
                      ],
                    ),
                    kHeight,
                    Row(
                      children: [
                        Expanded(
                          child: CustomAddressTextFeild(
                            isNumber: false,
                            errMsg: 'Enter your city',
                            nameController: cityController,
                            icon: Icons.calendar_view_day_outlined,
                            hint: 'City',
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: CustomAddressTextFeild(
                            isNumber: false,
                            errMsg: 'Enter your state',
                            nameController: stateController,
                            icon: Icons.countertops,
                            hint: 'State',
                          ),
                        ),
                      ],
                    ),
                    kHeight,
                    CustomAddressTextFeild(
                      isNumber: false,
                      errMsg: 'Choose your country',
                      nameController: countryController,
                      icon: Iconsax.location5,
                      hint: 'Country',
                    ),
                    kHeight,
                    kHeight,
                    Sign(
                      title: 'Save',
                      color: Colors.blue,
                      fontColor: Colors.white,
                      isSignUp: false,
                      onTap: () {
                        if(_key.currentState!.validate()){
                        AddAddressImplementation().addAddress(
                          state.user.userId,
                          nameController.text,
                          streetController.text,
                          cityController.text,
                          stateController.text,
                          postalController.text,
                          countryController.text,
                          int.parse(phoneController.text));
                
                          nameController.clear();
                          streetController.clear();
                          cityController.clear();
                          stateController.clear();
                          postalController.clear();
                          countryController.clear();    
                          phoneController.clear();
                          final snackBar = SnackBar(content: Text('Address saved successfully'), duration: Duration(seconds: 2),);
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          BlocProvider.of<UserBloc>(context).add(const LoadUserDetails());
                          }
                      }
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
