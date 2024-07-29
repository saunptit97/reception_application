import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reception_application/base/base_widget.dart';
import 'package:reception_application/common/index.dart';
import 'package:reception_application/di/di_setup.dart';
import 'package:reception_application/features/setup_locations/presentation/bloc/setup_location/location_bloc.dart';
import 'package:reception_application/features/setup_locations/presentation/page/event/update_selected_location.dart';
import 'package:reception_application/features/setup_locations/presentation/page/widget/select_media_widget.dart';
import 'package:reception_application/gen/locale_keys.g.dart';
import 'package:reception_application/routes/app_pages.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../presenting/domain/entity/position_entity.dart';
import '../../domain/entity/location_entity.dart';

@RoutePage()
class SetupLocationPage extends StatefulWidget {
  const SetupLocationPage({super.key});

  @override
  State<SetupLocationPage> createState() => _SetupLocationPageState();
}

List _locations = <LocationEntity>[
  LocationEntity(
    id: '1',
    name: 'Phòng nhân sự',
    description:
        'Phòng nhân sự là nơi tiếp nhận hồ sơ ứng viên, phỏng vấn và tuyển dụng nhân viên mới.',
  ),
  LocationEntity(
    id: '2',
    name: 'Phòng kế toán',
    description:
        'Phòng kế toán là nơi xử lý các vấn đề liên quan đến tài chính, kế toán của công ty.',
  ),
  LocationEntity(
    id: '3',
    name: 'Phòng hành chính',
    description:
        'Phòng hành chính là nơi xuất nhập các loại giấy tờ, hồ sơ, văn bản của công ty.',
  ),
  LocationEntity(
    id: '4',
    name: 'Phòng kinh doanh',
    description:
        'Phòng kinh doanh là nơi tiếp nhận các đơn hàng, tư vấn và bán hàng cho khách hàng.',
  ),
  LocationEntity(
    id: '5',
    name: 'Phòng kỹ thuật',
    description:
        'Phòng kỹ thuật là nơi tiếp nhận các yêu cầu sửa chữa, bảo trì, bảo dưỡng của khách hàng.',
  ),
  LocationEntity(
    id: '6',
    name: 'Xưởng sản xuất',
    description: 'Xưởng sản xuất là nơi sản xuất các sản phẩm của công ty.',
  ),
  LocationEntity(
    id: '7',
    name: 'Xưởng gia công',
    description: 'Xưởng gia công là nơi gia công các sản phẩm của công ty.',
  ),
  LocationEntity(
    id: '8',
    name: 'Xưởng đóng gói',
    description: 'Xưởng đóng gói là nơi đóng gói các sản phẩm của công ty.',
  ),
  LocationEntity(
    id: '9',
    name: 'Xưởng vận chuyển',
    description: 'Xưởng vận chuyển là nơi vận chuyển các sản phẩm của công ty.',
  )
];

