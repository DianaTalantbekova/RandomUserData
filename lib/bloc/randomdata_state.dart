part of 'randomdata_bloc.dart';

@immutable
abstract class RandomDataState {}

class RandomdataInitial extends RandomDataState {}

class UserLoadingState extends RandomDataState {}

class UserFetchedState extends RandomDataState {
  final UserModel userModel;

  UserFetchedState({required this.userModel});
}

class UserErrorState extends RandomDataState {
  final String errorMessage;

  UserErrorState({required this.errorMessage});
}
