part of 'all_services_bloc.dart';


abstract class AllServicesState extends Equatable {
  const AllServicesState();

  @override
  List<Object> get props => [];
}

class AllServicesInitial extends AllServicesState {}

class AllServicesLoadingState extends AllServicesState {
  AllServicesLoadingState(this.message);
  String message;
}

class AllServicesSuccessState extends AllServicesState {
 List<AllServicesTryerModel> allData;
  AllServicesSuccessState(this.allData);
}
class AllServicesErrorState extends AllServicesState {
  AllServicesErrorState(this.message);
  String message;
}
