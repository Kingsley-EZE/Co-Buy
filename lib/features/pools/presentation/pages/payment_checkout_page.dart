import 'package:co_buy/core/components/common/app_back_button.dart';
import 'package:co_buy/core/components/scaffolds/app_scaffold.dart';
import 'package:co_buy/core/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// The payment gateway's hosted checkout, in a webview. No bloc: the POST
/// that created the transaction already happened — this page only renders
/// its result and reports how it ended.
///
/// Pops `true` as soon as the gateway navigates to [redirectUrl] (payment
/// finished); backing out early pops `null`. Either way the caller should
/// refetch the pool — the payment may settle server-side even on a back-out.
class PaymentCheckoutPage extends StatefulWidget {
  const PaymentCheckoutPage({
    super.key,
    required this.checkoutUrl,
    required this.redirectUrl,
  });

  final String checkoutUrl;
  final String redirectUrl;

  @override
  State<PaymentCheckoutPage> createState() => _PaymentCheckoutPageState();
}

class _PaymentCheckoutPageState extends State<PaymentCheckoutPage> {
  late final WebViewController _controller;

  /// The redirect can be seen twice ([_onNavigationRequest] and
  /// [_onUrlChange] both fire for the same navigation) — only pop once.
  bool _completed = false;

  bool _pageReady = false;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      // Checkout pages are JS apps; without this the gateway renders blank.
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (_) {
            if (mounted && !_pageReady) setState(() => _pageReady = true);
          },
          onNavigationRequest: _onNavigationRequest,
          // Android does not route POST-initiated navigations through
          // onNavigationRequest, and gateways sometimes reach the merchant
          // redirect via a form POST — this catches those.
          onUrlChange: _onUrlChange,
        ),
      )
      ..loadRequest(Uri.parse(widget.checkoutUrl));
  }

  /// `startsWith`, not equality: the gateway appends its own query params
  /// (payment reference, status) to the redirect URL.
  bool _isRedirect(String url) => url.startsWith(widget.redirectUrl);

  NavigationDecision _onNavigationRequest(NavigationRequest request) {
    if (_isRedirect(request.url)) {
      _finish();
      return NavigationDecision.prevent;
    }
    return NavigationDecision.navigate;
  }

  void _onUrlChange(UrlChange change) {
    final url = change.url;
    if (url != null && _isRedirect(url)) _finish();
  }

  void _finish() {
    if (_completed || !mounted) return;
    _completed = true;
    context.pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: AppSpacing.s16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.screenH),
            child: Align(
              alignment: Alignment.centerLeft,
              child: AppBackButton(),
            ),
          ),
          const SizedBox(height: AppSpacing.s16),
          Expanded(
            child: Stack(
              children: [
                WebViewWidget(controller: _controller),
                if (!_pageReady)
                  const Center(
                    child: CircularProgressIndicator(
                      color: AppPalette.primaryBase,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
