import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd/data/exception.dart';
import 'package:tdd/data/failure.dart';
import 'package:tdd/data/models/product_model.dart';
import 'package:tdd/data/repositories/product_repository_impl.dart';
import 'package:tdd/domain/entities/product_entities.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockRemoteDataSource mockRemoteDataSource;
  late ProductRepositoryImpl repository;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    repository = ProductRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
    );
  });

  final mockModel = [
    const ProductModel(
        id: 1,
        nama: "Chicken Katsu",
        harga: 11000,
        tipe: "makanan",
        gambar: "https://tes-mobile.landa.id/img/chicken-katsu.png")
  ];

  group('getAllProduct', () {
    test('should return a list of products from the remote data source',
        () async {
      // Arrange
      when(mockRemoteDataSource.getAllDataProduct())
          .thenAnswer((_) async => mockModel);

      // Act
      final result = await repository.getAllProduct();

      // Assert
      verify(mockRemoteDataSource.getAllDataProduct());
      expect(result, isA<Right<Failure, List<Product>>>());
    });

    test(
      'should return server failure when a call to data source is unsuccessful',
      () async {
        // arrange
        when(mockRemoteDataSource.getAllDataProduct())
            .thenThrow(ServerException());

        // act
        final result = await repository.getAllProduct();

        // assert
        verify(mockRemoteDataSource.getAllDataProduct());
        expect(result, equals(Left(ServerFailure('Server error'))));
      },
    );

    test(
      'should return connection failure when the device has no internet',
      () async {
        // arrange
        when(mockRemoteDataSource.getAllDataProduct())
            .thenThrow(SocketException('Failed to connect to the network'));

        // act
        final result = await repository.getAllProduct();

        // assert
        verify(mockRemoteDataSource.getAllDataProduct());
        expect(
          result,
          equals(Left(ConnectionFailure('Failed to connect to the network'))),
        );
      },
    );
  });
}
