part of 'login_bloc.dart';

@immutable
abstract class LoginBlocState {}

class LoginBlocInitial extends LoginBlocState {}

class LoginBlocLoading extends LoginBlocState {}

class LoginBlocSuccess extends LoginBlocState {
  LoginBlocSuccess({required this.token});
  final LoginModel token;
}

class LoginFaluireState extends LoginBlocState {
 LoginModelErrors error;
  LoginFaluireState(this.error);
 
}
