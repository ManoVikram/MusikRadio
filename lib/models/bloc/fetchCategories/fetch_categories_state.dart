part of './fetch_categories_bloc.dart';

abstract class FetchCategoriesState extends Equatable {
  const FetchCategoriesState();

  @override
  List<Object> get props => [];
}

class FetchCategoriesInitial extends FetchCategoriesState {
  const FetchCategoriesInitial();

  @override
  List<Object> get props => [];
}

class FetchCategoriesInProgress extends FetchCategoriesState {
  const FetchCategoriesInProgress();

  @override
  List<Object> get props => [];
}

class FetchCategoriesSuccess extends FetchCategoriesState {
  final List<String> allCategoryTitles;

  const FetchCategoriesSuccess({
    required this.allCategoryTitles,
  });

  @override
  List<Object> get props => [allCategoryTitles];
}

class FetchCategoriesFailure extends FetchCategoriesState {
  final dynamic error;

  const FetchCategoriesFailure({
    this.error,
  });

  @override
  List<Object> get props => [error];
}
