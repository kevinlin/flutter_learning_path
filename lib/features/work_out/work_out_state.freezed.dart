// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_out_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WorkOutState {
  WorkOutUpcomingPayload get workOut => throw _privateConstructorUsedError;
  List<ExerciseHistory> get exerciseRecords =>
      throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WorkOutStateCopyWith<WorkOutState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkOutStateCopyWith<$Res> {
  factory $WorkOutStateCopyWith(
          WorkOutState value, $Res Function(WorkOutState) then) =
      _$WorkOutStateCopyWithImpl<$Res, WorkOutState>;
  @useResult
  $Res call(
      {WorkOutUpcomingPayload workOut,
      List<ExerciseHistory> exerciseRecords,
      bool isSubmitting});

  $WorkOutUpcomingPayloadCopyWith<$Res> get workOut;
}

/// @nodoc
class _$WorkOutStateCopyWithImpl<$Res, $Val extends WorkOutState>
    implements $WorkOutStateCopyWith<$Res> {
  _$WorkOutStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workOut = null,
    Object? exerciseRecords = null,
    Object? isSubmitting = null,
  }) {
    return _then(_value.copyWith(
      workOut: null == workOut
          ? _value.workOut
          : workOut // ignore: cast_nullable_to_non_nullable
              as WorkOutUpcomingPayload,
      exerciseRecords: null == exerciseRecords
          ? _value.exerciseRecords
          : exerciseRecords // ignore: cast_nullable_to_non_nullable
              as List<ExerciseHistory>,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WorkOutUpcomingPayloadCopyWith<$Res> get workOut {
    return $WorkOutUpcomingPayloadCopyWith<$Res>(_value.workOut, (value) {
      return _then(_value.copyWith(workOut: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WorkOutStateImplCopyWith<$Res>
    implements $WorkOutStateCopyWith<$Res> {
  factory _$$WorkOutStateImplCopyWith(
          _$WorkOutStateImpl value, $Res Function(_$WorkOutStateImpl) then) =
      __$$WorkOutStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {WorkOutUpcomingPayload workOut,
      List<ExerciseHistory> exerciseRecords,
      bool isSubmitting});

  @override
  $WorkOutUpcomingPayloadCopyWith<$Res> get workOut;
}

/// @nodoc
class __$$WorkOutStateImplCopyWithImpl<$Res>
    extends _$WorkOutStateCopyWithImpl<$Res, _$WorkOutStateImpl>
    implements _$$WorkOutStateImplCopyWith<$Res> {
  __$$WorkOutStateImplCopyWithImpl(
      _$WorkOutStateImpl _value, $Res Function(_$WorkOutStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workOut = null,
    Object? exerciseRecords = null,
    Object? isSubmitting = null,
  }) {
    return _then(_$WorkOutStateImpl(
      workOut: null == workOut
          ? _value.workOut
          : workOut // ignore: cast_nullable_to_non_nullable
              as WorkOutUpcomingPayload,
      exerciseRecords: null == exerciseRecords
          ? _value._exerciseRecords
          : exerciseRecords // ignore: cast_nullable_to_non_nullable
              as List<ExerciseHistory>,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$WorkOutStateImpl with DiagnosticableTreeMixin implements _WorkOutState {
  const _$WorkOutStateImpl(
      {required this.workOut,
      required final List<ExerciseHistory> exerciseRecords,
      required this.isSubmitting})
      : _exerciseRecords = exerciseRecords;

  @override
  final WorkOutUpcomingPayload workOut;
  final List<ExerciseHistory> _exerciseRecords;
  @override
  List<ExerciseHistory> get exerciseRecords {
    if (_exerciseRecords is EqualUnmodifiableListView) return _exerciseRecords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exerciseRecords);
  }

  @override
  final bool isSubmitting;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WorkOutState(workOut: $workOut, exerciseRecords: $exerciseRecords, isSubmitting: $isSubmitting)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WorkOutState'))
      ..add(DiagnosticsProperty('workOut', workOut))
      ..add(DiagnosticsProperty('exerciseRecords', exerciseRecords))
      ..add(DiagnosticsProperty('isSubmitting', isSubmitting));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkOutStateImpl &&
            (identical(other.workOut, workOut) || other.workOut == workOut) &&
            const DeepCollectionEquality()
                .equals(other._exerciseRecords, _exerciseRecords) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting));
  }

  @override
  int get hashCode => Object.hash(runtimeType, workOut,
      const DeepCollectionEquality().hash(_exerciseRecords), isSubmitting);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkOutStateImplCopyWith<_$WorkOutStateImpl> get copyWith =>
      __$$WorkOutStateImplCopyWithImpl<_$WorkOutStateImpl>(this, _$identity);
}

abstract class _WorkOutState implements WorkOutState {
  const factory _WorkOutState(
      {required final WorkOutUpcomingPayload workOut,
      required final List<ExerciseHistory> exerciseRecords,
      required final bool isSubmitting}) = _$WorkOutStateImpl;

  @override
  WorkOutUpcomingPayload get workOut;
  @override
  List<ExerciseHistory> get exerciseRecords;
  @override
  bool get isSubmitting;
  @override
  @JsonKey(ignore: true)
  _$$WorkOutStateImplCopyWith<_$WorkOutStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
