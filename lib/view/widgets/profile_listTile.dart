import 'package:final_project/utilities/theme/app_themes.dart';
import 'package:flutter/material.dart';

class ProfileListTile extends StatelessWidget {
  String title;
  Function()? onTap;
  IconData? icon;
  ProfileListTile({required this.title,required this.onTap, this.icon});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Icon(Icons.arrow_forward),
      title: Text(title),
      onTap: onTap,
      leading: CircleAvatar(
        backgroundColor: AppTheme.lightblue,
        child: Icon(icon)
      ),
    );
  }
}
