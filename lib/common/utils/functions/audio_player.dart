import 'dart:math';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import '../../../di/di_setup.dart';
import '../../logger/logger.dart';

class PlayerAudio {
  static final AudioPlayer _audioPlayer =
      AudioPlayer(playerId: 'robot_reception_application')..setVolume(1);

  static AudioPlayer get audioPlayer => _audioPlayer;

  static Future<void> playUrl(String audio) async {
    await _audioPlayer.play(UrlSource(audio));
  }

  static Future<void> playBytes(Uint8List bytes,
      {ReleaseMode? releaseMode}) async {
    try {
      if (_audioPlayer.state == PlayerState.playing) {
        await Future.wait([
          _audioPlayer.stop(),
          _audioPlayer.release(),
        ]);
      }
      await Future.wait([
        _audioPlayer.setPlayerMode(PlayerMode.mediaPlayer),
        _audioPlayer.setReleaseMode(releaseMode ?? ReleaseMode.stop),
        _audioPlayer.play(BytesSource(bytes)),
      ]);
    } catch (e) {
      LogUtils().logE('Error play audio:');
      LogUtils().logE(e.toString());
    }
  }

  static Future<void> stop() async {
    if (_audioPlayer.state == PlayerState.playing) {
      await Future.wait([
        _audioPlayer.stop(),
        _audioPlayer.release(),
      ]);
    }
  }

  static Future<void> pause() async {
    if (_audioPlayer.state == PlayerState.playing) {
      await _audioPlayer.pause();
    }
  }

  static Future<void> resume() async {
    if (!(_audioPlayer.state == PlayerState.paused)) {
      await _audioPlayer.resume();
    }
  }

  static Future<void> dispose() async {
    await _audioPlayer.dispose();
  }
}

enum ActionType {
  click,
  connectingWifi,
  connectedWifi,
  taskStart,
  gotoCharge,
  gotoProduct,
  delivering,
  taskArrived,
  arrivedProductPoint,
  controlFailure,
  stopTurnOn,
  stopTurnOff,
  destPointError,
  missingTopo,
  startPointError,
}
