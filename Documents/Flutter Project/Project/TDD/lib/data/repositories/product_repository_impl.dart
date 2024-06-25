import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:tdd/data/datasource/remote_data_source.dart';
import 'package:tdd/data/exception.dart';
import 'package:tdd/data/failure.dart';
import 'package:tdd/domain/entities/product_entities.dart';
import 'package:tdd/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final RemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Product>>> getAllProduct() async {
    try {
      final result = await remoteDataSource.getAllDataProduct();
      final products = result.map<Product>((productModel) {
        return productModel.toEntity();
      }).toList();
      return Right(products);
    } on ServerException {
      return const Left(ServerFailure('Server error'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
