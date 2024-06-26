import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_vista/application/home/user_bloc/user_bloc.dart';
import 'package:shop_vista/core/constants/sizedBox.dart';
import 'package:shop_vista/presentation/profile/settings_screens/edit_profile_details_dialog.dart';
import 'package:shop_vista/presentation/profile/widgets/if_no_address.dart';
import 'package:shop_vista/presentation/profile/widgets/profile_pic.dart';
import 'package:shop_vista/presentation/profile/widgets/user_details_feild.dart';
import 'package:shop_vista/presentation/widgets/appbar_widgets/appbar.dart';
import 'package:shop_vista/presentation/widgets/section_heading/section_heading.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Edit Profile',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if(state.user.addresses.isEmpty){
                  return NoAddressScreen(state: state);
                }
                final address = state.user.addresses[0];
                return Column(
                  children: [
                    const ProfilePictureWidget(),
                    const SizedBox(height: 10),
                    const Text('Change your profile picture'),
                    const Divider(thickness: 2),
                    kHeight,
                    const TSectionHeading(
                        title: 'Profile information', showActionButton: false),
                    kHeight,
                    UserDetailsFeild(
                        hintText: 'Name',
                        onpressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AddProfileDetails(
                                documentId: state.user.userId,
                                field: 'FirstName',
                              );
                            },
                          );
                        },
                        value: state.user.firstName + state.user.lastName),
                    UserDetailsFeild(
                        hintText: 'Username',
                        value: state.user.userName,
                        onpressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AddProfileDetails(
                                documentId: state.user.userId,
                                field: 'UserName',
                              );
                            },
                          );
                        }),
                    kHeight,
                    const Divider(thickness: 2),
                    const TSectionHeading(
                        title: 'Personal information', showActionButton: false),
                    kHeight,
                    UserDetailsFeild(
                        hintText: 'Email',
                        value: state.user.email,
                        onpressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AddProfileDetails(
                                documentId: state.user.userId,
                                field: 'Email',
                              );
                            },
                          );
                        }),
                    UserDetailsFeild(
                        hintText: 'Phone Number',
                        value: state.user.phoneNumber.toString(),
                        onpressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AddProfileDetails(
                                documentId: state.user.userId,
                                field: 'PhoneNumber',
                              );
                            },
                          );
                        }),
                    kHeight,
                    const Divider(thickness: 2),
                    const TSectionHeading(
                        title: 'Address', showActionButton: false),
                    kHeight,
                    Text(
                        '${address.street}, ${address.city}, ${address.country} ',
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500)),
                    Text(state.user.phoneNumber.toString(),
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500)),
                    Text(address.postalCode,
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500)),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
