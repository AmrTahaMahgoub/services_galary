import 'package:bloc/bloc.dart';
import 'package:services_galary/models/all_categories_model.dart';
import 'package:services_galary/repository/all_categories_repo.dart';
import 'package:equatable/equatable.dart';

part 'all_categories_event.dart';
part 'all_categories_state.dart';

class AllCategoriesBloc extends Bloc<AllCategoriesEvent, AllCategoriesState> {
  GetAllCategoriesRepo getAllCategoriesRepo;
  AllCategoriesBloc(this.getAllCategoriesRepo) : super(AllCategoriesInitial()) {
    on<AllCategoriesEvent>((event, emit) async {
      emit(AllCategoriesLoading());
      var categoriesData = await getAllCategoriesRepo.getAllCategories();
      emit(AllCategoriesSuccess(categoriesData));
    });
  }
}
