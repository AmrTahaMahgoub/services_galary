part of 'create_srevice_bloc.dart';

abstract class CreateSreviceEvent extends Equatable {
  const CreateSreviceEvent();

  @override
  List<Object> get props => [];
}

class CreateServicesFetchedEvent extends CreateSreviceEvent {
  CreateServicesFetchedEvent(this.name, this.category_id, this.subcategory_id,
    this.price ,  this.city_id);
  String name;
  int category_id;
  int subcategory_id;
  String price;
  int city_id;
}
