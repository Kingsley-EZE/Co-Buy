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
}
