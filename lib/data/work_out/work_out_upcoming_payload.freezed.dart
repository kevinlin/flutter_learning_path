// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_out_upcoming_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WorkOutUpcomingPayload _$WorkOutUpcomingPayloadFromJson(
    Map<String, dynamic> json) {
  return _WorkOutUpcomingPayload.fromJson(json);
}

/// @nodoc
mixin _$WorkOutUpcomingPayload {
  DateTime get date => throw _privateConstructorUsedError;
  String get workoutType => throw _privateConstructorUsedError;
  List<ExerciseUpcoming> get exercises => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkOutUpcomingPayloadCopyWith<WorkOutUpcomingPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkOutUpcomingPayloadCopyWith<$Res> {
  factory $WorkOutUpcomingPayloadCopyWith(WorkOutUpcomingPayload value,
          $Res Function(WorkOutUpcomingPayload) then) =
      _$WorkOutUpcomingPayloadCopyWithImpl<$Res, WorkOutUpcomingPayload>;
  @useResult
  $Res call(
      {DateTime date, String workoutType, List<ExerciseUpcoming> exercises});
}

/// @nodoc
class _$WorkOutUpcomingPayloadCopyWithImpl<$Res,
        $Val extends WorkOutUpcomingPayload>
    implements $WorkOutUpcomingPayloadCopyWith<$Res> {
  _$WorkOutUpcomingPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? workoutType = null,
    Object? exercises = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      workoutType: null == workoutType
          ? _value.workoutType
          : workoutType // ignore: cast_nullable_to_non_nullable
              as String,
      exercises: null == exercises
          ? _value.exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as List<ExerciseUpcoming>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkOutUpcomingPayloadImplCopyWith<$Res>
    implements $WorkOutUpcomingPayloadCopyWith<$Res> {
  factory _$$WorkOutUpcomingPayloadImplCopyWith(
          _$WorkOutUpcomingPayloadImpl value,
          $Res Function(_$WorkOutUpcomingPayloadImpl) then) =
      __$$WorkOutUpcomingPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime date, String workoutType, List<ExerciseUpcoming> exercises});
}

/// @nodoc
class __$$WorkOutUpcomingPayloadImplCopyWithImpl<$Res>
    extends _$WorkOutUpcomingPayloadCopyWithImpl<$Res,
        _$WorkOutUpcomingPayloadImpl>
    implements _$$WorkOutUpcomingPayloadImplCopyWith<$Res> {
  __$$WorkOutUpcomingPayloadImplCopyWithImpl(
      _$WorkOutUpcomingPayloadImpl _value,
      $Res Function(_$WorkOutUpcomingPayloadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? workoutType = null,
    Object? exercises = null,
  }) {
    return _then(_$WorkOutUpcomingPayloadImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      workoutType: null == workoutType
          ? _value.workoutType
          : workoutType // ignore: cast_nullable_to_non_nullable
              as String,
      exercises: null == exercises
          ? _value._exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as List<ExerciseUpcoming>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkOutUpcomingPayloadImpl implements _WorkOutUpcomingPayload {
  const _$WorkOutUpcomingPayloadImpl(
      {required this.date,
      required this.workoutType,
      required final List<ExerciseUpcoming> exercises})
      : _exercises = exercises;

  factory _$WorkOutUpcomingPayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkOutUpcomingPayloadImplFromJson(json);

  @override
  final DateTime date;
  @override
  final String workoutType;
  final List<ExerciseUpcoming> _exercises;
  @override
  List<ExerciseUpcoming> get exercises {
    if (_exercises is EqualUnmodifiableListView) return _exercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exercises);
  }

  @override
  String toString() {
    return 'WorkOutUpcomingPayload(date: $date, workoutType: $workoutType, exercises: $exercises)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkOutUpcomingPayloadImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.workoutType, workoutType) ||
                other.workoutType == workoutType) &&
            const DeepCollectionEquality()
                .equals(other._exercises, _exercises));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date, workoutType,
      const DeepCollectionEquality().hash(_exercises));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkOutUpcomingPayloadImplCopyWith<_$WorkOutUpcomingPayloadImpl>
      get copyWith => __$$WorkOutUpcomingPayloadImplCopyWithImpl<
          _$WorkOutUpcomingPayloadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkOutUpcomingPayloadImplToJson(
      this,
    );
  }
}

abstract class _WorkOutUpcomingPayload implements WorkOutUpcomingPayload {
  const factory _WorkOutUpcomingPayload(
          {required final DateTime date,
          required final String workoutType,
          required final List<ExerciseUpcoming> exercises}) =
      _$WorkOutUpcomingPayloadImpl;

  factory _WorkOutUpcomingPayload.fromJson(Map<String, dynamic> json) =
      _$WorkOutUpcomingPayloadImpl.fromJson;

