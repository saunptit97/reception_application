import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  ///primary
  static const Color primaryDark = Color(0xFF333F48);
  static const Color deepDark = Color(0xFF001626);
  static const Color primary = Color(0xFF198C55);
  static Color colorOverlayDark = const Color(0xff0A0B0D).withOpacity(0.8);

  ///secondary
  static const Color background = Color(0xFFF7F7F9);
  static const Color backgroundCard1 = Color(0x80CCCCCC);
  static const Color backgroundCard2 = Color(0xFF98A2B3);
  static const Color selectedBackground = Color(0xFF198C55);
  static const Color background2 = Color(0xFFD0D5DD);
  static const Color blue = Color(0xFF4877FF);
  static const Color stroke = Color(0xFFEBEBEB);
  static const Color gray = Color(0xFF878789);
  static const Color gray2 = Color(0xFFB3B9BE);
  static const Color gray3 = Color(0xFFE5E5E5);
  static Color grey = Colors.grey.shade100;
  static const Color buttonCancel = Color(0xFFB0AEAE);

  /// icon
  static const Color icon = Color(0xFF198C55);

  /// divider
  static const Color divider = Color(0xFFE5E5E5);

  static const Color bubble = Color(0xffCEE1FF);

  ///alert
  static const Color alertError = Color(0xFFFE5050);
  static const Color alertSuccess = Color(0xFF6DC68E);
  static const Color alertLink = Color(0xFF007AFF);
  static const Color alertWarning = Color(0xFFFFCC00);

  ///icon
  static const Color ellipse7 = Color(0xFFE82828);
  static const Color yellowGreen = Color(0xFFA1D239);
  static const Color lightRedWinny = Color(0xFFFBC8CD);
  static const Color silverFoil = Color(0xFFB7B0A3);
  static const Color richElectricBlue = Color(0xFF0291D7);

  /// more color
  static const Color ghostWhite = Color(0xffF6F5F3);
  static const Color superSliver = Color(0xffEFEFEF);
  static const Color blackBanner = Color(0xff001626);
  static const Color black = Color(0xff000000);
  static const Color white = Color(0xffffffff);
  static const Color disable = Color(0xff878789);

  /// close button
  static const Color closeButton = Color(0xff323232);
  static const Color closeButtonHover = Color(0xffB3B9BE);

  /// color text
  static const Color textTitle = Color(0xff333F48);
  static const Color textSubTitle = Color(0xff878789);
  static const Color textBody = Color(0xff878789);

  /// color evaluate
  static const Color textEvaluate = Color(0xff77757F);
  static const Color starRatedColor = Color(0xffFDAA63);
  static const Color dividerDialog = Color(0xffE8E8EA);

  static const Color notificationBg = Color(0xff2F304D);
  static const Color activeColorMedia = Color(0xffD0D5DD);

  /// color box shadow
  static Color boxShadow = const Color(0xff000000).withOpacity(0.1);

  /// color from hex String
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
