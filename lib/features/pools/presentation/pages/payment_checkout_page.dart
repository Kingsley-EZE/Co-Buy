import 'package:co_buy/core/components/common/app_back_button.dart';
import 'package:co_buy/core/components/scaffolds/app_scaffold.dart';
import 'package:co_buy/core/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// Never pops itself — the details page pops checkout on socket confirmation
/// and refetches either way, since payment may settle after a back-out.
class PaymentCheckoutPage extends StatefulWidget {
  const PaymentCheckoutPage({super.key, required this.checkoutUrl});

  final String checkoutUrl;

  @override
  State<PaymentCheckoutPage> createState() => _PaymentCheckoutPageState();
}

class _PaymentCheckoutPageState extends State<PaymentCheckoutPage> {
  late final WebViewController _controller;

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
        ),
      )
      ..loadRequest(Uri.parse(widget.checkoutUrl));
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
