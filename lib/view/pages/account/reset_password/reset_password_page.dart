import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../utilities/assets/app_assets.dart';
import '../../../../utilities/route/routes.dart';
import '../../../../utilities/theme/app_themes.dart';
import '../../../widgets/default_button.dart';
import '../../../widgets/default_form_field.dart';


TextEditingController emailController = TextEditingController();


class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading:  IconButton(
          onPressed: ()=> Navigator.pop(context),
        icon: Icon(Icons.arrow_back),
        color: AppTheme.grey,
    ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Image.asset(
                Img.AppLogo,
                width: 25.w,
              ),
            )
          ],
        ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w,vertical: 3.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            const Text(
              "Reset Password",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "Enter the email address you used when you joined and we’ll send you instructions to reset your password.",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppTheme.grey),
            ),
            SizedBox(height: 5.h,),
            DefaultFormField(

              controller: emailController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              prefixIcon: Icon(
                Icons.mail_outline,
                size: 20.sp,
                color: AppTheme.primaryColor,
              ),
              hintText: 'Email', obSecured: false,
            ),
            const Spacer(),
            Center(
              child: RichText(
                text: TextSpan(
                    text: 'You remember your password ',
                    style: const TextStyle(
                      color: AppTheme.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Login',
                          style: const TextStyle(
                            color: AppTheme.primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamedAndRemoveUntil(context, AppRoutes.loginRoute, (route) => false);
                              // navigate to desired screen
                            })
                    ]),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: DefaultButton(
                  Onpressed: (){
                    Navigator.pushNamed(context, AppRoutes.checkEmaailPageRoute);
                  },
                  text: 'Request password reset',
                  clr:  AppTheme.primaryColor,
                      Height: 7.h,
                  width: 90.w),
            ),

          ],
        ),
      ),
    );
  }
}
