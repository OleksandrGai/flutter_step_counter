import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_step_counter/auth/logout_bloc/logout_event.dart';
import 'package:flutter_step_counter/auth/logout_bloc/logout_state.dart';
import 'package:flutter_step_counter/repositories/user_repository.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  UserRepository userRepository;

  LogoutBloc( this.userRepository) : super(LogoutInitial()) {
    on<LogoutEvent>(mapLogoutEventToState);
  }

  Future<void> mapLogoutEventToState(
      LogoutEvent event, Emitter<LogoutState> emitter) async {
    if (event is LogoutButtonPressed) {
      userRepository.singOut();
      emit(LogoutSucceed());
    }
  }
}
