import 'package:reception_application/common/local_data/shared_pref.dart';
import 'package:reception_application/di/di_setup.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'base_bloc_state.dart';

abstract class BaseBloc<E, S extends BaseBlocState> extends Bloc<E, S> {
  BaseBloc(super.initialState);
  final localPref = getIt<LocalStorage>();
  // final connectivity = Connectivity().onConnectivityChanged;
}
