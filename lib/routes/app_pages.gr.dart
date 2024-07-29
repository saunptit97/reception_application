// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_pages.dart';

abstract class _$AppPages extends RootStackRouter {
  // ignore: unused_element
  _$AppPages({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    ExampleRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ExamplePage(),
      );
    },
    FaceDetectRoute.name: (routeData) {
      final args = routeData.argsAs<FaceDetectRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: FaceDetectPage(
          key: args.key,
          onFaceDetect: args.onFaceDetect,
        ),
      );
    },
    FaceDetectV2Route.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FaceDetectV2Page(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    MediaReceptionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MediaReceptionPage(),
      );
    },
    MediaSpecificLocationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MediaSpecificLocationPage(),
      );
    },
    PresentingRoute.name: (routeData) {
      final args = routeData.argsAs<PresentingRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PresentingPage(
          key: args.key,
          locations: args.locations,
          positions: args.positions,
        ),
      );
    },
    SettingChatbotRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingChatbotPage(),
      );
    },
    SettingFaceRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingFacePage(),
      );
    },
    SettingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingPage(),
      );
    },
    SetupLocationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SetupLocationPage(),
      );
    },
  };
}

/// generated route for
/// [ExamplePage]
class ExampleRoute extends PageRouteInfo<void> {
  const ExampleRoute({List<PageRouteInfo>? children})
      : super(
          ExampleRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExampleRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FaceDetectPage]
class FaceDetectRoute extends PageRouteInfo<FaceDetectRouteArgs> {
  FaceDetectRoute({
    Key? key,
    required dynamic Function(bool)? onFaceDetect,
    List<PageRouteInfo>? children,
  }) : super(
          FaceDetectRoute.name,
          args: FaceDetectRouteArgs(
            key: key,
            onFaceDetect: onFaceDetect,
          ),
          initialChildren: children,
        );

  static const String name = 'FaceDetectRoute';

  static const PageInfo<FaceDetectRouteArgs> page =
      PageInfo<FaceDetectRouteArgs>(name);
}

class FaceDetectRouteArgs {
  const FaceDetectRouteArgs({
    this.key,
    required this.onFaceDetect,
  });

  final Key? key;

  final dynamic Function(bool)? onFaceDetect;

  @override
  String toString() {
    return 'FaceDetectRouteArgs{key: $key, onFaceDetect: $onFaceDetect}';
  }
}

/// generated route for
/// [FaceDetectV2Page]
class FaceDetectV2Route extends PageRouteInfo<void> {
  const FaceDetectV2Route({List<PageRouteInfo>? children})
      : super(
          FaceDetectV2Route.name,
          initialChildren: children,
        );

  static const String name = 'FaceDetectV2Route';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MediaReceptionPage]
class MediaReceptionRoute extends PageRouteInfo<void> {
  const MediaReceptionRoute({List<PageRouteInfo>? children})
      : super(
          MediaReceptionRoute.name,
          initialChildren: children,
        );

  static const String name = 'MediaReceptionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MediaSpecificLocationPage]
class MediaSpecificLocationRoute extends PageRouteInfo<void> {
  const MediaSpecificLocationRoute({List<PageRouteInfo>? children})
      : super(
          MediaSpecificLocationRoute.name,
          initialChildren: children,
        );

  static const String name = 'MediaSpecificLocationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PresentingPage]
class PresentingRoute extends PageRouteInfo<PresentingRouteArgs> {
  PresentingRoute({
    Key? key,
    required List<LocationEntity> locations,
    required List<PositionEntity> positions,
    List<PageRouteInfo>? children,
  }) : super(
          PresentingRoute.name,
          args: PresentingRouteArgs(
            key: key,
            locations: locations,
            positions: positions,
          ),
          initialChildren: children,
        );

  static const String name = 'PresentingRoute';

  static const PageInfo<PresentingRouteArgs> page =
      PageInfo<PresentingRouteArgs>(name);
}

class PresentingRouteArgs {
  const PresentingRouteArgs({
    this.key,
    required this.locations,
    required this.positions,
  });

  final Key? key;

  final List<LocationEntity> locations;

  final List<PositionEntity> positions;

  @override
  String toString() {
    return 'PresentingRouteArgs{key: $key, locations: $locations, positions: $positions}';
  }
}

/// generated route for
/// [SettingChatbotPage]
class SettingChatbotRoute extends PageRouteInfo<void> {
  const SettingChatbotRoute({List<PageRouteInfo>? children})
      : super(
          SettingChatbotRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingChatbotRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingFacePage]
class SettingFaceRoute extends PageRouteInfo<void> {
  const SettingFaceRoute({List<PageRouteInfo>? children})
      : super(
          SettingFaceRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingFaceRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingPage]
class SettingRoute extends PageRouteInfo<void> {
  const SettingRoute({List<PageRouteInfo>? children})
      : super(
          SettingRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SetupLocationPage]
class SetupLocationRoute extends PageRouteInfo<void> {
  const SetupLocationRoute({List<PageRouteInfo>? children})
      : super(
          SetupLocationRoute.name,
          initialChildren: children,
        );

  static const String name = 'SetupLocationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
