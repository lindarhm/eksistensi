import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd/domain/entities/product_entities.dart';
import 'package:tdd/domain/repositories/product_repository.dart';
import 'package:tdd/domain/usecase/product_usecase.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockProductRepository mockProductRepository;
  late ProductUsecase usecase;

  setUp(() {
    mockProductRepository = MockProductRepository();
    usecase = ProductUsecase(productRepository: mockProductRepository);
  });

  final mockModel = [
    const Product(
        id: 1,
        nama: "Chicken Katsu",
        harga: 11000,
        tipe: "makanan",
        gambar: "https://tes-mobile.landa.id/img/chicken-katsu.png")
  ];

  group('usecase get test', () {
    test('should get current weather detail from the repository', () async {
      //arrage
      when(mockProductRepository.getAllProduct())
          .thenAnswer((_) async => Right(mockModel));
      //set
      final result = await usecase.execute();
      //assert
      expect(result, equals(Right(mockModel)));
    });
  });
}
