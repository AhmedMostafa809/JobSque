import 'package:email_validator/email_validator.dart';
import 'package:final_project/utilities/assets/app_assets.dart';
import 'package:final_project/utilities/route/routes.dart';
import 'package:final_project/utilities/theme/app_themes.dart';
import 'package:final_project/view/widgets/deafault_text.dart';
import 'package:final_project/view/widgets/default_button.dart';
import 'package:final_project/view/widgets/default_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';

import '../../../../view_model/register_cubit/register_cubit.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  late Color color;

// bool isSecured = true;
  bool flag = true;

  bool changeButtonColor(String c1, String c2, String c3) {
    if (c1.isEmpty || c2.isEmpty || c3.isEmpty) {
      color = AppTheme.grey;
      flag = false;
    } else {
      color = AppTheme.primaryColor;
      flag = true;
    }

    return flag;
  }

  @override
  Widget build(BuildContext context) {
    final registerCubit = BlocProvider.of<RegisterCubit>(context);
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
          physics: BouncingScrollPhysics(),
          children: [
            const Text(
              "Create Account",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "Please create an account to find your dream job",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppTheme.grey),
            ),
            const SizedBox(
              height: 60,
            ),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultFormField(
                    onChanged: (p0) {
                      setState(() {});
                    },
                    obSecured: false,
                    textInputAction: TextInputAction.next,
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    prefixIcon: Icon(Icons.person_outline,
                        size: 20.sp, color: AppTheme.primaryColor),
                    hintText: 'Username',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DefaultFormField(
                    obSecured: false,
                    onChanged: (p0) {
                      setState(() {});
                    },
                    controller: emailController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icon(
                      Icons.mail_outline,
                      size: 20.sp,
                      color: AppTheme.primaryColor,
                    ),
                    hintText: 'Email',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocConsumer<RegisterCubit, RegisterState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return DefaultFormField(
                        validator: (p0) {
                          if (p0 == null || p0.length < 8) {
                            return 'Password must be at least 8 characters';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (p0) {
                          setState(() {});
                        },
                        // obscureText: true,
                        obSecured: registerCubit.isSecured,
                        controller: passwordController,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                        prefixIcon: Icon(Icons.lock_outline,
                            size: 20.sp, color: AppTheme.primaryColor),
                        hintText: 'Password',
                        suffixIcon: IconButton(
                            onPressed: () {
                              registerCubit.isSecured == false
                                  ? registerCubit.showPassword(true)
                                  : registerCubit.showPassword(false);
                              setState(() {});
                            },
                            icon: registerCubit.isSecured == false
                                ? Icon(Icons.visibility,
                                size: 20.sp, color: AppTheme.primaryColor)
                                : Icon(Icons.visibility_off,
                                size: 20.sp, color: AppTheme.primaryColor)),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Password must be at least 8 characters',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppTheme.grey),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Center(
              child: RichText(
                text: TextSpan(
                    text: 'Already have an account? ',
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
                              Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  AppRoutes.LoginPageRoute,
                                      (route) => false);
                            })
                    ]),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            BlocConsumer<RegisterCubit, RegisterState>(
              listener: (context, state) {
                if (state is RegisterSuccessState) {
                  Navigator.pushNamed(
                      context, AppRoutes.jobsPageRoute);
                }
              },
              builder: (context, state) {
                if(state is RegisterLoadingState){
                  return const Center(child: CircularProgressIndicator(),);
                 }

                return DefaultButton(
                    Onpressed: flag == false
                        ? () {}
                        : () {
                            if (formKey.currentState!.validate()) {
                              {
                                registerCubit.userRegister(
                                    nameController.text,
                                    emailController.text,
                                    passwordController.text);
                                                                // else if (state is RegisterErrorState) {
                                //
                                // }
                              }
                            }
                          },
                    text: 'Create account',
                    clr: changeButtonColor(
                        nameController.text,
                        emailController.text,
                        passwordController.text) ==
                        true
                        ? AppTheme.primaryColor
                        : AppTheme.grey,
                    Height: 7.h,
                    width: 90.w);
              },
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Expanded(
                  child: Divider(
                    color: AppTheme.grey,
                    thickness: 1,
                    endIndent: 20,
                  ),
                ),
                Text("Or Sign up With Account",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppTheme.grey)),
                Expanded(
                  child: Divider(
                    color: AppTheme.grey,
                    thickness: 1,
                    indent: 20,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  Img.google,
                  width: 40.w,
                ),
                Image.asset(Img.facebook, width: 40.w),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
