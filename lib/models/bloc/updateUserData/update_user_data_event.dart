part of './update_user_data_bloc.dart';

abstract class UpdateUserDataEvent extends Equatable {
  const UpdateUserDataEvent();

  @override
  List<Object> get props => [];
}

class UpdateUserData extends UpdateUserDataEvent {
  // final String userID;
  final String email;
  File? profilePicture;
  String? name;
  String? description;

  UpdateUserData({
    // required this.userID,
    required this.email,
    this.profilePicture,
    this.name,
    this.description,
  });

  @override
  List<Object> get props => [];
}
