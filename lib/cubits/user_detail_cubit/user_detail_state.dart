part of 'user_detail_cubit.dart';

@immutable
abstract class UserDetailState extends Equatable {
  const UserDetailState();
  @override
  List<Object> get props => [];
}

class UserDetailInitial extends UserDetailState {}

class UserDetailLoading extends UserDetailState {}

class UserDetailLoaded extends UserDetailState {
  final UserModel? userModel;
  const UserDetailLoaded(this.userModel);

  @override
  List<Object> get props => [userModel!];
}

class UserDetailError extends UserDetailState {
  final String errorMsg;
  const UserDetailError(this.errorMsg);

  @override
  List<Object> get props => [errorMsg];
}
