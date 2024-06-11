import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/userModel.dart';
import '../../repo/userRepo.dart';
part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  final UserRepo userRepo;
  UsersCubit(this.userRepo) : super(UsersLoadingState());

  getUsersList() async {
    try {
      emit(UsersLoadingState());
      var respo = await userRepo.getUsersData();
      emit(UsersLoadedState(respo));
    } catch (e) {
      emit(UsersErrorState(e.toString()));
    }
  }
}
