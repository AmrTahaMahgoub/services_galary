part of 'login_bloc.dart';

@immutable
abstract class LoginBlocState  {}

class LoginBlocInitial extends LoginBlocState {
 
}

class LoginBlocLoading extends LoginBlocState {
  
 
}

class LoginBlocSuccess extends LoginBlocState {
  LoginBlocSuccess({required this.loginModel});
  late LoginModel loginModel;

}

// class LoginFaluireState extends LoginBlocState {
//   LoginModel loginModel;
//   LoginFaluireState(this.loginModel);
  
// }
