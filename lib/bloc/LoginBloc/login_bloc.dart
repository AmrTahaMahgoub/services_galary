import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:services_galary/models/auth/login_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../../repository/auth/login_repo.dart';
part 'login_bloc_event.dart';
part 'login_bloc_state.dart';

class LoginBlocBloc extends Bloc<LoginBlocEvent, LoginBlocState> {
  LoginRepository loginRepository = LoginRepository();
  LoginBlocBloc(this.loginRepository) : super(LoginBlocInitial()) {
    on<LoginSuccessEvent>((event, emit) async {
      emit(LoginBlocLoading());

      try {
     
          var data =
              await loginRepository.loginData(event.email, event.password);

          emit(LoginBlocSuccess(token: data));
      
        
      } catch (e) {
      
        log('catch error in bloc ${e.toString()}');
              var error =
              await loginRepository.loginData(event.email, event.password);
          emit(LoginFaluireState(error));
        
      }
    });
  }
}
