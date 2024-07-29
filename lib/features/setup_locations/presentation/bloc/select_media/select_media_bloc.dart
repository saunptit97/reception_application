import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:reception_application/common/utils/functions/date_time_utils.dart';
import 'package:reception_application/features/setup_locations/domain/use_case/file_use_case.dart';

import '../../../../../base/bloc/base_bloc.dart';
import '../../../../../base/bloc/base_bloc_state.dart';
import '../../../../../base/bloc/bloc_status.dart';
import '../../../domain/entity/file_entity.dart';

part 'select_media_bloc.freezed.dart';
part 'select_media_bloc.g.dart';
part 'select_media_event.dart';
part 'select_media_state.dart';

@injectable
class SelectMediaBloc extends BaseBloc<SelectMediaEvent, SelectMediaState> {
  SelectMediaBloc(this._fileUseCase) : super(SelectMediaState.init()) {
    on<SelectMediaEvent>(
        (SelectMediaEvent event, Emitter<SelectMediaState> emit) async {
      await event.when(
        showMessage: () => onShowMessage(emit),
        initData: () => onInitData(emit),
      );
    });
  }

  final FileUseCase _fileUseCase;

  Future onShowMessage(Emitter<SelectMediaState> emit) async {
    emit(state.copyWith(message: "Error"));
  }

  Future onInitData(Emitter<SelectMediaState> emit) async {
    DateTime endTime = DateTime.now();
    DateTime startTime = endTime.subtract(const Duration(days: 180));
    final result = await _fileUseCase.getListFile(
      getStringDate(startTime, Pattern.yyyyMMddWithSeparator),
      getStringDate(endTime, Pattern.yyyyMMddWithSeparator),
    );
    result.fold((l) {
      l.when(
        httpInternalServerError: (errorBody) {
          emit(state.copyWith(message: errorBody));
        },
        httpUnAuthorizedError: () => null,
        httpUnknownError: (message) {
          emit(state.copyWith(message: message));
        },
      );
    }, (r) {
      emit(state.copyWith(files: r));
    });
  }
}
