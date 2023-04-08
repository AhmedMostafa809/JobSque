import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/controller/dio/endpoints.dart';
import 'package:final_project/controller/dio/dio_helper.dart';
import 'package:final_project/model/auth_models/user_login_model.dart';
import 'package:final_project/model/auth_models/user_register_model.dart';
import 'package:final_project/utilities/theme/app_themes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

  bool isSecured = true;
  RegisterModel registerModel = RegisterModel();

  void showPassword(bool isSec) {
    isSecured = isSec;
    emit(ChangePasswordState());
  }

  void userRegister(String name, String email, String password) {
    emit(RegisterLoadingState());
    DioHelper.postData(
      token: EndPoint.userToken,
      endPoint: EndPoint.registerUrl,
      data: {
        'name': name,
        'email': email,
        'password': password,
      },
          ).then((value) {
              registerModel = RegisterModel.fromJson(value.data);
              EndPoint.userToken = registerModel.token!;
              if (registerModel.token != null) {
                EndPoint.id = registerModel.profile!.id!;
                print(' token is ${EndPoint.userToken} , id is ${EndPoint.id}');
                emit(RegisterSuccessState());
              }
              // else if (registerModel.token == null) {
              //   print('Registration error state');
              //   emit(RegisterErrorState());
              // }
              }).catchError( (e){
      Fluttertoast.showToast(
          msg: "Use another email or password",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
                print(e.toString());emit(RegisterErrorState());});

    }
  }

