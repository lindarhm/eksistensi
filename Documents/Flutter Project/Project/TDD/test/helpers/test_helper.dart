import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:tdd/data/datasource/remote_data_source.dart';
import 'package:tdd/domain/repositories/product_repository.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([
  RemoteDataSource,
  ProductRepository
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {
}