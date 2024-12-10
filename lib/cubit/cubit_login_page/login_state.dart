part of 'login_cubit.dart';

abstract class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginSaccess extends LoginState {}

final class LoginLoding extends LoginState {}

final class LoginFaliure extends LoginState {
  String errMessage;
  LoginFaliure({required this.errMessage});
}
