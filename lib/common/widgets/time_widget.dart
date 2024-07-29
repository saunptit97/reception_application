import 'dart:async';

import 'package:flutter/cupertino.dart';

import '../app_theme/app_colors.dart';
import '../app_theme/app_styles.dart';
import '../utils/functions/date_time_utils.dart';

class TimeDisplayWidget extends StatefulWidget {
  const TimeDisplayWidget({super.key});

  @override
  State<TimeDisplayWidget> createState() => _TimeDisplayWidgetState();
}

class _TimeDisplayWidgetState extends State<TimeDisplayWidget> {

  Timer? timer;

  DateTime current = DateTime.now();
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (i){
      setState(() {
        current = DateTime.now().toLocal();
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      getStringDate(current, Pattern.hhmm),
      style: AppStyles.s12w400.copyWith(
        color: AppColors.textTitle,
      ),
    );
  }
}