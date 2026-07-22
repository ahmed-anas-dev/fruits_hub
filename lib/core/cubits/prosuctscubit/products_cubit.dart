import 'package:bloc/bloc.dart';
import 'package:fruits_hub/core/entity/product_entity.dart';
import 'package:fruits_hub/core/repos/productsrepos/product_repos.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductRepos productRepos;
  ProductsCubit({required this.productRepos}) : super(ProductsInitial());
    int productlength = 0;


 Future<void> getProducts() async {
  emit(ProductsLoadingState());

  final result = await productRepos.getProducts();

  result.fold(
    (l) {
      print('ERROR: ${l.message}');
      emit(
        ProductsErrorState(
          message: l.message,
        ),
      );
    },
    (r) {
      print('SUCCESS');
      emit(
        ProductsLoadedState(
          products: r,
        ),
      );
    },
  );
}
   Future<void> getBestSellingProducts() async {
    emit(ProductsLoadingState());
    final result = await productRepos.getbestSellingProducts();
    result.fold(
      (l) {
        print('ERROR: ${l.message}');
         emit(ProductsErrorState(message: l.message));},
        (r) {
          productlength = r.length;
          emit(ProductsLoadedState(products: r));
          
        } );
  }
}
