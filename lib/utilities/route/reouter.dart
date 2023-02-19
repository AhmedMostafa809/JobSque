

import 'package:final_project/utilities/route/routes.dart';
import 'package:final_project/view/pages/account/register/jobs_page.dart';
import 'package:final_project/view/pages/account/register/location_page.dart';
import 'package:final_project/view/pages/account/register/register_success.dart';
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

    case AppRoutes.loginRoute:
      return MaterialPageRoute(
          builder: (_) => const LoginPage(), settings: routeSettings);
    case AppRoutes.registerPageRoute:
    default:
      return MaterialPageRoute(
          builder: (_) => const RegisterPage(), settings: routeSettings);
  }
}
