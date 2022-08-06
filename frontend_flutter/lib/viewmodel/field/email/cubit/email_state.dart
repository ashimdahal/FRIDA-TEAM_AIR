part of 'email_cubit.dart';

abstract class EmailState extends Equatable {
  const EmailState();

  @override
  List<Object> get props => [];
}

class EmailInitial extends EmailState {}

class EmailFieldValid extends EmailState {
  final String value;

  const EmailFieldValid({required this.value});
  String get email => value;
}

class EmailFieldInvalid extends EmailState {
  String get value => "Invalid Email";
}
