part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  UserModel user;
  LoginSuccess(this.user);
}

final class LoginError extends LoginState {
  String error;
  LoginError(this.error);
}
