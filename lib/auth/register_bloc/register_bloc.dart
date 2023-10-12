import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_step_counter/auth/register_bloc/register_event.dart';
import 'package:flutter_step_counter/auth/register_bloc/register_state.dart';
import 'package:flutter_step_counter/repositories/user_repository.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  UserRepository userRepository;

  RegisterBloc(this.userRepository) : super(RegisterInitial()) {
    on<RegisterEvent>(mapRegisterEventToState);
  }

  Future<void> mapRegisterEventToState(
      RegisterEvent event, Emitter<RegisterState> emit) async {
    if (event is SingUpButtonPressed) {
      emit(RegisterLoading());
      try {
        var user = await userRepository.singUp(event.email, event.password);
        emit(RegisterSucceed(user: user!));
      } catch (e) {
        emit(RegisterFailed(message: e.toString()));
      }
    }
  }
}
