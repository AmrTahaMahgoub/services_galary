part of 'all_categories_bloc.dart';

abstract class AllCategoriesState extends Equatable {
  const AllCategoriesState();

  @override
  List<Object> get props => [];
}

class AllCategoriesInitial extends AllCategoriesState {}

class AllCategoriesLoading extends AllCategoriesState {}

class AllCategoriesSuccess extends AllCategoriesState {
  AllCategoriesSuccess(this.allCategoriesModel);
  AllCategoriesModel allCategoriesModel;
}
