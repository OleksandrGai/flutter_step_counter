import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_step_counter/repositories/user_repository.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  UserRepository userRepository;

  AuthBloc({required this.userRepository}) : super(AuthInitial()) {
    on<AuthEvent>(mapAuthEventToState);
  }

  Future<void> mapAuthEventToState(
      AuthEvent event, Emitter<AuthState> emitter) async {
    if (event is AppLoaded) {
      try {
        var isSignedIn = await userRepository.isSignedIn();
        if (isSignedIn) {
          var user = await userRepository.getCurrentUser();
          emit(AuthenticateState(user: user!));
        } else {
          emit(UnAuthenticateState());
        }
      } catch (e) {
        emit(UnAuthenticateState());
      }
    }
  }
}
