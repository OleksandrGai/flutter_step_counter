import 'package:equatable/equatable.dart';

class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SingInButtonPressed extends LoginEvent {
  String email;
  String password;

  SingInButtonPressed({required this.email, required this.password});
}
