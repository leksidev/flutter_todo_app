import 'package:talker_flutter/talker_flutter.dart';

class AppTalkerObserver extends TalkerObserver {
  AppTalkerObserver();

  @override
  void onError(TalkerError err) {
    /// Send data to your error tracking system like Sentry or backend
    super.onError(err);
  }

  @override
  void onException(TalkerException err) {
    /// Send Exception to your error tracking system like Sentry or backend
    super.onException(err);
  }
}

final observer = AppTalkerObserver();
final talker = Talker(observer: observer);
