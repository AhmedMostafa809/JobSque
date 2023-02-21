import 'package:final_project/view/pages/account/register/register_page.dart';
import 'package:final_project/view_model/login_cubit/login_cubit.dart';
import 'package:final_project/view_model/login_cubit/login_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../../../utilities/assets/app_assets.dart';
import '../../../utilities/route/routes.dart';
import '../../../utilities/theme/app_themes.dart';
import '../../widgets/default_button.dart';
import '../../widgets/default_form_field.dart';




class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  TextEditingController passwordController = TextEditingController();
  TextEditingController loginNameController = TextEditingController();

  final loginFormKey = GlobalKey<FormState>();
  bool flag = true;
  bool isChecked = false;

  bool changeButtonColor(String c1, String c2) {
    if (c1.isEmpty || c2.isEmpty) {
      // color = AppTheme.grey;
      flag = false;
    } else {
      // color = AppTheme.primaryColor;
      flag = true;
    }

    return flag;
  }



  void initState() {
    _loadUserData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {},
      builder: (context, state) {
        final loginCubit = BlocProvider.of<LoginCubit>(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
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
                  "Login",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  "Please login to find your dream job",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.grey),
                ),
                const SizedBox(
                  height: 60,
                ),
                Form(
                  key: loginFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      DefaultFormField(
                        obSecured: false,
                        onChanged: (p0) {
                          setState(() {});
                        },
                        controller: loginNameController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        prefixIcon: Icon(
                          Icons.person_outline,
                          size: 20.sp,
                          color: AppTheme.primaryColor,
                        ),
                        hintText: 'Username',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DefaultFormField(
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
                        obSecured: loginCubit.isSecured,
                        controller: passwordController,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                        prefixIcon: Icon(Icons.lock_outline,
                            size: 20.sp, color: AppTheme.primaryColor),
                        hintText: 'Password',
                        suffixIcon: IconButton(
                            onPressed: () {
                              loginCubit.isSecured == false
                                  ? loginCubit.showPassword(true)
                                  : loginCubit.showPassword(false);
                            },
                            icon: loginCubit.isSecured == true
                                ? Icon(Icons.visibility_off,
                                    size: 20.sp, color: AppTheme.primaryColor)
                                : Icon(Icons.visibility,
                                    size: 20.sp, color: AppTheme.primaryColor)),
                      ),
                      Row(

                        children: [
                          Checkbox(
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;

                                SharedPreferences.getInstance().then(
                                        (prefs) {
                                      prefs.setBool("remember_me", value);
                                      prefs.setString('name',loginNameController.text);
                                      prefs.setString('password', passwordController.text);
                                    },);



                              });
                            },
                          ),
                          const Text(
                            'Remember me? ',
                            style: TextStyle(
                              color: AppTheme.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const Spacer(),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, AppRoutes.restPasswordPageRoute); },
                              child: const Text(
                                'Forgot Password',
                                style: TextStyle(
                                  color: AppTheme.primaryColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height:   15.h,
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                        text: 'Dont’t have an account? ',
                        style: const TextStyle(
                          color: AppTheme.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Register',
                              style: const TextStyle(
                                color: AppTheme.primaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                Navigator.pushNamedAndRemoveUntil(context, AppRoutes.registerPageRoute, (route) => false);
                                  // navigate to desired screen
                                })
                        ]),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                DefaultButton(
                    Onpressed: flag == false
                        ? () {}
                        : () {
                            if (loginFormKey.currentState!.validate()) {
                              Navigator.pushNamed(
                                  context, AppRoutes.homePageRoute);
                            }
                          },
                    text: 'Login',
                    clr: changeButtonColor(
                        loginNameController.text, passwordController.text) ==
                            true
                        ? AppTheme.primaryColor
                        : AppTheme.grey,
                    Height: 7.h,
                    width: 90.w),
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
                    Text("Or Login With Account",
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
      },
    );
  }

  void _loadUserData() async {
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      var _name = _prefs.getString("name") ?? "";
      var password = _prefs.getString("password") ?? "";
      var rememberMe = _prefs.getBool("remember_me") ?? false;

      print(rememberMe);
      print(_name);
      print(password);
      if (rememberMe) {
        setState(() {
          isChecked = true;
        });
        loginNameController.text = _name ?? "";
        passwordController.text = password ?? "";
      }
    } catch (e) {
      print(e);
    }
  }
}







