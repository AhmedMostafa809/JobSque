

import 'package:final_project/view/pages/account/reset_password/reset_successfully.dart';
import 'package:final_project/view_model/login_cubit/login_cubit.dart';
import 'package:final_project/view_model/login_cubit/login_cubit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../utilities/assets/app_assets.dart';
import '../../../../utilities/route/routes.dart';
import '../../../../utilities/theme/app_themes.dart';
import '../../../widgets/default_button.dart';
import '../../../widgets/default_form_field.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({Key? key}) : super(key: key);

  @override
  _CreateNewPasswordState createState() => _CreateNewPasswordState();
}

// bool passwordIcon = false;
// bool confirmIcon = true;
TextEditingController passwordController = TextEditingController();
TextEditingController passwordConfirmController = TextEditingController();
final resetFormKey = GlobalKey<FormState>();
//
// void changeResetPassword(){
//   passwordIcon != passwordIcon;
//
// }
// void changeConfirmPassword(){
//   confirmIcon != confirmIcon;
// }

class _CreateNewPasswordState extends State<CreateNewPassword> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final loginCubit = BlocProvider.of<LoginCubit>(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: const Icon(
              Icons.arrow_back,
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
            padding: const EdgeInsets.all(24.0),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const Text(
                  "Create new password",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  "Set your new password so you can login and acces Jobsque",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.grey),
                ),
                const SizedBox(
                  height: 60,
                ),
                Form(
                  key: resetFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultFormField(
                        validator: (p0) {
                          if (p0 == null || p0.length < 8) {
                            return 'Password must be at least 8 characters';
                          } else {
                            return null;
                          }
                        },

                        // obscureText: true,
                        obSecured: loginCubit.isSecured,
                        controller: passwordController,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                        prefixIcon: Icon(Icons.lock_outline,
                            size: 20.sp, color: AppTheme.primaryColor),
                        hintText: 'Password',
                        suffixIcon: IconButton(
                            onPressed: () {
                              loginCubit.isSecured == true
                                  ? loginCubit.showPassword(false)
                                  : loginCubit.showPassword(true);
                            },
                            icon: loginCubit.isSecured == true
                                ? Icon(Icons.visibility_off,
                                    size: 20.sp, color: AppTheme.primaryColor)
                                : Icon(Icons.visibility,
                                    size: 20.sp, color: AppTheme.primaryColor)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DefaultFormField(
                        validator: (p0) {
                          if (p0 == null) {
                            return 'Password must be at least 8 characters';
                          } else if (passwordController.text !=
                              passwordConfirmController.text) {
                            return 'Password not match';
                          } else {
                            return null;
                          }
                        },
                        // obscureText: true,
                        obSecured: loginCubit.confirm,
                        controller: passwordConfirmController,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                        prefixIcon: Icon(Icons.lock_outline,
                            size: 20.sp, color: AppTheme.primaryColor),
                        hintText: 'Confirm Password',
                        suffixIcon: IconButton(
                            onPressed: () {
                              loginCubit.confirm == true
                                  ? loginCubit.showConfirmPassword(false)
                                  : loginCubit.showConfirmPassword(true);
                            },
                            icon: loginCubit.confirm == true
                                ? Icon(Icons.visibility_off,
                                    size: 20.sp, color: AppTheme.primaryColor)
                                : Icon(Icons.visibility,
                                    size: 20.sp, color: AppTheme.primaryColor)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                    ],
                  ),
                ),


              ],
            ),
          ),
          bottomSheet: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: DefaultButton(
                    Onpressed: () {
                      if (resetFormKey.currentState!.validate()) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ResetSucceededPage()));
                      }

                    },
                    text: 'Reset Password',
                    clr: AppTheme.primaryColor,
                    Height: 7.h,
                    width: 90.w),
              ),
            ],
          ),
        );
      },
    );
  }
}
