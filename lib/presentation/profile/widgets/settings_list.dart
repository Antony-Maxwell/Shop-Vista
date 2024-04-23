
import 'package:flutter/material.dart';

class AccountSettingsList extends StatelessWidget {
  const AccountSettingsList({
    super.key, required this.icon, required this.title, required this.subTitle, required this.screenPage,
  });
  final IconData icon;
  final String title;
  final String subTitle;
  final Widget screenPage;

  @override
  Widget build(BuildContext context) {
    return ListTile(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => screenPage,)),
            leading: Icon(icon, color: Colors.blue, size: 30),
            title: Text(title, style: const TextStyle(fontSize: 18)),
            subtitle: Text(subTitle, style: Theme.of(context).textTheme.bodySmall),
          );
  }
}
