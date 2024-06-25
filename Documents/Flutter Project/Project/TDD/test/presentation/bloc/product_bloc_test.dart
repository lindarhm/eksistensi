import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd/data/failure.dart';
import 'package:tdd/domain/entities/product_entities.dart';
import 'package:tdd/domain/usecase/product_usecase.dart';
import 'package:tdd/presentation/bloc/product_bloc.dart';
import 'package:tdd/presentation/bloc/product_event.dart';
import 'package:tdd/presentation/bloc/product_state.dart';
import 'package:bloc_test/bloc_test.dart';

import 'product_bloc_test.mocks.dart';

@GenerateMocks([ProductUsecase])
void main() {
  late MockProductUsecase mockProductUsecase;
  late ProductBloc productBloc;

  setUp(() {
    mockProductUsecase = MockProductUsecase();
    productBloc = ProductBloc(mockProductUsecase);
  });

  final mockModel = [
    const Product(
        id: 1,
        nama: "Chicken Katsu",
        harga: 11000,
        tipe: "makanan",
        gambar: "https://tes-mobile.landa.id/img/chicken-katsu.png"),
    const Product(
        id: 2,
        nama: "Chicken Slam",
        harga: 9000,
        tipe: "makanan",
        gambar: "https://tes-mobile.landa.id/img/chicken-slam.png"),
    const Product(
        id: 3,
        nama: "Blue Blood",
        harga: 8000,
        tipe: "minuman",
        gambar: "https://tes-mobile.landa.id/img/blue-blood.png"),
    const Product(
        id: 4,
        nama: "Dark Chocolate",
        harga: 12000,
        tipe: "minuman",
        gambar: "https://tes-mobile.landa.id/img/dark-chocolate.png")
  ];

  test('initial state should be empty',
      () => {expect(productBloc.state, ProductInitial())});

  test('emits [ProductLoading, ProductData] when GetAllProductEvent is added', () {
    when(mockProductUsecase.execute()).thenAnswer((_) async => Right(mockModel));

    final expected = [
      ProductLoading(),
      ProductData(mockModel),
    ];

    productBloc.add(GetAllProductEvent());
    expectLater(productBloc.stream, emitsInOrder(expected));
  });


  blocTest<ProductBloc, ProductState>(
    'should emit [loading, error] when get data is unsuccessful',
    build: () {
      when(mockProductUsecase.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server failure')));
      return productBloc;
    },
    act: (bloc) => bloc.add(GetAllProductEvent()),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      ProductLoading(),
      ProductError('Server failure'),
    ],
    verify: (bloc) {
      verify(mockProductUsecase.execute());
    },
  );
}
