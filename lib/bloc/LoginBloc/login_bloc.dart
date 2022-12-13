import 'package:bloc/bloc.dart';
import 'package:services_galary/models/auth/login_model.dart';
import 'package:services_galary/utlis/cash_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../repository/auth/login_repo.dart';

part 'login_bloc_event.dart';
part 'login_bloc_state.dart';

class LoginBlocBloc extends Bloc<LoginBlocEvent, LoginBlocState> {
  LoginRepository loginRepository;
  LoginBlocBloc(this.loginRepository) : super(LoginBlocInitial()) {
    on<LoginSuccessEvent>((event, emit) async {
      emit(LoginBlocLoading());
      var token = await loginRepository.loginData(event.email, event.password);

      emit(LoginBlocSuccess(loginModel: token));
      // var message =
      //     await loginRepository.loginData(event.email, event.password);
      // emit(LoginFaluireState(message));
    });
  }
}
