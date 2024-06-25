import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tdd/data/constant.dart';
import 'package:tdd/data/exception.dart';
import 'package:tdd/data/models/product_model.dart';

abstract class RemoteDataSource {
  Future<List<ProductModel>> getAllDataProduct();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;
  RemoteDataSourceImpl({required this.client});

  @override
  Future<List<ProductModel>> getAllDataProduct() async {
    final response = await client.get(Uri.parse(Urls.urlGetProduct));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final jsonDataResponse = jsonResponse['datas'];

      return jsonDataResponse
          .map<ProductModel>((item) => ProductModel.fromJson(item))
          .toList();

    }else{
      throw ServerException();
    }
  }
}
