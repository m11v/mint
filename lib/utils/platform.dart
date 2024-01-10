import 'dart:io';
import 'package:flutter/foundation.dart';

dynamic mobilePlatformFilter({
  required Function onAndroid,
  required Function oniOS,
  required Function onNonMobile,
}) {
  if (kIsWeb) {
    return onNonMobile.call();
  } else if (Platform.isAndroid) {
    return onAndroid.call();
  } else if (Platform.isIOS) {
    return oniOS.call();
  } else {
    return onNonMobile.call();
  }
}
