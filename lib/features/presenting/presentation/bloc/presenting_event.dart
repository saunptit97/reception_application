part of 'presenting_bloc.dart';

@freezed
class PresentingEvent with _$PresentingEvent {
  const factory PresentingEvent.showMessage() = ShowMessage;
  const factory PresentingEvent.speechToText(File file) = SpeeckToText;
  const factory PresentingEvent.textToSpeech(String audio, String language) = TextToSpeech;
  const factory PresentingEvent.syncSensorStatus() = SyncSensorStatus;
  const factory PresentingEvent.initWaypoints(List<PositionEntity> positions) = OnInitWaypoints;
  const factory PresentingEvent.continueTask() = OnContinueTask;
  const factory PresentingEvent.cancelTask() = OnCancelTask;
  const factory PresentingEvent.pauseTask() = OnPauseTask;
  const factory PresentingEvent.nextTask() = OnNextTask;
}
