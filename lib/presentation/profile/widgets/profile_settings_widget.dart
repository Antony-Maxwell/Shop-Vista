import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_vista/application/home/user_bloc/user_bloc.dart';

class UserProfileSettings extends StatelessWidget {
  const UserProfileSettings({
    required this.onpressed,
    super.key,
  });

  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const SizedBox();
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            state.user.profilePicture.isEmpty
                ? const CircleAvatar(
                  backgroundImage: NetworkImage("https://icons.iconarchive.com/icons/iconshock/cms/256/user-icon.png"),
                  radius: 40,
                )
                : CircleAvatar(
                    backgroundImage: NetworkImage(state.user.profilePicture),
                    radius: 40,
                  ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    state.user.userName,
                    style: const TextStyle(color: Colors.white, fontSize: 17),
                  ), // Use actual username data here
                  Text(state.user.email,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16)) // Use actual email data here
                ],
              ),
            ),
            IconButton(
                onPressed: onpressed,
                icon: const Icon(
                  Iconsax.edit5,
                  size: 45,
                )) // Add edit icon
          ],
        );
      },
    );
  }
}
