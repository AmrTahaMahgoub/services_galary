part of 'sign_up_bloc.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUploaded extends SignUpState {
  SignUploaded({required this.token});
  final String? token;
}

class SignUpfailure extends SignUpState {
  SignUpfailure(this.error);
  String? error;
}
