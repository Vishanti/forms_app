part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class RegisterFormState extends Equatable {
  final bool isValid;
  final FormStatus formStatus;
  final UsernameInput username;
  final String email;
  final String password;
  const RegisterFormState(
      {this.formStatus = FormStatus.invalid,
      this.isValid = false,
      this.username = const UsernameInput.pure(),
      this.email = '',
      this.password = ''});

  RegisterFormState copyWith(
          {bool? isValid,
          FormStatus? formStatus,
          UsernameInput? username,
          String? email,
          String? password}) =>
      RegisterFormState(
          isValid: isValid ?? this.isValid,
          formStatus: formStatus ?? this.formStatus,
          username: username ?? this.username,
          email: email ?? this.email,
          password: password ?? this.password);

  @override
  List<Object> get props => [formStatus, isValid, username, email, password];
}
