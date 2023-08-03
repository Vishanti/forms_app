import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:forms_app/infrastructure/inputs/inputs.dart';
import 'package:formz/formz.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());

  void onSubmit() {
    emit(
      state.copyWith(
        formStatus: FormStatus.validating,
        username: UsernameInput.dirty(state.username.value),
        password: PasswordInput.dirty(state.password.value),
        email: EmailInput.dirty(state.email.value),
        isValid: Formz.validate(
          [state.username, state.password, state.email],
        ),
      ),
    );
    print('Submit $state');
  }

  void usernameChanged(String value) {
    final username = UsernameInput.dirty(value);
    emit(
      state.copyWith(
        username: username,
        isValid: Formz.validate(
          [username, state.password],
        ),
      ),
    );
  }

  void emailChanged(String value) {
    final email = EmailInput.dirty(value);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate(
          [email, state.username, state.password],
        ),
      ),
    );
  }

  void passwordChanged(String value) {
    final password = PasswordInput.dirty(value);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate(
          [state.username, password],
        ),
      ),
    );
  }
}
