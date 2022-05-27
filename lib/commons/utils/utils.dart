import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

class Utils {
  static Future<bool> hasNetwork(
      {String host = 'google.com', Duration? timeout}) async {
    try {
      final result = await InternetAddress.lookup(host).timeout(
        timeout ?? const Duration(seconds: 2),
      );
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on PlatformException catch (_) {
      return false;
    } on TimeoutException catch (_) {
      return false;
    } on SocketException catch (_) {
      return false;
    }
  }
}
