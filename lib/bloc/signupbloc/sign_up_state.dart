part of 'sign_up_bloc.dart';

abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {
  SignUpSuccess(this.userModel);
  UserModel userModel;
}

class SignUpEmailandPaswwordError extends SignUpState {
  SignUpEmailandPaswwordError(this.emailAndPaswwordError);
  EmailAnPasswordErrorModel emailAndPaswwordError;
}

class SignUpwithEmailError extends SignUpState {
  SignUpwithEmailError(this.emailError);
  EmailErrorsModel emailError;
}
