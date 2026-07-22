import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/entity/product_entity.dart';
import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/core/model/product_model.dart';
import 'package:fruits_hub/core/repos/productsrepos/product_repos.dart';
import 'package:fruits_hub/core/services/data_services.dart';

class ProductReposImpl extends ProductRepos {
  final DataServices dataServices;

  ProductReposImpl(this.dataServices);
  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var data =
        await  dataServices.getData(path: "products") as List<Map<String, dynamic>>;
      List<ProductEntity> products = data
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();
      return right(products);
    } catch (e) {
      return left(ServerError(message: "حدث خطأ يرجى المحاوله مره اخرى"));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getbestSellingProducts() async {
    try {
      var data =
          await dataServices.getData(
                path: "products",
                query: {
                  "limit": 10,
                  "orderBy": "bestSelling",
                  "desending": true,
                },
              )
              as List< dynamic>;
      List<ProductEntity> products = data
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();
      return right(products);
    } catch (e) {
      return left(ServerError(message: e.toString()));
    }
  }
}
