import 'package:flutter_learning_path/data/work_out/work_out_upcoming_payload.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'upcoming_state.freezed.dart';

@freezed
class UpcomingState with _$UpcomingState {
  const factory UpcomingState({
    required List<WorkOutUpcomingPayload> workOutList,
  }) = _UpcomingState;
}
