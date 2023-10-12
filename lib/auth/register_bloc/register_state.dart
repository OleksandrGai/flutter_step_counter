import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSucceed extends RegisterState {
  User user;

  RegisterSucceed({required this.user});
}

class RegisterFailed extends RegisterState {
  String message;

  RegisterFailed({required this.message});
}