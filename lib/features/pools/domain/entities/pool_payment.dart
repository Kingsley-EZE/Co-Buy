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
/// send the user. Completion is signalled over the socket, not by watching
/// the webview for a redirect URL.
class PoolPayment extends Equatable {
  const PoolPayment({required this.checkoutUrl, required this.merchantName});

  /// The gateway's hosted checkout page, to be opened in a webview.
  final String checkoutUrl;

  final String merchantName;

  @override
  List<Object?> get props => [checkoutUrl, merchantName];
}
