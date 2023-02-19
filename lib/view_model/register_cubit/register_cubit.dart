import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/model/user_model.dart';
import 'package:final_project/utilities/theme/app_themes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

  // FirebaseFirestore fireStore = FirebaseFirestore.instance;
  // FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  // UserModel registerUserModel = UserModel();
  //
  // void registerWithEmailAndPassword(
  //     String email, String password, name, job, location) async {
  //   UserCredential credential = await firebaseAuth
  //       .createUserWithEmailAndPassword(email: email, password: password);
  //   registerUserModel.email = email;
  //   registerUserModel.password = password;
  //   registerUserModel.name = name;
  //   registerUserModel.job = job;
  //   registerUserModel.location = location;
  //   registerUserModel.id = credential.user!.uid;
  //   fireStore
  //       .collection('Users')
  //       .doc(registerUserModel.id)
  //       .set(registerUserModel.toMap());
  //   emit(RegisterSuccessState());
  // }

bool isSecured=true;
void showPassword(bool isSec){
  isSecured = isSec;
  emit(ChangePasswordState());
}



}
