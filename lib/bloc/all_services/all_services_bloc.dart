import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:services_galary/models/all_data_model.dart';

import 'package:services_galary/repository/all_data_repo.dart';

import '../../models/all_services_model.dart';

import '../../repository/all_services_repo.dart';

part 'all_services_event.dart';
part 'all_services_state.dart';

class AllServicesBloc extends Bloc<AllServicesEvent, AllServicesState> {
  GetAllDataRepo allDataRepo;
  bool isFetching = false;
  int page = 1;
  AllServicesBloc(this.allDataRepo) : super(AllServicesInitial()) {
    on<AllServicesLoadedEvent>((event, emit) async {
      emit(AllServicesLoadingState('loading data...'));
      var allData = await allDataRepo.getAllServicesTryer(page);

      emit(AllServicesSuccessState(allData));
      page = page + 1;
     
    });
  }
}
