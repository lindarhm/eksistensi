import '../../domain/entities/user_entity.dart';
import 'package:dio/dio.dart';

class RemoteDataSource {
  final Dio _dio;

  RemoteDataSource(this._dio);

  Future<UserEntity> login(String username, String password) async {
    final response = await _dio.post('https://reqres.in/api/login',
        data: {'email': username, 'password': password});
    return UserEntity(token: response.data['token']);
  }
}