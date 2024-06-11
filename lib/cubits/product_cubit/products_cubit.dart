import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../models/userPostModel.dart';
import '../../repo/userRepo.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final UserRepo userRepo;
  ProductsCubit(this.userRepo) : super(ProductsInitial());

  getUsersPostList() async {
    try {
      emit(ProductsLoadingState());
      var respo = await userRepo.getUsersPostsData();
      emit(ProductsLoadedState(respo));
    } catch (e) {
      emit(ProductsErrorState(e.toString()));
    }
  }
}
