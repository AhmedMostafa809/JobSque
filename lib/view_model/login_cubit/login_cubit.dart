import 'package:bloc/bloc.dart';
import 'package:final_project/model/auth_models/user_login_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../controller/dio/endpoints.dart';
import '../../controller/dio/dio_helper.dart';
import '../../utilities/cashe_helper.dart';

part 'login_state.dart';


class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  LoginModel loginModel = LoginModel();
  bool isSecured = true;
  bool confirm = true;
  static String loginToken = "";
  static int loginId =0;
  void showPassword(bool isSec) {
    isSecured = isSec;
    emit(ChangePasswordState());
  }

  void userLogin({required String? email, required String password}) {
    emit(LoginLoadingState());
    DioHelper.postData(
      endPoint: EndPoint.loginUrl,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      loginToken = loginModel.token!;
      EndPoint.userToken=loginModel.token!;
      loginId = loginModel.user!.id!;
      EndPoint.id = loginModel.user!.id!;
      EndPoint.name=loginModel.user!.name!;
      CacheManager.saveData("name", EndPoint.name);
      CacheManager.saveData("email", email);
      CacheManager.saveData("password", password);
      CacheManager.saveData("token", EndPoint.userToken);
      print('idxxx is  $loginId');
      print('token is  $loginToken}');


      if (loginModel.token != null) {
        emit(LoginSuccessState());
      } else if (loginModel.token == null) {
        print('Error state');
        emit(LoginErrorState());
      }
    }).catchError((e){
      emit(LoginErrorState());

    });

    // int? loginId = loginModel.user?.id;


  }

  void showConfirmPassword(bool Sec) {
    confirm = Sec;
    emit(ConfirmState());
  }
}
