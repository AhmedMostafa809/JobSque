// import 'package:bloc/bloc.dart';
// import 'package:final_project/controller/local/shared_prefrences.dart';
// import 'package:final_project/utilities/enums/enums.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:meta/meta.dart';
//
// part 'theme_state.dart';
//
// class ThemeCubit extends Cubit<ThemeState> {
//   ThemeCubit() : super(ThemeInitial());
//
//   static ThemeCubit get(context) => BlocProvider.of(context);
//   bool isDarkTheme = false;
//
//   void changeTheme() {
//     isDarkTheme = !isDarkTheme;
//     MyCache.putBool(key: MyCacheKey.theme, value: isDarkTheme);
//     emit(ChangeTheme());
//   }
//
//   void getTheme() {
//     MyCache.getBool(key: MyCacheKey.theme);
//     emit(GetTheme());
//   }
// }
