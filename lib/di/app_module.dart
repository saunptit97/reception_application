import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:event_bus/event_bus.dart';
import 'package:reception_application/base/network/dio/dio_builder.dart';
import 'package:smart_robot/smart_robot.dart';

@module
abstract class AppModule {
  @singleton
  Dio get dio => DioBuilder().getDio();

  @Named('baseUrl')
  Dio get dioBase => DioBuilder().getDio();

  @singleton
  EventBus get eventBus => EventBus();

  @singleton
  SmartRobot get smartRobot => SmartRobot();
}
