import 'package:dartz/dartz.dart';
import 'package:tdd/data/failure.dart';
import 'package:tdd/domain/entities/product_entities.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getAllProduct();
}