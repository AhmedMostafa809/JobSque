import 'package:final_project/utilities/route/routes.dart';
import 'package:final_project/view/pages/Home_pages/Layout.dart';
import 'package:final_project/view/pages/Home_pages/apply_job/apply_steps.dart';
import 'package:final_project/view/pages/Home_pages/apply_job/apply_success.dart';
import 'package:final_project/view/pages/Home_pages/apply_job/job_details.dart';
import 'package:final_project/view/pages/Messages/messages_page.dart';
import 'package:final_project/view/pages/Messages/send_message_page.dart';
import 'package:final_project/view/pages/account/register/jobs_page.dart';
import 'package:final_project/view/pages/account/register/location_page.dart';
import 'package:final_project/view/pages/account/register/register_success.dart';
import 'package:final_project/view/pages/account/reset_password/check_email.dart';
import 'package:final_project/view/pages/account/reset_password/create_new_password.dart';
import 'package:final_project/view/pages/account/reset_password/reset_password_page.dart';
import 'package:final_project/view/pages/account/reset_password/reset_successfully.dart';
import 'package:final_project/view/pages/Home_pages/home_screen.dart';
import 'package:final_project/view/pages/profile/Edit_profile_page.dart';
import 'package:final_project/view/pages/profile/Help_center_page.dart';
import 'package:final_project/view/pages/profile/Language_page.dart';
import 'package:final_project/view/pages/profile/Login_and_security_page.dart';
import 'package:final_project/view/pages/profile/Notifications_page.dart';
import 'package:final_project/view/pages/profile/Portfolio_page.dart';
import 'package:final_project/view/pages/profile/Privacy_policy_page.dart';
import 'package:final_project/view/pages/profile/Terms_and_conditions_page.dart';
import 'package:flutter/material.dart';

import '../../view/pages/Home_pages/notification_page.dart';
import '../../view/pages/account/login_page.dart';
import '../../view/pages/account/register/register_page.dart';
import '../../view/pages/onboarding.dart';
import '../../view/pages/splach_page.dart';

Route<dynamic> onGenerate(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AppRoutes.splashPageRoute:
      final String email = routeSettings.arguments as String;
      final String password = routeSettings.arguments as String;
      final String token = routeSettings.arguments as String;

      return MaterialPageRoute(
          builder: (context) =>  SplashScreen(email: email,password: password,token: token,), settings: routeSettings);
    case AppRoutes.layoutRoute:
      return MaterialPageRoute(
          builder: (context) => const LayOut(), settings: routeSettings);
    case AppRoutes.restPasswordPageRoute:
      return MaterialPageRoute(
          builder: (context) => const ResetPasswordPage(),
          settings: routeSettings);
    case AppRoutes.searchRoute:
      return MaterialPageRoute(
          builder: (context) => const ResetPasswordPage(),
          settings: routeSettings);
    case AppRoutes.LoginPageRoute:
      return MaterialPageRoute(
          builder: (context) => const LoginPage(), settings: routeSettings);
    case AppRoutes.jobDetailRoute:
      return MaterialPageRoute(
          builder: (context) => const JobDetails(intialIndex: 0),
          settings: routeSettings);
    case AppRoutes.messagesRoute:
      return MaterialPageRoute(
          builder: (context) => const MessagesPage(), settings: routeSettings);
    case AppRoutes.applySuccessRoute:
      return MaterialPageRoute(
          builder: (context) => const ApplySucceeded(),
          settings: routeSettings);
    case AppRoutes.notificationRoute:
      return MaterialPageRoute(
          builder: (context) => const NotificationPage(),
          settings: routeSettings);
    case AppRoutes.stepperRoute:
      return MaterialPageRoute(
          builder: (context) => const ApplyStepsStepper(),
          settings: routeSettings);
    case AppRoutes.createNewPasswordPageRoute:
      return MaterialPageRoute(
          builder: (context) => const CreateNewPassword(),
          settings: routeSettings);
    case AppRoutes.checkEmaailPageRoute:
      return MaterialPageRoute(
          builder: (context) => const CheckEmailPage(),
          settings: routeSettings);
    case AppRoutes.locationPageRoute:
      return MaterialPageRoute(
          builder: (context) => const LocationPage(), settings: routeSettings);
    case AppRoutes.RegisterSuccessPageRoute:
      return MaterialPageRoute(
          builder: (context) => const RegisterSuccessPage(),
          settings: routeSettings);
    case AppRoutes.jobsPageRoute:
      return MaterialPageRoute(
          builder: (context) => const JobsPage(), settings: routeSettings);
    case AppRoutes.onBoardingRoute:
      return MaterialPageRoute(
          builder: (context) => const OnBoarding(), settings: routeSettings);

    case AppRoutes.resetSucceededRoute:
      return MaterialPageRoute(
          builder: (context) => const ResetSucceededPage(),
          settings: routeSettings);

    case AppRoutes.homePageRoute:
      return MaterialPageRoute(
          builder: (context) => const HomePage(), settings: routeSettings);

    case AppRoutes.loginRoute:
      return MaterialPageRoute(
          builder: (_) => const LoginPage(), settings: routeSettings);
    case AppRoutes.editProfilePageRoute:
      return MaterialPageRoute(
          builder: (_) => const EditProfilePage(), settings: routeSettings);
    case AppRoutes.portfolioPageRoute:
      return MaterialPageRoute(
          builder: (_) => const PortfolioPage(), settings: routeSettings);
    case AppRoutes.languagePageRoute:
      return MaterialPageRoute(
          builder: (_) => const LanguagePage(), settings: routeSettings);
    case AppRoutes.profileNotificationsPageRoute:
      return MaterialPageRoute(
          builder: (_) => const ProfileNotificationsPage(),
          settings: routeSettings);
    case AppRoutes.loginAndSecurityRoute:
      return MaterialPageRoute(
          builder: (_) => const LoginAndSecurityPage(),
          settings: routeSettings);
    case AppRoutes.helpCenterPageRoute:
      return MaterialPageRoute(
          builder: (_) => const HelpCenterPage(), settings: routeSettings);
    case AppRoutes.termsAndConditionsRoute:
      return MaterialPageRoute(
          builder: (_) => const TermsAndConditionsPage(),
          settings: routeSettings);
    case AppRoutes.privacyPolicyPageRoute:
      return MaterialPageRoute(
          builder: (_) => const PrivacyPolicyPage(), settings: routeSettings);
    case AppRoutes.registerPageRoute:
    default:
      return MaterialPageRoute(
          builder: (_) => const RegisterPage(), settings: routeSettings);
  }
}
