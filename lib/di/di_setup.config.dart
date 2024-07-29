// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:event_bus/event_bus.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:smart_robot/smart_robot.dart' as _i5;

import '../common/local_data/shared_pref.dart' as _i11;
import '../common/logger/logger.dart' as _i6;
import '../common/notification/local_notification_helper.dart' as _i7;
import '../common/notification/push_notification_helper.dart' as _i8;
import '../common/utils/snack_bar/snack_bar_helper.dart' as _i9;
import '../features/example/data/remote/service/example_service.dart' as _i12;
import '../features/example/data/remote/source/data_source.dart' as _i19;
import '../features/example/data/remote/source/data_source_impl.dart' as _i20;
import '../features/example/data/repository/core_repository_impl.dart' as _i30;
import '../features/example/domain/repository/core_repository.dart' as _i29;
import '../features/example/domain/use_case/use_case.dart' as _i33;
import '../features/example/domain/use_case/use_case_impl.dart' as _i34;
import '../features/example/presentation/bloc/example_bloc.dart' as _i43;
import '../features/presenting/data/remote/service/delivery_service.dart'
    as _i15;
import '../features/presenting/data/remote/service/speech_processing_service.dart'
    as _i14;
import '../features/presenting/data/remote/source/delivery_data_source.dart'
    as _i25;
import '../features/presenting/data/remote/source/delivery_data_source_impl.dart'
    as _i26;
import '../features/presenting/data/remote/source/speech_processing_source.dart'
    as _i21;
import '../features/presenting/data/remote/source/speech_processing_source_impl.dart'
    as _i22;
import '../features/presenting/data/repository/delivery_repository_impl.dart'
    as _i28;
import '../features/presenting/data/repository/speech_processing_repository_impl.dart'
    as _i36;
import '../features/presenting/domain/repository/delivery_repository.dart'
    as _i27;
import '../features/presenting/domain/repository/speech_processing_repository.dart'
    as _i35;
import '../features/presenting/domain/use_case/delivery_use_case.dart' as _i37;
import '../features/presenting/domain/use_case/delivery_use_case_impl.dart'
    as _i38;
import '../features/presenting/domain/use_case/speech_use_case.dart' as _i47;
import '../features/presenting/domain/use_case/speech_use_case_impl.dart'
    as _i48;
import '../features/presenting/presentation/bloc/presenting_bloc.dart' as _i50;
import '../features/robot_info/data/remote/service/robot_info_service.dart'
    as _i16;
import '../features/robot_info/data/remote/source/robot_info_data_source.dart'
    as _i17;
import '../features/robot_info/data/remote/source/robot_info_data_source_impl.dart'
    as _i18;
import '../features/robot_info/data/repository/robot_info_repository_impl.dart'
    as _i24;
import '../features/robot_info/domain/repository/robot_info_repository.dart'
    as _i23;
import '../features/robot_info/domain/use_case/robot_info_use_case.dart'
    as _i41;
import '../features/robot_info/domain/use_case/robot_info_use_case_impl.dart'
    as _i42;
import '../features/setup_locations/data/remote/service/file_service.dart'
    as _i13;
import '../features/setup_locations/data/remote/source/file_data_source.dart'
    as _i31;
import '../features/setup_locations/data/remote/source/file_data_source_impl.dart'
    as _i32;
import '../features/setup_locations/data/repository/file_repository_impl.dart'
    as _i40;
import '../features/setup_locations/domain/repository/file_repository.dart'
    as _i39;
import '../features/setup_locations/domain/use_case/file_use_case.dart' as _i44;
import '../features/setup_locations/domain/use_case/file_use_case_impl.dart'
    as _i45;
import '../features/setup_locations/presentation/bloc/select_media/select_media_bloc.dart'
    as _i49;
import '../features/setup_locations/presentation/bloc/setup_location/location_bloc.dart'
    as _i46;
