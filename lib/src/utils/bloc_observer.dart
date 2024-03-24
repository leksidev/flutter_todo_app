import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/src/utils/talker_provider.dart';
import 'package:talker_flutter/talker_flutter.dart';

class AppBlocObserver extends BlocObserver {
  final Talker talker;

  AppBlocObserver({required this.talker});

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    talker.logTyped(
      BlocLog('${bloc.runtimeType} created'),
    );
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    talker.logTyped(
      BlocLog('${bloc.runtimeType} $transition'),
    );
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    talker.logTyped(
      BlocLog('${bloc.runtimeType} $change'),
    );
  }
}
