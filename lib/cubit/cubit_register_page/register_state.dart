part of 'register_cubit.dart';

sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoding extends RegisterState {}

final class RegisterSuccess extends RegisterState {}

final class RegisterFaliure extends RegisterState {
  String errMessage;
  RegisterFaliure({required this.errMessage});
}
