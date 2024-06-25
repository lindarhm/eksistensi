import '../../../domain/entities/user_entity.dart';

class LoginState {
  final UserEntity? userEntity;
  final String? error;

  LoginState({this.userEntity, this.error});

  factory LoginState.initial() => LoginState();
  factory LoginState.loading() => LoginState();
  factory LoginState.success(UserEntity userEntity) => LoginState(userEntity: userEntity);
  factory LoginState.failure(String error) => LoginState(error: error);

  bool? get isLoading => null;
}