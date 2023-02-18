

import 'dart:async';

import 'package:final_project/utilities/assets/app_assets.dart';
import 'package:final_project/utilities/route/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void initState(){
    super.initState();
    Timer(Duration(seconds:3), ()=>Navigator.pushReplacementNamed(context, AppRoutes.onBoardingRoute,));
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