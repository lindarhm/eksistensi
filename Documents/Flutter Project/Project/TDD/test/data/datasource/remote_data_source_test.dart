import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:tdd/data/constant.dart';
import 'package:tdd/data/datasource/remote_data_source.dart';
import 'package:tdd/data/exception.dart';
import 'package:tdd/data/models/product_model.dart';

import '../../helpers/json_reader.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockHttpClient mockHttpClient;
  late RemoteDataSource remoteDataSource;

  setUp(() {
    mockHttpClient = MockHttpClient();
    remoteDataSource = RemoteDataSourceImpl(client: mockHttpClient);
  });

  group('get All', () {
    final mockModel = json.decode(readJson('helpers/data_dummy.json'));
    final productDataModel = mockModel['datas'];

    List<ProductModel> mockDataModelList = productDataModel
        .map<ProductModel>((item) => ProductModel.fromJson(item))
        .toList();

    test('get all product if code  status 200', () async {

      //arrage
      when(mockHttpClient.get(Uri.parse(Urls.urlGetProduct))).thenAnswer(
          (_) async => http.Response(readJson('helpers/data_dummy.json'), 200));

      //act
      final result = await remoteDataSource.getAllDataProduct();

      //assert
      expect(result, containsAllInOrder(mockDataModelList));
    });

    test('get all product if code status 404', () async {
      //arrange
      when(mockHttpClient.get(Uri.parse(Urls.urlGetProduct)))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      //act
      final call = remoteDataSource.getAllDataProduct();

      //assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });
}
