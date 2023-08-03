part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class RegisterFormState extends Equatable {
  final bool isValid;
  final FormStatus formStatus;
  final UsernameInput username;
  final EmailInput email;
  final PasswordInput password;
  const RegisterFormState({
    this.formStatus = FormStatus.invalid,
    this.isValid = false,
    this.username = const UsernameInput.pure(),
    this.email = const EmailInput.pure(),
    this.password = const PasswordInput.pure(),
  });

  RegisterFormState copyWith({
    bool? isValid,
    FormStatus? formStatus,
    UsernameInput? username,
    EmailInput? email,
    PasswordInput? password,
  }) =>
      RegisterFormState(
        isValid: isValid ?? this.isValid,
        formStatus: formStatus ?? this.formStatus,
        username: username ?? this.username,
        email: email ?? this.email,
        password: password ?? this.password,
      );

  @override
  List<Object> get props => [formStatus, isValid, username, email, password];
}
