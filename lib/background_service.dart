import 'dart:async';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:reception_application/common/index.dart';
import 'package:reception_application/di/di_setup.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import 'package:record/record.dart';
import 'common/provider/listen_speech_event.dart';

final service = FlutterBackgroundService();
final recorder = AudioRecorder();

Future initializeService() async {
  await service.configure(
    androidConfiguration: AndroidConfiguration(
      // this will executed when app is in foreground or background in separated isolate
      onStart: onStart,
      // auto start service
      autoStart: false,
      isForegroundMode: true,
    ),
    iosConfiguration: IosConfiguration(
      // auto start service
      autoStart: true,

      // this will executed when app is in foreground in separated isolate
      onForeground: onStart,

      // you have to enable background fetch capability on xcode project
      onBackground: onIosBackground,
    ),
  );
}

Future<void> startBackgroundService() async {
  await service.startService();
}

void stopBackgroundService() {
  service.invoke('stopService');
}

bool onIosBackground(ServiceInstance service) {
  WidgetsFlutterBinding.ensureInitialized();
  LogUtils().logI('FLUTTER BACKGROUND FETCH');
  return true;
}

void onStop() {
  LogUtils().logI('onStop');
}

void onStart(ServiceInstance service) async {
  bool isRecording = true;

  // Only available for flutter 3.0.0 and later
  DartPluginRegistrant.ensureInitialized();

  // For flutter prior to version 3.0.0
  // We have to register the plugin manually

  _initSpeech();
  if (service is AndroidServiceInstance) {
    service.on('setAsForeground').listen((event) {
      //set as foreground
      service.setAsForegroundService();
    });

    service.on('setAsBackground').listen((event) async {
      //set as background
      service.setAsBackgroundService();
    });
  }

  service.on('stopService').listen((event) {
    recorder.dispose();
    isRecording = false;
    service.stopSelf();
  });

  startRecording(isRecording);

  // bring to foreground
  Timer.periodic(const Duration(seconds: 1), (timer) async {
    if (service is AndroidServiceInstance) {
      service.setForegroundNotificationInfo(
        title: "My App Service",
        content: "Updated at ${DateTime.now()}",
      );
    }
    if (_speechEnabled) {
      _startListening(service);
    }

    /// you can see this log in logcat
    LogUtils().logI('FLUTTER BACKGROUND SERVICE: ${DateTime.now()}');

    // test using external plugin
    // service.invoke(
    //   'update',
    //   {
    //     "current_date": DateTime.now().toIso8601String(),
    //     "last_message": '_lastWords',
    //   },
    // );
  });
}

final SpeechToText _speechToText = SpeechToText();
bool _speechEnabled = false;
String _lastWords = "Say something";
void _initSpeech() async {
  _speechEnabled = await _speechToText.initialize(
    debugLogging: true,
    onError: (errorNotification) {
      print('Error: ${errorNotification.errorMsg}');
    },
    onStatus: (statusNotification) {
      print('Status: ${statusNotification}, ${statusNotification.toLocale}');
    },
  );

  print('Speech enabled: $_speechEnabled');
}

void _startListening(ServiceInstance service) async {
  await _speechToText.listen(onResult: (result) {
    var flutterTts = FlutterTts();
    _lastWords = (result.recognizedWords.toString().toLowerCase());

    if (result.finalResult &&
        (_lastWords.contains("hello") || _lastWords.contains('chào'))) {
      service.invoke(
        'update',
        {
          "current_date": DateTime.now().toIso8601String(),
          "last_message": '_lastWords',
        },
      );
      flutterTts.speak("Xin chào, tôi là Oops, tôi có thể giúp gì cho bạn");
    } else if (_lastWords.contains('stop')) {
      _stopListening();
      flutterTts.speak("Stopped");
    }

    LogUtils().logI('Result: ${result.recognizedWords}');
  });
}

void _stopListening() async {
  await _speechToText.stop();
}

Future<void> _onSpeechResult(SpeechRecognitionResult result) async {
  var flutterTts = FlutterTts();
  _lastWords = (result.recognizedWords.toString().toLowerCase());

  if (_lastWords.contains("phiên") || _lastWords.contains('help')) {
    getIt<EventBus>().fire(ListenSpeechEvent(_lastWords));
    flutterTts.speak("Xin chào, tôi là Phiên, tôi có thể giúp gì cho bạn");
  } else if (_lastWords.contains('stop')) {
    _stopListening();
    flutterTts.speak("Stopped");
  }

  LogUtils().logI('Result: ${result.recognizedWords}');
}

Future<void> startRecording(bool isRecording) async {
  if (!isRecording) {
    return;
  }

  await recorder.start(const RecordConfig(), path: "record.wav");
  await Future.delayed(const Duration(seconds: 2));
  String? result = await recorder.stop();
  print("Recorded Path: $result");

  bool isVad = false;
  if (isVad) {
  } else {
    startRecording(isRecording);
  }
}