class _SetupLocationPageState extends BaseState<SetupLocationPage,
    LocationEvent, LocationState, LocationBloc> {
  final List<PositionEntity> _selectedLocations = <PositionEntity>[];
  final List<String> selectedIds = <String>[];

  void _handleSelectLocation(PositionEntity location) {
    setState(() {
      if (selectedIds.contains(location.id)) {
        _selectedLocations.removeWhere((e) => e.id == location.id);
        selectedIds.remove(location.id);
      } else {
        _selectedLocations.add(location);
        selectedIds.add(location.id ?? '');
      }
    });
  }

  final LocalStorage _localStorage = getIt<LocalStorage>();

  @override
  void initState() {
    super.initState();
    bloc.add(const LocationEvent.initData());
    initSelectedLocations();
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
        selectedIds.add(locationEntity.id ?? '');
      });
    }
  }

  @override
  Widget renderUI(BuildContext context) {
    return BaseScaffold(
      isFull: true,
      appBar: BaseAppBar(
        hasBack: true,
        title: LocaleKeys.setup_location.tr(),
        textStyle: AppStyles.s16w600.copyWith(
          color: AppColors.textTitle,
        ),
        elevation: 0,
        backgroundColor: AppColors.background,
      ),
      backgroundColor: AppColors.background,
      body: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 32.w,
                vertical: 40.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.selected_locations.tr(),
                    style: AppStyles.s18w700.copyWith(
                      color: AppColors.textTitle,
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
                            afterLineStyle: LineStyle(
                                color: AppColors.primary, thickness: 1.w),
                            beforeLineStyle: LineStyle(
                                color: AppColors.primary, thickness: 1.w),
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
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          location.name ?? '',
                                          style: AppStyles.s14w500.copyWith(
                                            color: AppColors.textTitle,
                                          ),
                                        ),
                                        // Text(location.description ?? '',
                                        //   style: AppStyles.s10w300.copyWith(
                                        //     color: AppColors.textTitle,
                                        //   ),
                                        // ),
                                        Row(
                                          children: [
                                            if (location.file != null)
                                              Row(
                                                children: [
                                                  // if (location.file?.type == MediaType.video)
                                                  //   Icon(
                                                  //     Icons.video_collection,
                                                  //     color: AppColors.primary,
                                                  //     size: 10.w,
                                                  //   )
                                                  // else if (location.file?.type == MediaType.audio)
                                                  Icon(
                                                    Icons.audio_file,
                                                    color: AppColors.primary,
                                                    size: 10.w,
                                                  ),
                                                  SizedBox(
                                                    width: 2.w,
                                                  ),
                                                  Text(
                                                    location.file?.name ?? '',
                                                    style: AppStyles.s10w300
                                                        .copyWith(
                                                      color: AppColors.primary,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 6.w,
                                                  ),
                                                  Container(
                                                    width: 3,
                                                    height: 3,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100.r),
                                                      color: AppColors
                                                          .textEvaluate,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 6.w,
                                                  ),
                                                ],
                                              ),
                                            GestureDetector(
                                              onTap: () {
                                                DialogService.showCustomDialog(
                                                    context,
                                                    insetPadding:
                                                        EdgeInsets.symmetric(
                                                      horizontal: 1.sw / 5,
                                                      vertical: 40.h,
                                                    ),
                                                    child: SelectMediaWidget(
                                                      onSelectedMedia:
                                                          (mediaEntity) {
                                                        setState(() {
                                                          location.file =
                                                              mediaEntity;
                                                        });
                                                      },
                                                      media: location.file,
                                                    ));
                                              },
                                              child: Text(
                                                location.file == null
                                                    ? LocaleKeys
                                                        .select_audio_video
                                                        .tr()
                                                    : LocaleKeys.change.tr(),
                                                style:
                                                    AppStyles.s10w300.copyWith(
                                                  color: AppColors.alertLink,
                                                  decoration:
                                                      TextDecoration.underline,
                                                  decorationColor:
                                                      AppColors.alertLink,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        _selectedLocations.remove(location);
                                        selectedIds.remove(location.id ?? '');
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(6.w),
                                      child: Icon(
                                        Icons.close,
                                        color: AppColors.ellipse7,
                                        size: 16.w,
                                      ),
                                    ),
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
                    title: LocaleKeys.ok.tr(),
                    isDisable: _selectedLocations.isEmpty,
                    backgroundColor: AppColors.primary,
                    onPressed: () {
                      List<Map<String, dynamic>> selectedLocationsMap =
                          _selectedLocations.map((e) => e.toJson()).toList();
                      String selectedLocationsString =
                          jsonEncode(selectedLocationsMap);
                      _localStorage.save(PreferenceKeys.selectedPosition,
                          selectedLocationsString);
                      getIt<EventBus>().fire(SelectedLocationEvent());
                      context.router.pop();
                      SnackBarHelper().showSuccess(
                          context, LocaleKeys.setup_location_successfully.tr());
                    },
                    borderRadius: 4.sp,
                    textStyle: AppStyles.s12w600.copyWith(
                      color: AppColors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: 1.sw / 2,
            decoration: const BoxDecoration(
              color: AppColors.background2,
            ),
            padding: EdgeInsets.symmetric(
              vertical: 40.h,
              horizontal: 24.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                  ),
                  child: Text(
                    LocaleKeys.all_locations.tr(),
                    style: AppStyles.s18w700.copyWith(
                      color: AppColors.textTitle,
                    ),
                  ),
                ),
                blocBuilder((context, state) => Expanded(
                      child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          padding: EdgeInsets.symmetric(
                            vertical: 10.h,
                          ),
                          itemBuilder: (context, index) {
                            PositionEntity? location = state.waypoints?[index];
                            if (location == null) {
                              return Container();
                            }
                            return InkWell(
                              onTap: () {
                                _handleSelectLocation(location!);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 20.h,
                                  horizontal: 20.w,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            location.name ?? '',
                                            style: AppStyles.s14w500.copyWith(
                                              color: AppColors.textTitle,
                                            ),
                                          ),
                                          // Text(location.description ?? '',
                                          //   style: AppStyles.s10w300.copyWith(
                                          //     color: AppColors.textTitle,
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ),
                                    Visibility(
                                      visible:
                                          selectedIds.contains(location.id),
                                      child: Icon(
                                        Icons.check,
                                        color: AppColors.primary,
                                        size: 16.w,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => const Divider(
                                height: 1,
                                color: AppColors.divider,
                              ),
                          itemCount: state.waypoints?.length ?? 0),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
