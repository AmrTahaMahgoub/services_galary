import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:services_galary/models/auth/signup_model.dart';
import 'package:services_galary/repository/auth/signup_repo.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUp newSignUp = SignUp();

  SignUpBloc(
    this.newSignUp,
  ) : super(SignUpInitial()) {
    on<SignUpSuccessEvent>((event, emit) async {
      emit(SignUpLoading());
      try {
        var token = await newSignUp.signupData(
            event.name, event.email, event.password, event.cityId);
        emit(SignUploaded(token: token));
      } catch (e) {
        log('catch block  the error $e');

        emit(SignUpfailure(e.toString()));
      }
    });
  }
}
