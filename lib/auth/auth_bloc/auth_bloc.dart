import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_step_counter/repositories/user_repository.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  UserRepository userRepository;

  AuthBloc({required this.userRepository}) : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AppLoaded) {
      try {
        var isSignedIn = await userRepository.isSignedIn();
        if(isSignedIn){
          var user = await userRepository.getCurrentUser();
          yield AuthenticateState(user: user!);
        } else {
          yield UnAuthenticateState();
        }
      } catch (e) {
        yield UnAuthenticateState();
      }
    }
  }
}
