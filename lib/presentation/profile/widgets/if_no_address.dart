import 'package:flutter/material.dart';
import 'package:shop_vista/application/home/user_bloc/user_bloc.dart';
import 'package:shop_vista/core/constants/sizedBox.dart';
import 'package:shop_vista/presentation/profile/settings_screens/edit_profile_details_dialog.dart';
import 'package:shop_vista/presentation/profile/widgets/profile_pic.dart';
import 'package:shop_vista/presentation/profile/widgets/user_details_feild.dart';
import 'package:shop_vista/presentation/widgets/section_heading/section_heading.dart';

class NoAddressScreen extends StatelessWidget {
  const NoAddressScreen({super.key, required this.state});

  final UserState state;

  @override
  Widget build(BuildContext context) {
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
                    const Text(
                      'There is no address you have added yet!....'
                    )
                  ],
                );
  }
}