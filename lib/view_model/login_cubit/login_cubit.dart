import 'package:bloc/bloc.dart';
import 'package:final_project/model/auth_models/user_login_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../controller/dio/endpoints.dart';
import '../../controller/dio/dio_helper.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  LoginModel loginModel = LoginModel();
  bool isSecured = true;
  bool confirm = true;

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
      print('token is  ${loginModel.token}');
      if (loginModel.token != null) {
        emit(LoginSuccessState());
      } else if (loginModel.token == null) {
        print('Error state');

        emit(LoginErrorState());
      }
    });
  }

  void showConfirmPassword(bool Sec) {
    confirm = Sec;
    emit(ConfirmState());
  }
}
