import 'package:equatable/equatable.dart';

class RegisterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SingUpButtonPressed extends RegisterEvent {
  String email;
  String password;

  SingUpButtonPressed({required this.email, required this.password});
}
