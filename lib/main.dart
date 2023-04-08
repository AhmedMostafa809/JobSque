import 'package:final_project/controller/dio/dio_helper.dart';
import 'package:final_project/controller/local/shared_prefrences.dart';
import 'package:final_project/firebase_options.dart';
import 'package:final_project/utilities/route/reouter.dart';
import 'package:final_project/utilities/route/routes.dart';
import 'package:final_project/utilities/theme/theme.dart';
import 'package:final_project/view/pages/splach_page.dart';
import 'package:final_project/view_model/login_cubit/login_cubit.dart';
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
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await MyCache.init();
  // runApp(MultiBlocProvider(
  //     providers: [
  //       // BlocProvider(create: (_) => ThemeCubit())
  //     ],
  //     child:


  // final prefs =await SharedPreferences.getInstance();
  // final ShowOnBoarding = prefs.getBool('ShowOnBoarding') ?? true;


  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoginCubit()),
        BlocProvider(create: (_) => RegisterCubit()),
        BlocProvider(create: (_) => SelectJobCubit()),
        BlocProvider(create: (_) => SelectJobLocationCubit()),
      ],
      child: const MyApp())));
  // )
  // );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return
    // BlocBuilder<ThemeCubit, ThemeState>(
    //   builder: (context, state) {
    //     ThemeCubit cubit =ThemeCubit.get(context);
    //     cubit.getTheme();
    return Sizer(builder: (context, orientation, deviceType) {
      return const MaterialApp(
        // theme: cubit.isDarkTheme? Themes.darkTheme:Themes.lightTheme,
        // home: SplashScreen(),
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.jobsPageRoute,
        onGenerateRoute: onGenerate,

      );
    });

    //   },
    // );
  }
}


