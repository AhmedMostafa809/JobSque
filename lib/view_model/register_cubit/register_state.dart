part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
class RegisterSuccessState extends RegisterState {}
class ChangePasswordState extends RegisterState {}
class ChangeColorToBlueState extends RegisterState {}
class ChangeColorToGreyState extends RegisterState {}