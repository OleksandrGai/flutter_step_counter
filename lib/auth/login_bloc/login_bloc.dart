import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_step_counter/repositories/user_repository.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserRepository userRepository;

  LoginBloc(this.userRepository) : super(LoginInitial()) {
    on<LoginEvent>(mapLoginEventToState);
  }

  Future<void> mapLoginEventToState(
      LoginEvent event, Emitter<LoginState> emitter) async {
    if (event is SingInButtonPressed) {
      emit(LoginLoading());
      try {
        var user = await userRepository.singIn(event.email, event.password);
        emit(LoginSucceed(user: user!));
      } catch (e) {
        emit(LoginFailed(message: e.toString()));
      }
    }
  }
}
