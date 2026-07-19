import 'dart:async';

import 'package:co_buy/core/components/atoms/app_button.dart';
import 'package:co_buy/core/design_system/design_system.dart';
import 'package:co_buy/features/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Modal bottom sheet where the user types the one-time code sent to them.
///
/// The sheet only collects the code — [onSubmit] is where the caller
/// dispatches the actual verification (e.g. `AuthEvent.verifyEmailRequested`),
/// and [onResend] is where it re-requests a code. While the request runs the
/// sheet stays open watching the app-wide `AuthBloc`: `AuthLoading` drives the
/// Continue spinner, `AuthFailure` shows its message inline under the boxes,
/// and `AuthSuccess` pops the sheet with the code:
///
/// ```dart
/// final code = await ConfirmOtpSheet.show(
///   context,
///   onSubmit: (code) => context.read<AuthBloc>().add(
///     AuthEvent.verifyEmailRequested(email: email, otp: code),
///   ),
///   onResend: _resendCode,
/// );
/// if (code != null) { /* verified */ }
/// ```
///
/// Without [onSubmit] the sheet is a dumb collector: Continue pops with the
/// code immediately and auth states are ignored.
///
/// The digits live in a single invisible [TextField] stretched over the boxes
/// rather than one field per box, so paste and OTP autofill work and
/// backspace needs no focus juggling.
class ConfirmOtpSheet extends StatefulWidget {
  const ConfirmOtpSheet({
    super.key,
    this.length = 6,
    this.subtitle = 'Type one time code we sent to your phone',
    this.resendCooldown = const Duration(seconds: 60),
    this.onSubmit,
    this.onResend,
  });

  final int length;

  /// Tells the user where the code went (phone, email, ...).
  final String subtitle;

  /// How long the resend link stays disabled after (re)sending a code.
  final Duration resendCooldown;

  /// Starts verification of the entered code (typically by dispatching an
  /// `AuthBloc` event). The sheet then reacts to the resulting auth states.
  final ValueChanged<String>? onSubmit;

  final VoidCallback? onResend;

  /// Presents the sheet and resolves with the verified code, or `null` when
  /// dismissed.
  static Future<String?> show(
    BuildContext context, {
    int length = 6,
    String subtitle = 'Type one time code we sent to your phone',
    Duration resendCooldown = const Duration(seconds: 60),
    ValueChanged<String>? onSubmit,
    VoidCallback? onResend,
  }) {
    return showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      isDismissible: false,
      backgroundColor: context.colors.bg.primary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppRadius.r24),
        ),
      ),
      builder: (_) => ConfirmOtpSheet(
        length: length,
        subtitle: subtitle,
        resendCooldown: resendCooldown,
        onSubmit: onSubmit,
        onResend: onResend,
      ),
    );
  }

  @override
  State<ConfirmOtpSheet> createState() => _ConfirmOtpSheetState();
}

