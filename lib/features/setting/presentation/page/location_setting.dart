import 'dart:async';
import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reception_application/common/index.dart';
import 'package:reception_application/features/presenting/domain/entity/position_entity.dart';
import 'package:reception_application/features/setup_locations/presentation/page/event/update_selected_location.dart';
import 'package:reception_application/routes/app_pages.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../../di/di_setup.dart';
import '../../../../gen/locale_keys.g.dart';
import '../../../setup_locations/domain/entity/location_entity.dart';

class LocationSetting extends StatefulWidget {
  const LocationSetting({super.key});

  @override
  State<LocationSetting> createState() => _LocationSettingState();
}

class _LocationSettingState extends State<LocationSetting> {
  final List<PositionEntity> _selectedLocations = <PositionEntity>[];
  final LocalStorage _localStorage = getIt<LocalStorage>();
  late StreamSubscription _subscription;

  @override
  void initState() {
    initSelectedLocations();
    _subscription =
        getIt<EventBus>().on<SelectedLocationEvent>().listen((event) {
      initSelectedLocations();
    });
    super.initState();
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  void initSelectedLocations() async {
    final String locations =
        await _localStorage.get<String?>(PreferenceKeys.selectedPosition) ??
            '[]';
    final List locationsJson = jsonDecode(locations);
    _selectedLocations.clear();
    for (var location in locationsJson) {
      setState(() {
        PositionEntity locationEntity = PositionEntity.fromJson(location);
        _selectedLocations.add(locationEntity);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 32.w,
        vertical: 40.h,
      ),
      height: 1.sh,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.selected_locations.tr(),
            style: AppStyles.s18w500.copyWith(
              color: AppColors.primary,
            ),
          ),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.symmetric(
                  vertical: 10.h,
                ),
                physics: const BouncingScrollPhysics(),
                itemCount: _selectedLocations.length,
                itemBuilder: (context, index) {
                  PositionEntity location = _selectedLocations[index];
                  return TimelineTile(
                    alignment: TimelineAlign.manual,
                    lineXY: 0,
                    hasIndicator: true,
                    isFirst: index == 0,
                    isLast: index == _selectedLocations.length - 1,
                    afterLineStyle:
                        LineStyle(color: AppColors.primary, thickness: 1.w),
                    beforeLineStyle:
                        LineStyle(color: AppColors.primary, thickness: 1.w),
                    indicatorStyle: IndicatorStyle(
                        padding: const EdgeInsets.all(6),
                        height: 15.w,
                        width: 15.w,
                        indicator: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.r),
                            border: Border.all(
                              color: AppColors.primary,
                              width: 1,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            (index + 1).toString(),
                            style: AppStyles.s10w400.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                        )),
                    endChild: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 20.h,
                        horizontal: 16.w,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            location.name ?? '',
                            style: AppStyles.s15w500.copyWith(
                              color: AppColors.textTitle,
                            ),
                          ),
                          // Text(location.description ?? '',
                          //   style: AppStyles.s12w300.copyWith(
                          //     color: AppColors.textTitle,
                          //   ),
                          // ),
                          if (location.file != null)
                            Row(
                              children: [
                                // if (location.media?.type == MediaType.video)
                                //   Icon(
                                //     Icons.video_collection,
                                //     color: AppColors.primary,
                                //     size: 12.w,
                                //   )
                                // else if (location.media?.type == MediaType.audio)
                                Icon(
                                  Icons.audio_file,
                                  color: AppColors.primary,
                                  size: 12.w,
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text(
                                  location.file?.name ?? '',
                                  style: AppStyles.s12w300.copyWith(
                                    color: AppColors.primary,
                                  ),
                                ),
                              ],
                            )
                        ],
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomTextButton(
            title: LocaleKeys.add_location.tr(),
            isDisable: false,
            backgroundColor: AppColors.primary,
            onPressed: () {
              context.router.push(const SetupLocationRoute());
            },
            borderRadius: 4.sp,
            textStyle: AppStyles.s14w500.copyWith(
              color: AppColors.white,
            ),
          )
        ],
      ),
    );
  }
}
