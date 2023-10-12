import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSucceed extends LoginState {
  User user;

  LoginSucceed({required this.user});
}

class LoginFailed extends LoginState {
  String message;

  LoginFailed({required this.message});
}
