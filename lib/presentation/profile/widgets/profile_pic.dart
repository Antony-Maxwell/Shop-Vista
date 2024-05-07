import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:shop_vista/application/home/user_bloc/user_bloc.dart';

class ProfilePictureWidget extends StatelessWidget {
  const ProfilePictureWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => Container(
            color: Colors.grey,
            width: double.infinity,
            height: 150,
            child: Column(
              children: [
                const Text(
                  'Choose from',
                ),
                const Divider(),
                TextButton(
                    onPressed: () {
                      pickImage(ImageSource.camera);
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Camera',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    )),
                TextButton(
                    onPressed: () {
                      pickImage(ImageSource.gallery);
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Gallery',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ))
              ],
            ),
          ),
        );
      },
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if(state.isLoading){
            return CircleAvatar(
            backgroundImage: NetworkImage(
                "https://icons.iconarchive.com/icons/iconshock/cms/256/user-icon.png"),
            radius: 80,
          );
          }else{
            return CircleAvatar(
            backgroundImage: NetworkImage(
                state.user.profilePicture),
            radius: 80,
          );
          }
        },
      ),
    );
  }

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imagePermanent = await saveImagePermanently(image.path);
      String fileName = DateTime.now().microsecondsSinceEpoch.toString();
      Reference referenceRoot = FirebaseStorage.instance.ref();
      Reference referenceDireImage = referenceRoot.child("ProfilePicture");
      Reference referenceImageToUpload = referenceDireImage.child(fileName);
      try {
        await referenceImageToUpload.putFile(File(imagePermanent.path));
        print('success///////////////////////////////////////////////////');
        String downloadUrl = await referenceImageToUpload.getDownloadURL();
        await updateProfilePicturePath(downloadUrl);
      } catch (e) {
        print(e);
      }
      // widget.onImageSelected(imagePermanent.path);
    } on PlatformException catch (e) {
      print('failed to pick image $e');
    }
  }

  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');
    return File(imagePath).copy(image.path);
  }

  Future<void> updateProfilePicturePath(String downloadUrl) async {
    try {
      // Get current user from FirebaseAuth
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return;

      // Update profilePicture field in Firestore
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(user.uid)
          .update({'ProfilePicture': downloadUrl});

      print('Profile picture updated successfully');
      const ScaffoldMessenger(child: SnackBar(content: Text('Successfully updated your profile')));
    } catch (e) {
      print('Failed to update profile picture: $e');
    }
  }
}
