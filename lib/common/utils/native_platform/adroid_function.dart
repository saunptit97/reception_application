import 'package:flutter/services.dart';

class AndroidFunction {
  static const platform =
      MethodChannel('com.rvb.reception_application/screenPlugin');

  static Future<void> screenOff() async {
    try {
      await platform.invokeMethod('screenOff');
    } on PlatformException catch (e) {
      print(e);
    }
  }
}
