import 'package:amplify_flutter/amplify.dart';
import 'package:audio_entertainment_media/models/AudioCategory.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../ModelProvider.dart';

part './fetch_categories_event.dart';
part './fetch_categories_state.dart';

class FetchCategoriesBloc
    extends Bloc<FetchCategoriesEvent, FetchCategoriesState> {
  FetchCategoriesBloc() : super(const FetchCategoriesInitial()) {
    on<FetchCategories>(_fetchAllCategories);
  }

  Future<void> _fetchAllCategories(
      FetchCategories event, Emitter<FetchCategoriesState> emit) async {
    emit(const FetchCategoriesInProgress());

    List<AudioCategory> allCategories =
        await Amplify.DataStore.query(AudioCategory.classType);

    List<String> categoryTitles = [];

    for (int i = 0; i < allCategories.length; i++) {
      categoryTitles.add(allCategories[i].title);
    }

    emit(FetchCategoriesSuccess(allCategoryTitles: categoryTitles));
  }
}
