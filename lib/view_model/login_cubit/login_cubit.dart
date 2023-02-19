import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);



  bool isSecured=false;
  bool confirm = false;
  void showPassword(bool isSec){
    isSecured = isSec;
    emit(ChangePasswordState());
  }

  void showConfirmPassword(bool Sec){
    confirm = Sec;
    emit(ConfirmState());
  }


}
