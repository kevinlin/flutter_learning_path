import 'dart:async';

import 'package:flutter_learning_path/common/date_time_extension.dart';
import 'package:flutter_learning_path/constants/app_constants.dart';
import 'package:flutter_learning_path/features/work_out/timer_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _initialState = TimerState(
  countdownDateTime: null,
  secondsLeft: 0,
);

class TimerNotifier extends Notifier<TimerState> {
  Timer? _timer;

  @override
  TimerState build() {
    return _initialState;
  }

  void createTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (_) {});
    final countdownDateTime = state.countdownDateTime;
    // if countdownDateTime is in the future, set the correct number of seconds
    if (countdownDateTime != null && countdownDateTime.isAfter(DateTime.now())) {
      state = state.copyWith(secondsLeft: countdownDateTime.secondsFromNow());
    } else {
      _resetState();
    }

    _restartTimer();
  }

  void destroyTimer() {
    _cancelTimer();
  }

  void startCountdown({required bool hasReachedTargetReps}) {
    final duration = Duration(
        seconds: hasReachedTargetReps
            ? AppConstants.DEFAULT_REST_DURATION
            : AppConstants.INCOMPLETE_SET_REST_DURATION);

    final countdownDateTime = DateTime.now().add(duration);

    state = state.copyWith(
      countdownDateTime: countdownDateTime,
      secondsLeft: countdownDateTime.secondsFromNow(),
    );

    _restartTimer();
  }

  void stopCountdown() {
    _cancelTimer();
    _resetState();
  }

  void _restartTimer() {
    _cancelTimer();
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (state.secondsLeft == 0) {
        _cancelTimer();
      } else {
        state = state.copyWith(secondsLeft: state.secondsLeft - 1);
      }
    });
  }

  void _resetState() {
    state = _initialState;
  }

  void _cancelTimer() {
    _timer?.cancel();
  }
}

final $timer = NotifierProvider<TimerNotifier, TimerState>(() => TimerNotifier());
