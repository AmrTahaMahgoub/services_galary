import 'package:bloc/bloc.dart';
import 'package:services_galary/models/register_errors_model.dart';
import 'package:services_galary/repository/auth/signup_repo.dart';
import 'package:services_galary/utlis/cash_helper.dart';
import 'package:equatable/equatable.dart';

import '../../models/auth/signup_model.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpRepository signUpRepository;
  EmailandPasswordRepo repeatedEmailrepo;
  EmailRepo emailRepo;

  SignUpBloc(this.signUpRepository, this.repeatedEmailrepo, this.emailRepo)
      : super(SignUpInitial()) {
    on<SignUpSuccessEvent>((event, emit) async {
      try {
        emit(SignUpLoading());

        var token = await signUpRepository.signupData(
            event.name, event.email, event.password, event.cityId);
        var user = token.data!.token;
        emit(SignUpSuccess(token));

        var emailandPasswordError =
            await repeatedEmailrepo.signupEmailandPassworderror(
                event.name, event.email, event.password, event.cityId);
        emit(SignUpEmailandPaswwordError(emailandPasswordError));

        if (user == null) {
          var emailError = await emailRepo.signupRepeatedEmail(
              event.name, event.email, event.password, event.cityId);

          emit(SignUpwithEmailError(emailError));
        } else {
          emit(SignUpSuccess(token));
        }
      } catch (e) {
        print('********************${e.toString()}');
      }
    });
  }
}
