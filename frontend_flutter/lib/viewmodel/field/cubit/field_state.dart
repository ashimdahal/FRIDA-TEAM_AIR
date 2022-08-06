part of 'field_cubit.dart';

abstract class FieldState extends Equatable {
  const FieldState();

  @override
  List<Object> get props => [];
}

class FieldInitial extends FieldState {}

class PasswordFieldValid extends FieldState{
}
class EmailFieldValid extends FieldState{}

class PasswordFieldInvalid extends FieldState {
  String get value => "Invalid Password";
}


class EmailFieldInvalid extends FieldState{
     String get value => "Invalid Email";
}
