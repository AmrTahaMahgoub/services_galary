part of 'get_my_service_bloc.dart';

abstract class GetMyServiceState extends Equatable {
  const GetMyServiceState();

  @override
  List<Object> get props => [];
}

class GetMyServiceInitial extends GetMyServiceState {}

class GetMyServiceLoadingState extends GetMyServiceState {}

class GetMyServiceSuccessState extends GetMyServiceState {
  GetMyServiceSuccessState(this.getMyServicesModel);
  GetMyServicesModel getMyServicesModel;
}
