import 'package:flutter/material.dart';

class CustomValidators {
  CustomValidators._();

  static FormFieldValidator<String> multiple(
      List<FormFieldValidator<String>> validators) {
    return (value) {
      for (final validator in validators) {
        final result = validator(value);
        if (result != null) return result;
      }
      return null;
    };
  }

  static FormFieldValidator<String> isValidEmail() {
    return (value) {
      if (value != null) {
        bool emailValid = RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value);
        if (emailValid) return null;
      }
      return 'Email inválido';
    };
  }

  static FormFieldValidator<String> isRequired() => (String? value) {
        if (value == null || value.isEmpty) {
          return 'Campo obrigatório';
        } else {
          return null;
        }
      };

  static FormFieldValidator<String> minLength(int minLength) =>
      (String? value) {
        if (value == null || value.length < minLength) {
          return 'Mínimo $minLength caracteres';
        } else {
          return null;
        }
      };

  static FormFieldValidator<String> maxLength(int maxLength) =>
      (String? value) {
        if (value == null || value.length > maxLength) {
          return 'Máximo $minLength caracteres';
        } else {
          return null;
        }
      };

  static FormFieldValidator<String> exactLength(int exactLength) =>
      (String? value) {
        if (value?.length != exactLength) {
          return 'Deve ter $minLength caracteres';
        } else {
          return null;
        }
      };

  static FormFieldValidator<String> compare({
    required TextEditingController controller,
    required String errorMessage,
  }) {
    return (value) {
      if (value != controller.text) {
        return errorMessage;
      }
      return null;
    };
  }
}
