part of 'select_media_bloc.dart';

@freezed
class SelectMediaEvent with _$SelectMediaEvent {
  const factory SelectMediaEvent.showMessage() = ShowMessage;
  const factory SelectMediaEvent.initData() = OnInitData;
}
