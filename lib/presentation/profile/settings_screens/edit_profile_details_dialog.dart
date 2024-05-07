import 'package:flutter/material.dart';
import 'package:shop_vista/infrastructure/profile/profile_details/profile_details.dart';
import 'package:shop_vista/presentation/auth/sign_up.dart';

class AddProfileDetails extends StatelessWidget {
  const AddProfileDetails({super.key, required this.field, required this.documentId});

  final String field;
  final String documentId;


  @override
  Widget build(BuildContext context) {
    TextEditingController editingController = TextEditingController();
    return AlertDialog(
      title: const Text('Alert'),
      content: SignTextFeild(emailController: editingController, icon: const Icon(Icons.add_circle_sharp), hint: 'Enter here', errorMsg: 'Did you forgot to enter value'),
      actions: <Widget>[
        TextButton(
          onPressed: () async{
            if(field == 'PhoneNumber'){
            UpdateProfileDetails().updateField(documentId, field, int.parse(editingController.text));
            }else{
            UpdateProfileDetails().updateField(documentId, field, editingController.text);
            }
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text('Close'),
        ),
      ],
    );
  }
}