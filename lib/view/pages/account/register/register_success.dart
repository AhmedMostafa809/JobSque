import 'package:final_project/utilities/assets/app_assets.dart';
import 'package:final_project/utilities/theme/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../utilities/route/routes.dart';
import '../../../widgets/default_button.dart';

class RegisterSuccessPage extends StatelessWidget {
  const RegisterSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed:(){Navigator.pop(context);} ,
          icon: Icon(Icons.arrow_back),
          color: AppTheme.darkGrey,
        ),
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
                Img.registerSuccess,
                height: 30.h,
              ),
              SizedBox(height: 5.h,),
              Text(
                "Your account has been set up!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "We have customized feeds according to your preferences",
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
              Onpressed: () => Navigator.pushNamed(
                  context, AppRoutes.RegisterSuccessPageRoute),
              text: "Get Started",
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
