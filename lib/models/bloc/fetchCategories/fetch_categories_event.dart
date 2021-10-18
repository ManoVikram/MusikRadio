part of './fetch_categories_bloc.dart';

abstract class FetchCategoriesEvent extends Equatable {
  const FetchCategoriesEvent();

  @override
  List<Object> get props => [];
}

class FetchCategories extends FetchCategoriesEvent {
  const FetchCategories();

  @override
  List<Object> get props => [];
}
