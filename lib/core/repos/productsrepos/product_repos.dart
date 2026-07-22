import 'package:dartz/dartz.dart' show Either;
import 'package:fruits_hub/core/entity/product_entity.dart';
import 'package:fruits_hub/core/errors/failure.dart';

abstract class ProductRepos {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
  Future<Either<Failure, List<ProductEntity>>> getbestSellingProducts();
}
