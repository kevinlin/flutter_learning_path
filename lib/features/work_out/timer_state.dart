import 'package:flutter/material.dart';

@immutable
class TimerState {
  const TimerState({
    required this.countdownDateTime,
    required this.secondsLeft,
  });

  final DateTime? countdownDateTime;
  final int secondsLeft;

  TimerState copyWith({
    DateTime? countdownDateTime,
    int? secondsLeft,
  }) {
    return TimerState(
      countdownDateTime: countdownDateTime ?? this.countdownDateTime,
      secondsLeft: secondsLeft ?? this.secondsLeft,
    );
  }
}
