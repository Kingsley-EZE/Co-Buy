/// Field validators shared across forms.
///
/// Each validator returns `null` when the value is valid, or a user-facing
/// message. The signature matches `FormFieldValidator<String>`, so they plug
/// straight into `AppTextField.validator` for inline errors — and can be
/// called directly to gate a submit button:
///
/// ```dart
/// final canSubmit = AppValidators.email(_emailController.text) == null;
/// ```
///
/// Grow this class one static method per rule (e.g. `phone`, `minLength`);
/// keep validators pure so they stay trivially testable.
abstract final class AppValidators {
  static final RegExp _emailPattern = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');

  static String? required(String? value, {String message = 'Required'}) {
    if (value == null || value.trim().isEmpty) return message;
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) return 'Email is required';
    if (!_emailPattern.hasMatch(value.trim())) {
      return 'Enter a valid email address';
    }
    return null;
  }

  static String? otp(String? value, {int length = 6}) {
    if (value == null || value.trim().isEmpty) return 'OTP is required';
    if (value.trim().length != length) return 'Enter the $length-digit code';
    return null;
  }

  /// A whole number greater than zero, as produced by a digits-only field.
  static String? positiveNumber(
    String? value, {
    String message = 'Enter a number greater than zero',
  }) {
    final int? number = int.tryParse(value?.trim() ?? '');
    if (number == null || number <= 0) return message;
    return null;
  }

  /// Nigerian NUBAN account number: exactly 10 digits.
  static String? accountNumber(String? value) {
    final String trimmed = value?.trim() ?? '';
    if (trimmed.isEmpty) return 'Account number is required';
    if (trimmed.length != 10 || int.tryParse(trimmed) == null) {
      return 'Enter the 10-digit account number';
    }
    return null;
  }
}
