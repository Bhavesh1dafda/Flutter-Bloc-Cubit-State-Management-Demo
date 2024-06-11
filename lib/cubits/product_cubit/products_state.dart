part of 'products_cubit.dart';

@immutable
abstract class ProductsState {
  const ProductsState();

  List<Object> get props => [];
}

class ProductsInitial extends ProductsState {}
class ProductsLoadingState extends ProductsState {
}
class ProductsLoadedState extends ProductsState {

  final List<UserPost> userpostModel;
  const ProductsLoadedState(this.userpostModel);

  @override
  List<Object> get props => [userpostModel];
}
class ProductsErrorState extends ProductsState {
  final String errorMsg;
  const ProductsErrorState(this.errorMsg);

  @override
  List<Object> get props => [errorMsg];
}
