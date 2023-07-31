import 'package:final_project/controller/dio/dio_helper.dart';
import 'package:final_project/controller/local/shared_prefrences.dart';
import 'package:final_project/firebase_options.dart';
import 'package:final_project/utilities/cashe_helper.dart';
import 'package:final_project/utilities/route/reouter.dart';
import 'package:final_project/utilities/route/routes.dart';
import 'package:final_project/utilities/theme/theme.dart';
import 'package:final_project/view/pages/Home_pages/Layout.dart';
import 'package:final_project/view/pages/splach_page.dart';
import 'package:final_project/view_model/login_cubit/login_cubit.dart';
import 'package:final_project/view_model/profile_cubit/get_profile_cubit.dart';
import 'package:final_project/view_model/register_cubit/register_cubit.dart';
import 'package:final_project/view_model/register_cubit/select_job_cubit/select_job_cubit.dart';
import 'package:final_project/view_model/register_cubit/select_location/select_job_location_cubit.dart';
import 'package:final_project/view_model/theme_cubit/theme_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import 'Bloc_opserver.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheManager.init();
  String? email,password,token;
  if(CacheManager.getData("email")!=null){
    email = await CacheManager.getData("email");
    password = await CacheManager.getData("password");
    token = await CacheManager.getData("token");

  }
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoginCubit()),
        BlocProvider(create: (_) => RegisterCubit()),
        BlocProvider(create: (_) => SelectJobCubit()),
        BlocProvider(create: (_) => SelectJobLocationCubit()),
        BlocProvider(create: (_) => GetProfileCubit()),

      ],
      child:  MyApp(email: email,password: password,token: token,))));

}

class MyApp extends StatelessWidget {
  String? email,password,token;
  MyApp({super.key,required this.email,required this.password
    ,required this.token,});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: onGenerate,
        home: SplashScreen(email: email,password: password,token: token,),
      );
    });

    //   },
    // );
  }
}


