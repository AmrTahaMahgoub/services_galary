part of 'create_srevice_bloc.dart';

abstract class CreateSreviceState extends Equatable {
  const CreateSreviceState();

  @override
  List<Object> get props => [];
}

class CreateSreviceInitial extends CreateSreviceState {}
class CreateSreviceLoadingState extends CreateSreviceState {
  
}

class CreateSreviceSuccessState extends CreateSreviceState {
  CreateSreviceSuccessState(this.cretedModel);
  CreateServiceModel cretedModel;
}
