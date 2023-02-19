part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}


class ChangePasswordState extends LoginState {}
class ConfirmState extends LoginState {}