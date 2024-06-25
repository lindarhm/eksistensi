import 'package:vascommtestbidang/presentation/bloc/states/login_state.dart';

import '../../domain/usecases/login_usecase.dart';
import 'events/login_event.dart';
import 'package:bloc/bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;

  LoginBloc(this._loginUseCase) : super(LoginState.initial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginState.loading();
      try {
        final userEntity = await _loginUseCase.execute(event.username, event.password);
        yield LoginState.success(userEntity);
      } catch (e) {
        yield LoginState.failure(e.toString());
      }
    }
  }
}