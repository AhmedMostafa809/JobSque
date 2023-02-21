import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../utilities/assets/app_assets.dart';
import '../../../../utilities/route/routes.dart';
import '../../../../utilities/theme/app_themes.dart';
import '../../../widgets/default_button.dart';

class ResetSucceededPage extends StatelessWidget {
  const ResetSucceededPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                Img.resetSucceeded,
                height: 30.h,
              ),
              SizedBox(height: 5.h,),
              const Text(
                "Password changed succesfully!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "Your password has been changed successfully, we will let you know if there are more problems with your account",
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
              Onpressed: () => Navigator.pushNamedAndRemoveUntil(context, AppRoutes.loginRoute, (route) => false),
              text: "Open email app",
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
