import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_step_counter/repositories/user_repository.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserRepository userRepository;

  LoginBloc(this.userRepository) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is SingInButtonPressed) {
      yield LoginLoading();
      try {
        var user = await userRepository.singIn(event.email, event.password);
        yield LoginSucceed(user: user!);
      } catch (e) {
        yield LoginFailed(message: e.toString());
      }
    }
  }
}