  @override
  DateTime get date;
  @override
  String get workoutType;
  @override
  List<ExerciseUpcoming> get exercises;
  @override
  @JsonKey(ignore: true)
  _$$WorkOutUpcomingPayloadImplCopyWith<_$WorkOutUpcomingPayloadImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ExerciseUpcoming _$ExerciseUpcomingFromJson(Map<String, dynamic> json) {
  return _ExerciseUpcoming.fromJson(json);
}

/// @nodoc
mixin _$ExerciseUpcoming {
  String get displayName => throw _privateConstructorUsedError;
  num get weight => throw _privateConstructorUsedError;
  int get targetReps => throw _privateConstructorUsedError;
  int get targetSets => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExerciseUpcomingCopyWith<ExerciseUpcoming> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseUpcomingCopyWith<$Res> {
  factory $ExerciseUpcomingCopyWith(
          ExerciseUpcoming value, $Res Function(ExerciseUpcoming) then) =
      _$ExerciseUpcomingCopyWithImpl<$Res, ExerciseUpcoming>;
  @useResult
  $Res call({String displayName, num weight, int targetReps, int targetSets});
}

/// @nodoc
class _$ExerciseUpcomingCopyWithImpl<$Res, $Val extends ExerciseUpcoming>
    implements $ExerciseUpcomingCopyWith<$Res> {
  _$ExerciseUpcomingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = null,
    Object? weight = null,
    Object? targetReps = null,
    Object? targetSets = null,
  }) {
    return _then(_value.copyWith(
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as num,
      targetReps: null == targetReps
          ? _value.targetReps
          : targetReps // ignore: cast_nullable_to_non_nullable
              as int,
      targetSets: null == targetSets
          ? _value.targetSets
          : targetSets // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExerciseUpcomingImplCopyWith<$Res>
    implements $ExerciseUpcomingCopyWith<$Res> {
  factory _$$ExerciseUpcomingImplCopyWith(_$ExerciseUpcomingImpl value,
          $Res Function(_$ExerciseUpcomingImpl) then) =
      __$$ExerciseUpcomingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String displayName, num weight, int targetReps, int targetSets});
}

/// @nodoc
class __$$ExerciseUpcomingImplCopyWithImpl<$Res>
    extends _$ExerciseUpcomingCopyWithImpl<$Res, _$ExerciseUpcomingImpl>
    implements _$$ExerciseUpcomingImplCopyWith<$Res> {
  __$$ExerciseUpcomingImplCopyWithImpl(_$ExerciseUpcomingImpl _value,
      $Res Function(_$ExerciseUpcomingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = null,
    Object? weight = null,
    Object? targetReps = null,
    Object? targetSets = null,
  }) {
    return _then(_$ExerciseUpcomingImpl(
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as num,
      targetReps: null == targetReps
          ? _value.targetReps
          : targetReps // ignore: cast_nullable_to_non_nullable
              as int,
      targetSets: null == targetSets
          ? _value.targetSets
          : targetSets // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExerciseUpcomingImpl implements _ExerciseUpcoming {
  const _$ExerciseUpcomingImpl(
      {required this.displayName,
      required this.weight,
      required this.targetReps,
      required this.targetSets});

  factory _$ExerciseUpcomingImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExerciseUpcomingImplFromJson(json);

  @override
  final String displayName;
  @override
  final num weight;
  @override
  final int targetReps;
  @override
  final int targetSets;

  @override
  String toString() {
    return 'ExerciseUpcoming(displayName: $displayName, weight: $weight, targetReps: $targetReps, targetSets: $targetSets)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseUpcomingImpl &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.targetReps, targetReps) ||
                other.targetReps == targetReps) &&
            (identical(other.targetSets, targetSets) ||
                other.targetSets == targetSets));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, displayName, weight, targetReps, targetSets);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciseUpcomingImplCopyWith<_$ExerciseUpcomingImpl> get copyWith =>
      __$$ExerciseUpcomingImplCopyWithImpl<_$ExerciseUpcomingImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExerciseUpcomingImplToJson(
      this,
    );
  }
}

abstract class _ExerciseUpcoming implements ExerciseUpcoming {
  const factory _ExerciseUpcoming(
      {required final String displayName,
      required final num weight,
      required final int targetReps,
      required final int targetSets}) = _$ExerciseUpcomingImpl;

  factory _ExerciseUpcoming.fromJson(Map<String, dynamic> json) =
      _$ExerciseUpcomingImpl.fromJson;

  @override
  String get displayName;
  @override
  num get weight;
  @override
  int get targetReps;
  @override
  int get targetSets;
  @override
  @JsonKey(ignore: true)
  _$$ExerciseUpcomingImplCopyWith<_$ExerciseUpcomingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
