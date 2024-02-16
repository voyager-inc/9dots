import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PolicyTermsNotifier extends StateNotifier<AsyncValue<bool>> {
  final WebUri uri;
  late InAppWebView webViewWidget;

  InAppWebViewController? _webViewController;
  InAppWebViewSettings get options => InAppWebViewSettings(
    useShouldOverrideUrlLoading: true,
    mediaPlaybackRequiresUserGesture: false,
    transparentBackground: true,
    clearCache: true,
    cacheEnabled: false,
    useHybridComposition: true,
    cacheMode: CacheMode.LOAD_NO_CACHE,
    disableDefaultErrorPage: true,
    allowsInlineMediaPlayback: true,
  );

  PolicyTermsNotifier(String url)
      : uri = WebUri(url),
        super(const AsyncValue.loading()) {
    _loadWeb();
  }

  void _loadWeb() {
    webViewWidget = InAppWebView(
      initialUrlRequest: URLRequest(url: uri),
      initialSettings: options,
      gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
        Factory<VerticalDragGestureRecognizer>(
              () => VerticalDragGestureRecognizer(),
        ),
      },
      onWebViewCreated: (controller) {
        _webViewController = controller;
      },
      onPermissionRequest: (controller, request) async {
        return PermissionResponse(
          resources: request.resources,
          action: PermissionResponseAction.GRANT,
        );
      },
      shouldOverrideUrlLoading: (controller, navigationAction) async {
        return NavigationActionPolicy.ALLOW;
      },
      onReceivedError: (controller, request, error) async {
        state = AsyncValue.error(error, StackTrace.empty);
        if (Platform.isAndroid) {
          if(error.description.contains("net::ERR_INTERNET_DISCONNECTED")) {
            _handleErrorLoadWebView();
          }
        } else if(Platform.isIOS){
          if(error.description.contains("The Internet connection appears to be offline.")) {
            _handleErrorLoadWebView();
          }
        }
        // exception for ios : //The resource could not be loaded because the App Transport Security policy requires the use of a secure connection.
      },
      onProgressChanged: (controller, progress) {
        if (progress == 100) {
          state = const AsyncValue.data(true);
        }
      },
    );
  }

  void _handleErrorLoadWebView(){
    if (state.hasError) {
      showDialogError();
    }
  }

  void reload() {
    state = const AsyncValue.loading();
    _webViewController?.loadUrl(urlRequest: URLRequest(url: uri));
  }

  void showDialogError() {
    // showMessageDialogGlamoLock(context,
    //     title: 'titleAlertError'.tr,
    //     description: 'msgAlertNetworkConnectionFail'.tr,
    //     listButton: (ctx) => [
    //       CupertinoDialogAction(
    //         onPressed: () {
    //           setIsOpeningDialogOnceTime(true);
    //           Navigator.of(ctx).pop();
    //         },
    //         child: TextCustom('btnClose'.tr,
    //             fontCustom: FontCustom.RobotoRegular,
    //             color: AppColors.dialogBtnColor),
    //       ),
    //     ]);
  }
}
