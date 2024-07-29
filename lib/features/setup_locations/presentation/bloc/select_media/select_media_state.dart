part of 'select_media_bloc.dart';

@CopyWith()
class SelectMediaState extends BaseBlocState {
  final List<FileEntity>? files;

  const SelectMediaState({
    required super.status,
    super.message,
    this.files,
  });

  factory SelectMediaState.init() {
    return const SelectMediaState(status: BaseStateStatus.init);
  }

  @override
  List get props => [status, message, files];
}
