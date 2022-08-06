part of 'password_cubit.dart';

abstract class PasswordState extends Equatable {
  const PasswordState();

  @override
  List<Object> get props => [];
}

class PasswordInitial extends PasswordState {}

class PasswordFieldValid extends PasswordState {}

class PasswordFieldInvalid extends PasswordState {
  String get value => "Invalid Email";
}
