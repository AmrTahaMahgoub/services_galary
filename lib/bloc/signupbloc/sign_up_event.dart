part of 'sign_up_bloc.dart';

abstract class SignUpEvent  {
  const SignUpEvent();

  
}

class SignUpSuccessEvent extends SignUpEvent {
  String name;
  String email;
  String password;
  String cityId;
  SignUpSuccessEvent(this.name, this.email, this.password, this.cityId);

}
// 
