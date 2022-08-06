part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {
  final String email;
  final String password;

  const LoggedIn({required this.email,required this.password});
   @override
  List<Object> get props => [email,password];

}

class LoggedOut extends AuthenticationEvent {}
