import 'package:flutter/material.dart';
import 'package:flutter_learning_path/data/work_out/work_out_upcoming_payload.dart';

@immutable
class UpcomingState {
  const UpcomingState({required this.workOutList});

  final List<WorkOutUpcomingPayload> workOutList;

  UpcomingState copyWith({List<WorkOutUpcomingPayload>? workOutList}) {
    return UpcomingState(workOutList: workOutList ?? this.workOutList);
  }
}
