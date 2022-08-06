import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'field_state.dart';

class FieldCubit extends Cubit<FieldState> {
  FieldCubit() : super(FieldInitial());

  void onEmailChange(String value) {
    if (value.isEmpty) {
      emit(EmailFieldInvalid());
    } else {
      emit(EmailFieldValid());
    }
  }

  void onPasswordChange(String value) {
    if (value.isEmpty) {
      emit(PasswordFieldInvalid());
    } else {
      emit(PasswordFieldValid());
    }
  }
}