class _ConfirmOtpSheetState extends State<ConfirmOtpSheet> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  Timer? _timer;
  late int _secondsLeft;

  /// Backend rejection shown inline under the boxes; cleared as soon as the
  /// user edits the code.
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _startCooldown();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _startCooldown() {
    _timer?.cancel();
    _secondsLeft = widget.resendCooldown.inSeconds;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() => _secondsLeft--);
      if (_secondsLeft == 0) timer.cancel();
    });
  }

  void _onResendPressed() {
    widget.onResend?.call();
    setState(_startCooldown);
  }

  void _onContinuePressed() {
    final code = _controller.text;
    if (code.length != widget.length) return;

    final onSubmit = widget.onSubmit;
    if (onSubmit == null) {
      Navigator.of(context).pop(code);
      return;
    }
    onSubmit(code);
  }

  void _onAuthStateChanged(BuildContext context, AuthState state) {
    // Only meaningful when this sheet started the request.
    if (widget.onSubmit == null) return;

    if (state case AuthFailure(:final message)) {
      setState(() {
        _errorMessage = message;
        _controller.clear();
      });
      // Keep the keyboard up so the user can retype straight away.
      _focusNode.requestFocus();
    }
    if (state case AuthSuccess()) {
      Navigator.of(context).pop(_controller.text);
    }
  }

  void _onCodeChanged() {
    setState(() => _errorMessage = null);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Keeps the sheet above the keyboard the invisible field summons.
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.screenH,
            AppSpacing.s8,
            AppSpacing.screenH,
            AppSpacing.s24,
          ),
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: _onAuthStateChanged,
            builder: (context, state) {
              final isLoading = widget.onSubmit != null && state is AuthLoading;

              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      style: IconButton.styleFrom(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        padding: EdgeInsets.only(top: AppSpacing.s12),
                        alignment: Alignment.centerLeft,
                      ),
                      tooltip: 'Close',
                      icon: Icon(
                        Icons.close_rounded,
                        size: AppSpacing.s24,
                        color: context.colors.text.header,
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.s16),
                  Text('Confirm OTP', style: context.styles.h5),
                  const SizedBox(height: AppSpacing.s8),
                  Text(
                    widget.subtitle,
                    style: context.styles.bodyM.copyWith(
                      color: context.colors.text.subtle,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.s24),
                  _OtpBoxes(
                    controller: _controller,
                    focusNode: _focusNode,
                    length: widget.length,
                    hasError: _errorMessage != null,
                    // Rebuilds Continue on completion and clears any error.
                    onChanged: (_) => _onCodeChanged(),
                  ),
                  if (_errorMessage != null) ...[
                    const SizedBox(height: AppSpacing.s8),
                    Text(
                      _errorMessage!,
                      style: context.styles.bodyS.copyWith(
                        color: context.colors.state.errorBase,
                      ),
                    ),
                  ],
                  const SizedBox(height: AppSpacing.s16),
                  _ResendText(
                    secondsLeft: _secondsLeft,
                    onResend: _onResendPressed,
                  ),
                  const SizedBox(height: AppSpacing.s32),
                  AppButton(
                    label: 'Continue',
                    loading: isLoading,
                    onPressed: _controller.text.length == widget.length
                        ? _onContinuePressed
                        : null,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

/// The row of digit boxes with the real (invisible) input field stretched
/// over them, so tapping any box focuses the field and opens the keyboard.
class _OtpBoxes extends StatelessWidget {
  const _OtpBoxes({
    required this.controller,
    required this.focusNode,
    required this.length,
    required this.hasError,
    required this.onChanged,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final int length;
  final bool hasError;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListenableBuilder(
          listenable: Listenable.merge([controller, focusNode]),
          builder: (context, _) {
            final code = controller.text;
            return Row(
              spacing: AppSpacing.s12,
              children: [
                for (var i = 0; i < length; i++)
                  Expanded(
                    child: _OtpBox(
                      digit: i < code.length ? code[i] : null,
                      // The box the next keystroke lands in.
                      active: focusNode.hasFocus && i == code.length,
                      hasError: hasError,
                    ),
                  ),
              ],
            );
          },
        ),
        Positioned.fill(
          child: Opacity(
            opacity: 0,
            child: TextField(
              controller: controller,
              focusNode: focusNode,
              autofocus: true,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(length),
              ],
              autofillHints: const [AutofillHints.oneTimeCode],
              enableInteractiveSelection: false,
              showCursor: false,
              onChanged: onChanged,
              decoration: const InputDecoration(border: InputBorder.none),
            ),
          ),
        ),
      ],
    );
  }
}

class _OtpBox extends StatelessWidget {
  const _OtpBox({
    required this.digit,
    required this.active,
    required this.hasError,
  });

  final String? digit;
  final bool active;
  final bool hasError;

  @override
  Widget build(BuildContext context) {
    // Error trumps focus, mirroring AppTextField's border precedence.
    final Color borderColor = hasError
        ? context.colors.state.errorBase
        : active
        ? AppPalette.primaryBase
        : context.colors.stroke.primary;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      height: AppSpacing.s56,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: AppRadius.br12,
        border: Border.all(
          color: borderColor,
          width: active || hasError ? 1.5 : 1,
        ),
      ),
      child: digit != null
          ? Text(digit!, style: context.styles.bodyXl.semibold)
          : active
          ? const _BlinkingCursor()
          : null,
    );
  }
}

/// Text-input caret look-alike for the active empty box, since the real
/// field's cursor is hidden with the field itself.
class _BlinkingCursor extends StatefulWidget {
  const _BlinkingCursor();

  @override
  State<_BlinkingCursor> createState() => _BlinkingCursorState();
}

class _BlinkingCursorState extends State<_BlinkingCursor>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 500),
  )..repeat(reverse: true);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: Container(
        width: 2,
        height: AppSpacing.s24,
        color: context.colors.text.header,
      ),
    );
  }
}

/// "Resend in 52s." while the cooldown runs, then a tappable resend link.
class _ResendText extends StatelessWidget {
  const _ResendText({required this.secondsLeft, required this.onResend});

  final int secondsLeft;
  final VoidCallback onResend;

  @override
  Widget build(BuildContext context) {
    if (secondsLeft > 0) {
      return Text(
        'Resend in ${secondsLeft}s.',
        style: context.styles.bodyM.copyWith(color: context.colors.text.subtle),
      );
    }

    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: onResend,
        child: Text(
          'Resend code',
          style: context.styles.bodyM.semibold.copyWith(
            color: AppPalette.primaryBase,
            decoration: TextDecoration.underline,
            decorationColor: AppPalette.primaryBase,
          ),
        ),
      ),
    );
  }
}
