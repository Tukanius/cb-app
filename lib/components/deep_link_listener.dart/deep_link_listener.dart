// ignore_for_file: unused_local_variable

import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:uni_links/uni_links.dart';

class DeepLinkListener extends StatefulWidget {
  const DeepLinkListener({Key? key}) : super(key: key);

  @override
  _DeepLinkListenerState createState() => _DeepLinkListenerState();
}

class _DeepLinkListenerState extends State<DeepLinkListener> {
  Uri? latestUri;
  StreamSubscription? sub;
  @override
  void initState() {
    super.initState();
    _handleIncomingLinks();
  }

  void _handleIncomingLinks() {
    if (!kIsWeb) {
      // It will handle app links while the app is already started - be it in
      // the foreground or in the background.
      sub = uriLinkStream.listen((Uri? uri) {
        if (!mounted) return;
        setState(() {
          latestUri = uri;
        });
      }, onError: (Object err) {
        if (!mounted) return;
        setState(() {
          latestUri = null;
        });
      });
    }
  }

  List<String>? getCmds() {
    String cmd;
    var cmdSuffix = '';

    const plainPath = 'path/subpath';
    const args = 'path/portion/?uid=123&token=abc';
    const emojiArgs =
        '?arr%5b%5d=123&arr%5b%5d=abc&addr=1%20Nowhere%20Rd&addr=Rand%20City%F0%9F%98%82';

    if (kIsWeb) {
      return [
        plainPath,
        args,
        emojiArgs,
        // Cannot create malformed url, since the browser will ensure it is valid
      ];
    }

    if (Platform.isIOS) {
      cmd = '/usr/bin/xcrun simctl openurl booted';
    } else if (Platform.isAndroid) {
      cmd = '\$ANDROID_HOME/platform-tools/adb shell \'am start'
          ' -a android.intent.action.VIEW'
          ' -c android.intent.category.BROWSABLE -d';
      cmdSuffix = "'";
    } else {
      return null;
    }
    final cmds = getCmds();
    // https://orchid-forgery.glitch.me/mobile/redirect/
    return [
      '$cmd "unilinks://tcoin',
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Stack();
  }
}
