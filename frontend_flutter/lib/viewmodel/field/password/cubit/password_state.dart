part of 'password_cubit.dart';

abstract class PasswordState extends Equatable {
  const PasswordState();

  @override
  List<Object> get props => [];
}

class PasswordInitial extends PasswordState {}

class PasswordFieldValid extends PasswordState {
  final String value;

  const PasswordFieldValid({required this.value});

  String get password => value;
  @override
  List<Object> get props => [value];
}

class PasswordFieldInvalid extends PasswordState {
  String get value => "Invalid Email";
}
