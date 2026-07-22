import 'dart:developer'as developer;

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (kDebugMode) {
    developer.log('${bloc.runtimeType} $change');
    }
  }

  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    if (kDebugMode) {
      developer.log('${bloc.runtimeType} $transition');
    }
  }
}
