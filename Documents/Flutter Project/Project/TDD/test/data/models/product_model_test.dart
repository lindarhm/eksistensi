import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tdd/data/models/product_model.dart';
import 'package:tdd/domain/entities/product_entities.dart';

import '../../helpers/json_reader.dart';

void main(){
  const mockModelForTest = ProductModel(
      id: 1,
      nama: "Chicken Katsu",
      harga: 11000,
      tipe: "makanan",
      gambar: "https://tes-mobile.landa.id/img/chicken-katsu.png"
  );

  const mockModelForEntity = Product(
      id: 1,
      nama: "Chicken Katsu",
      harga: 11000,
      tipe: "makanan",
      gambar: "https://tes-mobile.landa.id/img/chicken-katsu.png"
  );

  group('to entity', () {
    test(
      'should be a subclass of weather entity',
          () async {
        // assert
        final result = mockModelForTest.toEntity();
        expect(result, equals(mockModelForEntity));
      },
    );
  });

  group('from json', () {
    test('should return a valid model from json', () async{

      //arrage
      final mockModel = json.decode(readJson('helpers/data_dummy.json'));
      final productDataModel = mockModel['datas'];

      //set
      List<ProductModel> mockDataModelList = productDataModel
          .map<ProductModel>((item) => ProductModel.fromJson(item))
          .toList();

      ProductModel result  = mockDataModelList[0];

      //assert
      expect(result, equals(mockModelForTest));

    });
  });


  group('to json', () {
    test('should return a valid model to json', () async{

      //arrage
      final result = mockModelForTest.toJson();

      //set
      final expectedResult =  {
        'id': 1,
        'nama': 'Chicken Katsu',
        'harga': 11000,
        'tipe': 'makanan',
        'gambar': 'https://tes-mobile.landa.id/img/chicken-katsu.png'
      };

      //assert
      expect(result, equals(expectedResult));

    });
  });
}