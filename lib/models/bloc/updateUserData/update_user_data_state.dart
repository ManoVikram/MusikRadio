part of './update_user_data_bloc.dart';

abstract class UpdateUserDataState extends Equatable {
  const UpdateUserDataState();

  @override
  List<Object> get props => [];
}

class UpdateUserDataInitial extends UpdateUserDataState {
  const UpdateUserDataInitial();

  @override
  List<Object> get props => [];
}

class UpdateUserDataInProgress extends UpdateUserDataState {
  const UpdateUserDataInProgress();

  @override
  List<Object> get props => [];
}

class UpdateUserDataSuccess extends UpdateUserDataState {
  const UpdateUserDataSuccess();

  @override
  List<Object> get props => [];
}

class UpdateUserDataError extends UpdateUserDataState {
  final dynamic error;

  const UpdateUserDataError({
    this.error,
  });

  @override
  List<Object> get props => [error];
}
