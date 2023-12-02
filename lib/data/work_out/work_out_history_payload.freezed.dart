// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_out_history_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WorkOutHistoryPayload _$WorkOutHistoryPayloadFromJson(
    Map<String, dynamic> json) {
  return _WorkOutHistoryPayload.fromJson(json);
}

/// @nodoc
mixin _$WorkOutHistoryPayload {
  String get workoutType => throw _privateConstructorUsedError;
  List<ExerciseHistory> get exercises => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkOutHistoryPayloadCopyWith<WorkOutHistoryPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkOutHistoryPayloadCopyWith<$Res> {
  factory $WorkOutHistoryPayloadCopyWith(WorkOutHistoryPayload value,
          $Res Function(WorkOutHistoryPayload) then) =
      _$WorkOutHistoryPayloadCopyWithImpl<$Res, WorkOutHistoryPayload>;
  @useResult
  $Res call({String workoutType, List<ExerciseHistory> exercises});
}

/// @nodoc
class _$WorkOutHistoryPayloadCopyWithImpl<$Res,
        $Val extends WorkOutHistoryPayload>
    implements $WorkOutHistoryPayloadCopyWith<$Res> {
  _$WorkOutHistoryPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workoutType = null,
    Object? exercises = null,
  }) {
    return _then(_value.copyWith(
      workoutType: null == workoutType
          ? _value.workoutType
          : workoutType // ignore: cast_nullable_to_non_nullable
              as String,
      exercises: null == exercises
          ? _value.exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as List<ExerciseHistory>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkOutHistoryPayloadImplCopyWith<$Res>
    implements $WorkOutHistoryPayloadCopyWith<$Res> {
  factory _$$WorkOutHistoryPayloadImplCopyWith(
          _$WorkOutHistoryPayloadImpl value,
          $Res Function(_$WorkOutHistoryPayloadImpl) then) =
      __$$WorkOutHistoryPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String workoutType, List<ExerciseHistory> exercises});
}

/// @nodoc
class __$$WorkOutHistoryPayloadImplCopyWithImpl<$Res>
    extends _$WorkOutHistoryPayloadCopyWithImpl<$Res,
        _$WorkOutHistoryPayloadImpl>
    implements _$$WorkOutHistoryPayloadImplCopyWith<$Res> {
  __$$WorkOutHistoryPayloadImplCopyWithImpl(_$WorkOutHistoryPayloadImpl _value,
      $Res Function(_$WorkOutHistoryPayloadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workoutType = null,
    Object? exercises = null,
  }) {
    return _then(_$WorkOutHistoryPayloadImpl(
      null == workoutType
          ? _value.workoutType
          : workoutType // ignore: cast_nullable_to_non_nullable
              as String,
      null == exercises
          ? _value._exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as List<ExerciseHistory>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkOutHistoryPayloadImpl implements _WorkOutHistoryPayload {
  const _$WorkOutHistoryPayloadImpl(
      this.workoutType, final List<ExerciseHistory> exercises)
      : _exercises = exercises;

  factory _$WorkOutHistoryPayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkOutHistoryPayloadImplFromJson(json);

  @override
  final String workoutType;
  final List<ExerciseHistory> _exercises;
  @override
  List<ExerciseHistory> get exercises {
    if (_exercises is EqualUnmodifiableListView) return _exercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exercises);
  }

  @override
  String toString() {
    return 'WorkOutHistoryPayload(workoutType: $workoutType, exercises: $exercises)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkOutHistoryPayloadImpl &&
            (identical(other.workoutType, workoutType) ||
                other.workoutType == workoutType) &&
            const DeepCollectionEquality()
                .equals(other._exercises, _exercises));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, workoutType,
      const DeepCollectionEquality().hash(_exercises));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkOutHistoryPayloadImplCopyWith<_$WorkOutHistoryPayloadImpl>
      get copyWith => __$$WorkOutHistoryPayloadImplCopyWithImpl<
          _$WorkOutHistoryPayloadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkOutHistoryPayloadImplToJson(
      this,
    );
  }
}

abstract class _WorkOutHistoryPayload implements WorkOutHistoryPayload {
  const factory _WorkOutHistoryPayload(
          final String workoutType, final List<ExerciseHistory> exercises) =
      _$WorkOutHistoryPayloadImpl;

  factory _WorkOutHistoryPayload.fromJson(Map<String, dynamic> json) =
      _$WorkOutHistoryPayloadImpl.fromJson;

  @override
  String get workoutType;
  @override
  List<ExerciseHistory> get exercises;
  @override
  @JsonKey(ignore: true)
  _$$WorkOutHistoryPayloadImplCopyWith<_$WorkOutHistoryPayloadImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ExerciseHistory _$ExerciseHistoryFromJson(Map<String, dynamic> json) {
  return _ExerciseHistory.fromJson(json);
}

/// @nodoc
mixin _$ExerciseHistory {
  String get displayName => throw _privateConstructorUsedError;
  String get weight => throw _privateConstructorUsedError;
  List<int?> get completedReps => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExerciseHistoryCopyWith<ExerciseHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseHistoryCopyWith<$Res> {
  factory $ExerciseHistoryCopyWith(
          ExerciseHistory value, $Res Function(ExerciseHistory) then) =
      _$ExerciseHistoryCopyWithImpl<$Res, ExerciseHistory>;
  @useResult
  $Res call({String displayName, String weight, List<int?> completedReps});
}

/// @nodoc
class _$ExerciseHistoryCopyWithImpl<$Res, $Val extends ExerciseHistory>
    implements $ExerciseHistoryCopyWith<$Res> {
  _$ExerciseHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = null,
    Object? weight = null,
    Object? completedReps = null,
  }) {
    return _then(_value.copyWith(
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as String,
      completedReps: null == completedReps
          ? _value.completedReps
          : completedReps // ignore: cast_nullable_to_non_nullable
              as List<int?>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExerciseHistoryImplCopyWith<$Res>
    implements $ExerciseHistoryCopyWith<$Res> {
  factory _$$ExerciseHistoryImplCopyWith(_$ExerciseHistoryImpl value,
          $Res Function(_$ExerciseHistoryImpl) then) =
      __$$ExerciseHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String displayName, String weight, List<int?> completedReps});
}

/// @nodoc
class __$$ExerciseHistoryImplCopyWithImpl<$Res>
    extends _$ExerciseHistoryCopyWithImpl<$Res, _$ExerciseHistoryImpl>
    implements _$$ExerciseHistoryImplCopyWith<$Res> {
  __$$ExerciseHistoryImplCopyWithImpl(
      _$ExerciseHistoryImpl _value, $Res Function(_$ExerciseHistoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = null,
    Object? weight = null,
    Object? completedReps = null,
  }) {
    return _then(_$ExerciseHistoryImpl(
      null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as String,
      null == completedReps
          ? _value._completedReps
          : completedReps // ignore: cast_nullable_to_non_nullable
              as List<int?>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExerciseHistoryImpl implements _ExerciseHistory {
  _$ExerciseHistoryImpl(
      this.displayName, this.weight, final List<int?> completedReps)
      : _completedReps = completedReps;

  factory _$ExerciseHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExerciseHistoryImplFromJson(json);

  @override
  final String displayName;
  @override
  final String weight;
  final List<int?> _completedReps;
  @override
  List<int?> get completedReps {
    if (_completedReps is EqualUnmodifiableListView) return _completedReps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_completedReps);
  }

  @override
  String toString() {
    return 'ExerciseHistory(displayName: $displayName, weight: $weight, completedReps: $completedReps)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseHistoryImpl &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            const DeepCollectionEquality()
                .equals(other._completedReps, _completedReps));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, displayName, weight,
      const DeepCollectionEquality().hash(_completedReps));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciseHistoryImplCopyWith<_$ExerciseHistoryImpl> get copyWith =>
      __$$ExerciseHistoryImplCopyWithImpl<_$ExerciseHistoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExerciseHistoryImplToJson(
      this,
    );
  }
}

abstract class _ExerciseHistory implements ExerciseHistory {
  factory _ExerciseHistory(final String displayName, final String weight,
      final List<int?> completedReps) = _$ExerciseHistoryImpl;

  factory _ExerciseHistory.fromJson(Map<String, dynamic> json) =
      _$ExerciseHistoryImpl.fromJson;

  @override
  String get displayName;
  @override
  String get weight;
  @override
  List<int?> get completedReps;
  @override
  @JsonKey(ignore: true)
  _$$ExerciseHistoryImplCopyWith<_$ExerciseHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
