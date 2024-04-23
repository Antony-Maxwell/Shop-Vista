import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_vista/core/constants/sizedBox.dart';
import 'package:shop_vista/presentation/profile/widgets/address_custom_textfeild.dart';
import 'package:shop_vista/presentation/widgets/appbar_widgets/appbar.dart';

class AddNewAddressScreen extends StatelessWidget {
  AddNewAddressScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController postalController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController countryController = TextEditingController();

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              CustomAddressTextFeild(nameController: nameController, icon: Icons.person, hint: 'Name',),
              kHeight,
              CustomAddressTextFeild(nameController: phoneController, icon: Icons.phone, hint: 'Phone Number',),
              kHeight,
              Row(
                children: [
                  Expanded(
                    child: CustomAddressTextFeild(nameController: streetController, icon: Icons.streetview, hint: 'Street',),),
                   const  SizedBox(width: 10,),
                  Expanded(child: CustomAddressTextFeild(nameController: postalController, icon: Icons.location_city, hint: 'Postal code',),)
                ],
              ),
              kHeight,
              Row(
                children: [
                  Expanded(
                    child: CustomAddressTextFeild(nameController: cityController, icon: Icons.calendar_view_day_outlined, hint: 'City',),),
                   const  SizedBox(width: 10,),
                  Expanded(child: CustomAddressTextFeild(nameController: stateController, icon: Icons.countertops, hint: 'State',),),
                ],
              ),
              kHeight,
              CustomAddressTextFeild(nameController: countryController, icon: Iconsax.location5, hint: 'Country',),
            ],
          ),
        ),
      ),
    );
  }
}
