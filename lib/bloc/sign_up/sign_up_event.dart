part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUpSuccessEvent extends SignUpEvent {
  String name;
  String email;
  String password;
  int cityId;
  SignUpSuccessEvent(this.name, this.email, this.password, this.cityId);
}
