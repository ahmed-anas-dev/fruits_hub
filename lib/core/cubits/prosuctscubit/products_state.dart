part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoadingState extends ProductsState {}

class ProductsLoadedState extends ProductsState {
  final List<ProductEntity> products;
  ProductsLoadedState({required this.products});
}

class ProductsErrorState extends ProductsState {
  final String message;
  ProductsErrorState({required this.message});
}
