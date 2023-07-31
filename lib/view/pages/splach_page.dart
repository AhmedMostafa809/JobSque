

import 'dart:async';

import 'package:final_project/utilities/assets/app_assets.dart';
import 'package:final_project/utilities/route/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'account/login_page.dart';
import 'onboarding.dart';

class SplashScreen extends StatefulWidget {

  String? email,password,token;
  SplashScreen({Key? key,required this.email,required this.password,required this.token,}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {

  void initState(){
    super.initState();
    String secondScreen = AppRoutes.loginRoute;
    if(widget.email!= null &&widget.password!= null&&widget.token!= null){
      secondScreen = AppRoutes.layoutRoute;
    }
    Timer(const Duration(seconds:3), ()=>Navigator.pushReplacementNamed(context, secondScreen,));
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Stack(children: [

        Center(child: Image.asset(Img.splashBlurring,),),
        Center(child: Image.asset(Img.AppLogo)),


      ]),
    );
  }
}