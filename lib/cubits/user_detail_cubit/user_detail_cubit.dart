import 'package:bloc/bloc.dart';
import 'package:cubit_demo/models/userModel.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'user_detail_state.dart';

class UserDetailCubit extends Cubit<UserDetailState> {
  UserDetailCubit() : super(UserDetailInitial());

  void updateModel(UserModel model) {
    try {
      emit(UserDetailLoading());
      emit(UserDetailLoaded(model));
    } catch (e) {
      emit(UserDetailError(e.toString()));
    }
  }
}
