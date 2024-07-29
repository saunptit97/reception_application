import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:provider/provider.dart';
import 'package:reception_application/common/constants.dart';
import 'package:reception_application/di/di_setup.dart';
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'background_service.dart';
import 'base/network/dio/dio_builder.dart';
import 'common/config/screen_utils_config.dart';
import 'common/local_data/shared_pref.dart';
import 'common/provider/robot_info_provider.dart';
import 'routes/app_pages.dart';

String envConfig(String flavor) {
  switch (flavor) {
    case 'dev':
      return 'assets/env/.env_dev';
    case 'staging':
      return 'assets/env/.env_staging';
    case 'production':
      return 'assets/env/.env_production';
    default:
      return 'assets/env/.env_dev';
  }
}

// class MyHttpOverrides extends HttpOverrides{
//   @override
//   HttpClient createHttpClient(SecurityContext? context){
//     return super.createHttpClient(context)
//       ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
//   }
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // HttpOverrides.global = MyHttpOverrides();
  const flavor = String.fromEnvironment('flavor', defaultValue: 'dev');
  log("flavor: $flavor");
  await dotenv.load(
    fileName: envConfig(flavor),
  );
  await EasyLocalization.ensureInitialized();
  LocalStorage localStorage = LocalStorageImpl();
  String? baseUrl = await localStorage.get<String?>(PreferenceKeys.baseUrl);
  DioBuilder().setBaseUrl(baseUrl);
  configureDependencies();
  // await Firebase.initializeApp();
  // await getIt<PushNotificationHelper>().initialize();
  // await getIt<LocalNotificationHelper>().init();
  // await initializeService();
  runApp(
    DevicePreview(
      enabled: false, // !kReleaseMode,
      builder: (context) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<RobotInfoProvider>(
              create: (_) => RobotInfoProvider(),
            ),
          ],
          child: EasyLocalization(
            supportedLocales: const [
              LocalizationConstants.enUSLocale,
              LocalizationConstants.viLocale
            ],
            path: LocalizationConstants.path,
            fallbackLocale: LocalizationConstants.enUSLocale,
            child: MyApp(),
          ),
        );
      },
    ),
  );
}

//todo: Navigator
//todo: base bloc, base widget, etc

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _appRoute = getIt<AppPages>();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
        ScreenUtilsConfig.designWidth,
        ScreenUtilsConfig.designHeight,
      ),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routerDelegate: _appRoute.delegate(),
          routeInformationParser: _appRoute.defaultRouteParser(),
        );
      },
    );
  }
}
