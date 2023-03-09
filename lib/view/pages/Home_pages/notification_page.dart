import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../utilities/assets/app_assets.dart';
import '../../../utilities/theme/app_themes.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Notification',
          style: TextStyle(color: Colors.black87, fontSize: 20),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed:(){Navigator.pop(context);} ,
          icon: const Icon(Icons.arrow_back),
          color: AppTheme.darkGrey,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10.h,),
              Image.asset(
                Img.notification,
                height: 30.h,
              ),
              SizedBox(height: 5.h,),
              const Text(
                "No new notifications yet",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "You will receive a notification if there is something on your account",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppTheme.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
