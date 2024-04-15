import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

class CustomSnackBar{
  void showSuccessSnackBar(BuildContext context, String msg) {
    final materialBanner = SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: SizedBox(
        height: 70,
        child: AwesomeSnackbarContent(
          title: 'Success!',
          message: msg,
          /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
          contentType: ContentType.success,
          // to configure for material banner
          inMaterialBanner: true,
          titleFontSize: 14,
          messageFontSize: 12,
        ),
      ),
    );
    
    ScaffoldMessenger.of(context)
      ..hideCurrentMaterialBanner()
      ..showSnackBar(materialBanner);
  }

  void showErrorSnackBar(BuildContext context, String msg) {
    final snackBar = SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: SizedBox(
        height: 70,
        child: AwesomeSnackbarContent(
          title: 'Oops..!',
          message: msg,
          titleFontSize: 14,
          messageFontSize: 12,
          /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
          contentType: ContentType.warning,
        ),
      ),
    );
    
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}