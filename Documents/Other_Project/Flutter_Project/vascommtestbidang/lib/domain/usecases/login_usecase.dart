import '../entities/user_entity.dart';
import '../repositories/user_repository.dart';

class LoginUseCase {
  final UserRepository _userRepository;

  LoginUseCase(this._userRepository);

  Future<UserEntity> execute(String username, String password) async {
    return _userRepository.login(username, password);
  }
}