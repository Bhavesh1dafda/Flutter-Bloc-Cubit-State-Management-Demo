part of 'users_cubit.dart';

@immutable
abstract class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object> get props => [];
}

class UsersInitial extends UsersState {}

class UsersLoadingState extends UsersState {}

class UsersLoadedState extends UsersState {
  final List<UserModel> userModel;
  const UsersLoadedState(this.userModel);

  @override
  List<Object> get props => [userModel];
}

class UsersErrorState extends UsersState {
  final String errorMsg;
  const UsersErrorState(this.errorMsg);

  @override
  List<Object> get props => [errorMsg];
}
