import 'package:bloc/bloc.dart';
import 'package:final_project/model/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../controller/constants/endpoints.dart';
import '../../controller/dio/dio_helper.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);


  LoginModel loginModel =LoginModel();
  bool isSecured=true;
  bool confirm = true;
  void showPassword(bool isSec){
    isSecured = isSec;
    emit(ChangePasswordState());
  }

  void showConfirmPassword(bool Sec){
    confirm = Sec;
    emit(ConfirmState());
  }


  void userLogin({required String email, required String password})
  {
    emit(LoginLoadingState());
     DioHelper.postData(
      // token: EndPoint.userToken,
      endPoint: EndPoint.loginUrl,
      data: {
        'email': email,
        'password': password,
      },
      // token: EndPoint.userToken
    ).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      // CacheHelper.setString("userToken", loginModel!.token!);
      // CacheHelper.setInt("userId", loginModel!.user!.id!);
      emit(LoginSuccessState());
    }).catchError((error) {
      print(error.toString() + " A7A");
      emit(LoginErrorState());
    });
  }




}
