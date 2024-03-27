part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

class LoginInitial extends LoginState {}

final class LoginSuccess extends LoginState {
  final String userName;

  LoginSuccess(this.userName);
}

final class LoginFailure extends LoginState {
  final String error;

  LoginFailure(this.error);

}

final class LoginLoading extends LoginState{}
