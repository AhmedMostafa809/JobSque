

import 'package:final_project/utilities/route/routes.dart';
import 'package:final_project/view/pages/Home_pages/Layout.dart';
import 'package:final_project/view/pages/account/register/jobs_page.dart';
import 'package:final_project/view/pages/account/register/location_page.dart';
import 'package:final_project/view/pages/account/register/register_success.dart';
import 'package:final_project/view/pages/account/reset_password/check_email.dart';
import 'package:final_project/view/pages/account/reset_password/create_new_password.dart';
import 'package:final_project/view/pages/account/reset_password/reset_password_page.dart';
import 'package:final_project/view/pages/account/reset_password/reset_successfully.dart';
import 'package:final_project/view/pages/Home_pages/home_screen.dart';
import 'package:flutter/material.dart';

import '../../view/pages/account/login_page.dart';
import '../../view/pages/account/register/register_page.dart';
import '../../view/pages/onboarding.dart';
import '../../view/pages/splach_page.dart';


Route<dynamic> onGenerate(RouteSettings routeSettings) {

  switch (routeSettings.name) {
    case AppRoutes.splashPageRoute:
      return MaterialPageRoute(
          builder: (context) => const SplashScreen(), settings: routeSettings);
    case AppRoutes.layoutRoute:
      return MaterialPageRoute(
          builder: (context) => const LayOut(), settings: routeSettings);
    case AppRoutes.restPasswordPageRoute:
      return MaterialPageRoute(
          builder: (context) => const ResetPasswordPage(), settings: routeSettings);
    case AppRoutes.LoginPageRoute:
      return MaterialPageRoute(
          builder: (context) => const LoginPage(), settings: routeSettings);
    case AppRoutes.createNewPasswordPageRoute:
      return MaterialPageRoute(
          builder: (context) => const CreateNewPassword(), settings: routeSettings);
    case AppRoutes.checkEmaailPageRoute:
      return MaterialPageRoute(
          builder: (context) => const CheckEmailPage(), settings: routeSettings);
    case AppRoutes.locationPageRoute:
      return MaterialPageRoute(
          builder: (context) => const LocationPage(), settings: routeSettings);
    case AppRoutes.RegisterSuccessPageRoute:
      return MaterialPageRoute(
          builder: (context) => const RegisterSuccessPage(), settings: routeSettings);
    case AppRoutes.jobsPageRoute:
      return MaterialPageRoute(
          builder: (context) => const JobsPage(), settings: routeSettings);
    case AppRoutes.onBoardingRoute:
      return MaterialPageRoute(
          builder: (context) => const OnBoarding(), settings: routeSettings);

    case AppRoutes.resetSucceededRoute:
      return MaterialPageRoute(
          builder: (context) => const ResetSucceededPage(), settings: routeSettings);

    case AppRoutes.homePageRoute:
      return MaterialPageRoute(
          builder: (context) => const HomePage(), settings: routeSettings);

    case AppRoutes.loginRoute:
      return MaterialPageRoute(
          builder: (_) => const LoginPage(), settings: routeSettings);
    case AppRoutes.registerPageRoute:
    default:
      return MaterialPageRoute(
          builder: (_) => const RegisterPage(), settings: routeSettings);
  }
}
