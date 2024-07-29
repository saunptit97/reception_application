import 'package:freezed_annotation/freezed_annotation.dart';
part 'file_model.freezed.dart';
part 'file_model.g.dart';

@freezed
class FileModel with _$FileModel {
  const factory FileModel({
    @JsonKey(name: "file_id") int? fileId,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "status") int? status,
    @JsonKey(name: "url") String? url,
    @JsonKey(name: "processing_date") String? processingDate,
  }) = _FileModel;

  factory FileModel.fromJson(Map<String, dynamic> json) => _$FileModelFromJson(json);
}
