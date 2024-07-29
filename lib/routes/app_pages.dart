import 'package:auto_route/auto_route.dart';
import 'package:reception_application/features/example/presentation/pages/example_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:reception_application/features/face_detect/page/face_detect_page.dart';
import 'package:reception_application/features/media_reception/presentations/media_reception_page.dart';
import 'package:reception_application/features/medial_specific_location/presentations/media_specific_location_page.dart';
import 'package:reception_application/features/setting_chatbot/presentation/setting_chatbot_page.dart';
import 'package:reception_application/features/setting_face/presentations/setting_face_page.dart';
import 'package:reception_application/features/setup_locations/presentation/page/setup_location_page.dart';

import '../features/face_detect/page/face_detect_page_v2.dart';
import '../features/home/presentation/page/home_page.dart';
import '../features/presenting/domain/entity/position_entity.dart';
import '../features/presenting/presentation/page/presenting_page.dart';
import '../features/setting/presentation/page/setting_page.dart';
import '../features/setup_locations/domain/entity/location_entity.dart';
import 'app_routes.dart';

part 'app_pages.gr.dart';

@singleton
@AutoRouterConfig()
class AppPages extends _$AppPages {
  RouteType get routeType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, path: AppRoutes.home, initial: true),
        AutoRoute(
          page: SettingRoute.page,
          path: AppRoutes.setting,
        ),
        AutoRoute(
          page: SetupLocationRoute.page,
          path: AppRoutes.setupLocation,
        ),
        AutoRoute(
          page: PresentingRoute.page,
          path: AppRoutes.setupLocation,
        ),
        AutoRoute(page: ExampleRoute.page, path: AppRoutes.example),
        AutoRoute(page: FaceDetectRoute.page, path: AppRoutes.faceDetect),
        AutoRoute(page: FaceDetectV2Route.page, path: AppRoutes.faceDetectV2),
        AutoRoute(
          page: MediaReceptionRoute.page,
          path: AppRoutes.mediaReception,
        ),
        AutoRoute(
          page: MediaSpecificLocationRoute.page,
          path: AppRoutes.mediaSpecificLocation,
        ),
      ];
}
