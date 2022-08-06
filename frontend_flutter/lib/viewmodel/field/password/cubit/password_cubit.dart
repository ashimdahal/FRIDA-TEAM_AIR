import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'password_state.dart';

class PasswordCubit extends Cubit<PasswordState> {
  PasswordCubit() : super(PasswordInitial());
  void onPasswordChange(String value) {
    if (value.isEmpty) {
      emit(PasswordFieldInvalid());
    } else {
      emit(PasswordFieldValid(value: value));
    }
  }
}
