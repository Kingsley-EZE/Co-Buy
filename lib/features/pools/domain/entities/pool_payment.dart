import 'package:equatable/equatable.dart';

/// What the server needs to initiate a member's pool payment.
class PoolPaymentRequest extends Equatable {
  const PoolPaymentRequest({required this.poolId, required this.amount});

  final String poolId;

  /// The member's share for even-split pools; whatever amount the member
  /// chose otherwise.
  final double amount;

  @override
  List<Object?> get props => [poolId, amount];
}

/// An initiated payment, reduced to what the checkout step needs: where to
/// send the user and how to recognise that the gateway is done with them.
class PoolPayment extends Equatable {
  const PoolPayment({
    required this.checkoutUrl,
    this.redirectUrl,
    required this.merchantName,
  });

  /// The gateway's hosted checkout page, to be opened in a webview.
  final String checkoutUrl;

  /// Where the gateway sends the browser once payment completes — the
  /// webview watches for this URL to know the checkout is over.
  final String? redirectUrl;

  final String merchantName;

  @override
  List<Object?> get props => [checkoutUrl, redirectUrl, merchantName];
}