import '../routes/app_pages.dart' as _i10;
import 'app_module.dart' as _i51;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  gh.singleton<_i3.Dio>(() => appModule.dio);
  gh.singleton<_i4.EventBus>(() => appModule.eventBus);
  gh.singleton<_i5.SmartRobot>(() => appModule.smartRobot);
  gh.singleton<_i6.LogUtils>(() => _i6.LogUtils());
  gh.singleton<_i7.LocalNotificationHelper>(
      () => _i7.LocalNotificationHelper());
  gh.singleton<_i8.PushNotificationHelper>(() => _i8.PushNotificationHelper());
  gh.singleton<_i9.SnackBarHelper>(() => _i9.SnackBarHelper());
  gh.singleton<_i10.AppPages>(() => _i10.AppPages());
  gh.factory<_i11.LocalStorage>(() => _i11.LocalStorageImpl());
  gh.factory<_i3.Dio>(
    () => appModule.dioBase,
    instanceName: 'baseUrl',
  );
  gh.factory<_i12.ExampleService>(() => _i12.ExampleService(gh<_i3.Dio>()));
  gh.factory<_i13.FileService>(() => _i13.FileService(gh<_i3.Dio>()));
  gh.factory<_i14.SpeechProcessingService>(
      () => _i14.SpeechProcessingService(gh<_i3.Dio>()));
  gh.factory<_i15.DeliveryService>(() => _i15.DeliveryService(gh<_i3.Dio>()));
  gh.factory<_i16.RobotInfoService>(() => _i16.RobotInfoService(gh<_i3.Dio>()));
  gh.factory<_i17.RobotInfoDataSource>(
      () => _i18.RobotInfoDataSourceImpl(gh<_i16.RobotInfoService>()));
  gh.factory<_i19.DataSource>(
      () => _i20.DataSourceImpl(gh<_i12.ExampleService>()));
  gh.factory<_i21.SpeechProcessingSource>(() => _i22.SpeechProcessingSourceImpl(
      speechProcessingService: gh<_i14.SpeechProcessingService>()));
  gh.factory<_i23.RobotInfoRepository>(
      () => _i24.RobotInfoRepositoryImpl(gh<_i17.RobotInfoDataSource>()));
  gh.factory<_i25.DeliveryDataSource>(
      () => _i26.DeliveryDataSourceImpl(gh<_i15.DeliveryService>()));
  gh.factory<_i27.DeliveryRepository>(
      () => _i28.DeliveryRepositoryImpl(gh<_i25.DeliveryDataSource>()));
  gh.factory<_i29.ExampleRepo>(
      () => _i30.ExampleRepoImpl(gh<_i19.DataSource>()));
  gh.factory<_i31.FileDataSource>(
      () => _i32.FileDataSourceImpl(gh<_i13.FileService>()));
  gh.factory<_i33.ExampleUseCase>(
      () => _i34.ExampleUseCaseImpl(gh<_i29.ExampleRepo>()));
  gh.factory<_i35.SpeechProcessingRepository>(() =>
      _i36.SpeechProcessingRepositoryImpl(gh<_i21.SpeechProcessingSource>()));
  gh.factory<_i37.DeliveryUseCase>(
      () => _i38.DeliveryUseCaseImpl(gh<_i27.DeliveryRepository>()));
  gh.factory<_i39.FileRepository>(
      () => _i40.FileRepositoryImpl(gh<_i31.FileDataSource>()));
  gh.factory<_i41.RobotInfoUseCase>(
      () => _i42.RobotInfoUseCaseImpl(gh<_i23.RobotInfoRepository>()));
  gh.factory<_i43.ExampleBloc>(
      () => _i43.ExampleBloc(gh<_i33.ExampleUseCase>()));
  gh.factory<_i44.FileUseCase>(
      () => _i45.FileUseCaseImpl(gh<_i39.FileRepository>()));
  gh.factory<_i46.LocationBloc>(
      () => _i46.LocationBloc(gh<_i37.DeliveryUseCase>()));
  gh.factory<_i47.SpeechUseCase>(
      () => _i48.SpeechUseCaseImpl(gh<_i35.SpeechProcessingRepository>()));
  gh.factory<_i49.SelectMediaBloc>(
      () => _i49.SelectMediaBloc(gh<_i44.FileUseCase>()));
  gh.factory<_i50.PresentingBloc>(() => _i50.PresentingBloc(
        gh<_i47.SpeechUseCase>(),
        gh<_i37.DeliveryUseCase>(),
      ));
  return getIt;
}

class _$AppModule extends _i51.AppModule {}
