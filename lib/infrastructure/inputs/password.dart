import 'package:formz/formz.dart';

// Define input validation errors
enum PasswordInputError { empty, length }

// Extend FormzInput and provide the input type and error type.
class PasswordInput extends FormzInput<String, PasswordInputError> {
  // Call super.pure to represent an unmodified form input.
  const PasswordInput.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const PasswordInput.dirty(String value) : super.dirty(value);

  // Centralize errors
  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == PasswordInputError.empty) return 'El campo es requerido';
    if (displayError == PasswordInputError.length) return 'Mínimo 3 caracteres';
    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  PasswordInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return PasswordInputError.empty;
    if (value.length < 3) return PasswordInputError.length;

    return null;
  }
}
