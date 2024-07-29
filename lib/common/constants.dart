import 'package:flutter/material.dart';

class LocalizationConstants {
  static const Locale viLocale = Locale('vi', 'VN');
  static const Locale enUSLocale = Locale('en', 'US');
  static const path = 'assets/translations';
}

class NotificationConfig {
  static const highImportance = "High Importance channel";
  static const highChannelId = "flutter_channel_id_0";
  static const highChannelDescription = "Floating notification with sound";
  static const notificationIconPath = 'ic_notification';
}

class PreferenceKeys {
  static const String locale = 'locale';
  static const String pinLevel = 'pinLevel';
  static const String countDownTime = 'countDownTime';
  static const String baseUrl = 'baseUrl';
  static const String selectedPosition = 'selectedPosition';
}
