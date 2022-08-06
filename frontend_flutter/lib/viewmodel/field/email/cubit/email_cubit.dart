import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'email_state.dart';

class EmailCubit extends Cubit<EmailState> {
  EmailCubit() : super(EmailInitial());
  void onEmailChange(String value) {
    if (value.isEmpty) {
      emit(EmailFieldInvalid());
    } else {
      emit(EmailFieldValid());
    }
  }

}
