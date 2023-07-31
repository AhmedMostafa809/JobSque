import '../../view_model/login_cubit/login_cubit.dart';

class EndPoint{
  static const String loginUrl = "auth/login";
  static String userToken = LoginCubit.loginToken;
  static int id = LoginCubit.loginId;
  static String  name = "";
  static String registerUrl = "auth/register";
  static String selectJobUrl = "user/profile";
  static String editProfile = "user/profile/edit/$id}";
  static String uploadPortofolio = "user/profile/portofolios/$id";



}