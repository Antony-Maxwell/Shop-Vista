import 'package:flutter/material.dart';

class MyDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Alert'),
      content: const Text('Since you are signed in using google add your profile details\n Go to -> \n 𝙋𝙧𝙤𝙛𝙞𝙡𝙚> 𝙀𝙙𝙞𝙩 𝙋𝙧𝙤𝙛𝙞𝙡𝙚> 𝘼𝙙𝙙 𝙮𝙤𝙪𝙧 𝙙𝙚𝙩𝙖𝙞𝙡𝙨'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text('Close'),
        ),
      ],
    );
  }
}