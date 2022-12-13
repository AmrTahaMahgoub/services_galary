part of 'get_my_service_bloc.dart';

abstract class GetMyServiceEvent extends Equatable {
   GetMyServiceEvent();

  @override
  List<Object> get props => [];
}
class GetMyServicesSuccessEvent extends GetMyServiceEvent{}
