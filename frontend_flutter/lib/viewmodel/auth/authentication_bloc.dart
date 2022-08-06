import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:frontend_flutter/viewmodel/field/email/cubit/email_cubit.dart';
import 'package:frontend_flutter/viewmodel/field/password/cubit/password_cubit.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final EmailCubit emailCubit;
  final PasswordCubit passwordCubit;
  StreamSubscription? emailStreamSubscription;
  StreamSubscription? passwordStreamSubscription;
  AuthenticationBloc({required this.emailCubit, required this.passwordCubit})
      : super(AuthenticationInitial()) {
    emailStreamSubscription = emailCubit.stream.listen((state) {
      if(state is EmailFieldInvalid){
          

      }else if(state is EmailFieldValid){

      }
    });
    passwordStreamSubscription = passwordCubit.stream.listen((state) {
      if(state is PasswordFieldInvalid){

      }else if(state is PasswordFieldValid){
        
      }
    });
  }

  void _onTypingStarted(AuthenticationFieldInvalid event,Emitter<AuthenticationState> emit){
      
  }
}
