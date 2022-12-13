import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:services_galary/models/create_service_model.dart';
import 'package:services_galary/repository/create_service_repo.dart';

part 'create_srevice_event.dart';
part 'create_srevice_state.dart';

class CreateSreviceBloc extends Bloc<CreateSreviceEvent, CreateSreviceState> {
  CreateServiceRepo createServiceRepo;
  CreateSreviceBloc(this.createServiceRepo) : super(CreateSreviceInitial()) {
    on<CreateServicesFetchedEvent>((event, emit) async {
      emit(CreateSreviceLoadingState());
      var createdModel = await createServiceRepo.createService(event.name,
          event.category_id, event.subcategory_id, event.price, event.city_id);
      emit(CreateSreviceSuccessState(createdModel));
    });
  }
}
