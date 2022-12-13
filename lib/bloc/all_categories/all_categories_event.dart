part of 'all_categories_bloc.dart';

abstract class AllCategoriesEvent extends Equatable {
  const AllCategoriesEvent();

  @override
  List<Object> get props => [];
}
class AllCategoriesEventSuccess extends AllCategoriesEvent{}