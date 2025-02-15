part of 'location_bloc.dart';

@freezed
class LocationEvent with _$LocationEvent {
  const factory LocationEvent.showMessage() = ShowMessage;
  const factory LocationEvent.initData() = OnInitData;
}
