import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:services_galary/models/get_my_services.dart';
import 'package:services_galary/repository/get_my_services_repo.dart';

part 'get_my_service_event.dart';
part 'get_my_service_state.dart';

class GetMyServiceBloc extends Bloc<GetMyServiceEvent, GetMyServiceState> {
  GetMyServicesRepo getMyServicesRepo;
  GetMyServiceBloc(this.getMyServicesRepo) : super(GetMyServiceInitial())  {
    on<GetMyServicesSuccessEvent>((event, emit) async {
         emit(GetMyServiceLoadingState());
    var geyMyService = await getMyServicesRepo.getMyServices();
    emit(GetMyServiceSuccessState(geyMyService));
    });
 
  }
}
