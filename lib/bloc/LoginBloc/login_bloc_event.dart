part of 'login_bloc.dart';

@immutable
abstract class LoginBlocEvent extends Equatable {}

class LoginSuccessEvent extends LoginBlocEvent {
  LoginSuccessEvent({required this.email, required this.password});
  String email;
  String password;
  @override
  // TODO: implement props
  List<Object?> get props => [email, password];
}

