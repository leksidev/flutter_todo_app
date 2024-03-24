import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_app/src/utils/talker_observer.dart';
import 'package:talker_flutter/talker_flutter.dart';

class BlocLog extends TalkerLog {
  BlocLog(String super.message);

  @override
  String get title => 'bloc';

  @override
  AnsiPen get pen => AnsiPen()..xterm(121);
}

final talkerProvider = Provider<Talker>(
  (ref) => TalkerFlutter.init(
    observer: AppTalkerObserver(),
    settings: TalkerSettings(
      titles: {
        TalkerLogType.exception: 'Whatever you want',
        TalkerLogType.error: 'E',
        TalkerLogType.info: 'i',
      },
    ),
  ),
);
