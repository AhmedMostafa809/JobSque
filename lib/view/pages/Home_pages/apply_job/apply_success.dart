import 'package:final_project/view/pages/Home_pages/Layout.dart';
import 'package:final_project/view/pages/Home_pages/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../utilities/assets/app_assets.dart';
import '../../../../utilities/route/routes.dart';
import '../../../../utilities/theme/app_themes.dart';
import '../../../widgets/default_button.dart';

class ApplySucceeded extends StatelessWidget {
  const ApplySucceeded({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Job Details',
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
              Image.asset(
                Img.applySucceeded,
                height: 30.h,
              ),
              SizedBox(height: 5.h,),
              const Text(
                "Your data has been successfully sent",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "You will get a message from our team, about the announcement of employee acceptance",
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
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DefaultButton(
              Onpressed: () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LayOut(),), (route) => false),
              text: "Back to home",
              Height: 7.h,
              width: 90.w,
              clr: AppTheme.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
