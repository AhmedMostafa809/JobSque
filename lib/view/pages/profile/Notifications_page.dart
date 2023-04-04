import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../utilities/theme/app_themes.dart';

class ProfileNotificationsPage extends StatefulWidget {
  const ProfileNotificationsPage({Key? key}) : super(key: key);

  @override
  State<ProfileNotificationsPage> createState() =>
      _ProfileNotificationsPageState();
}

bool S1 = false;
bool S2 = false;
bool S3 = false;
bool S4 = false;
bool S5 = false;
bool S6 = false;
bool S7 = false;
bool S8 = false;

class _ProfileNotificationsPageState extends State<ProfileNotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notifications',
          style: TextStyle(color: Colors.black87, fontSize: 20),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, color: AppTheme.darkGrey)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            height: 4.h,
            color: AppTheme.lightGrey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
              child: const Text(
                'Job notification',
                style: TextStyle(color: AppTheme.grey),
              ),
            ),
          ),
          ListTile(
            title: Text('Your Job Search Alert'),
            trailing: Switch(
                value: S1,
                onChanged: (value) {
                  S1 = value;
                  setState(() {});
                }),
          ),
          const Divider(
            thickness: 2,
            indent: 20,
            endIndent: 20,
          ),
          ListTile(
            title: Text('Job Application Update'),
            trailing: Switch(
                value: S2,
                onChanged: (value) {
                  S2 = value;
                  setState(() {});
                }),
          ),
          const Divider(
            thickness: 2,
            indent: 20,
            endIndent: 20,
          ),
          ListTile(
            title: Text('Job Application Reminders'),
            trailing: Switch(
                value: S3,
                onChanged: (value) {
                  S3 = value;
                  setState(() {});
                }),
          ),
          const Divider(
            thickness: 2,
            indent: 20,
            endIndent: 20,
          ),
          ListTile(
            title: Text('Jobs You May Be Interested In'),
            trailing: Switch(
                value: S4,
                onChanged: (value) {
                  S4 = value;
                  setState(() {});
                }),
          ),
          const Divider(
            thickness: 2,
            indent: 20,
            endIndent: 20,
          ),
          ListTile(
            title: Text('Job Seeker Updates'),
            trailing: Switch(
                value: S5,
                onChanged: (value) {
                  S5 = value;
                  setState(() {});
                }),
          ),
          Container(
            width: double.infinity,
            height: 4.h,
            color: AppTheme.lightGrey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
              child: const Text(
                'Other notification',
                style: TextStyle(color: AppTheme.grey),
              ),
            ),
          ),
          ListTile(
            title: Text('Message Nudges'),
            trailing: Switch(

                value: S6,
                onChanged: (value) {
                  S6 = value;
                  setState(() {});
                }),
          ),
          const Divider(
            thickness: 2,
            indent: 20,
            endIndent: 20,
          ),
          ListTile(
            title: Text('Message Nudges'),
            trailing: Switch(
                value: S7,
                onChanged: (value) {
                  S7 = value;
                  setState(() {});
                }),
          ),
          const Divider(
            thickness: 2,
            indent: 20,
            endIndent: 20,
          ),
          ListTile(
            title: Text('Message Nudges'),
            trailing: Switch(
                value: S8,
                onChanged: (value) {
                  S8 = value;
                  setState(() {});
                }),
          ),
        ],
      ),
    );
  }
}
