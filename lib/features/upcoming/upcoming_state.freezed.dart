// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upcoming_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UpcomingState {
  List<WorkOutUpcomingPayload> get workOutList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UpcomingStateCopyWith<UpcomingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpcomingStateCopyWith<$Res> {
  factory $UpcomingStateCopyWith(
          UpcomingState value, $Res Function(UpcomingState) then) =
      _$UpcomingStateCopyWithImpl<$Res, UpcomingState>;
  @useResult
  $Res call({List<WorkOutUpcomingPayload> workOutList});
}

/// @nodoc
class _$UpcomingStateCopyWithImpl<$Res, $Val extends UpcomingState>
    implements $UpcomingStateCopyWith<$Res> {
  _$UpcomingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workOutList = null,
  }) {
    return _then(_value.copyWith(
      workOutList: null == workOutList
          ? _value.workOutList
          : workOutList // ignore: cast_nullable_to_non_nullable
              as List<WorkOutUpcomingPayload>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpcomingStateImplCopyWith<$Res>
    implements $UpcomingStateCopyWith<$Res> {
  factory _$$UpcomingStateImplCopyWith(
          _$UpcomingStateImpl value, $Res Function(_$UpcomingStateImpl) then) =
      __$$UpcomingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<WorkOutUpcomingPayload> workOutList});
}

/// @nodoc
class __$$UpcomingStateImplCopyWithImpl<$Res>
    extends _$UpcomingStateCopyWithImpl<$Res, _$UpcomingStateImpl>
    implements _$$UpcomingStateImplCopyWith<$Res> {
  __$$UpcomingStateImplCopyWithImpl(
      _$UpcomingStateImpl _value, $Res Function(_$UpcomingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workOutList = null,
  }) {
    return _then(_$UpcomingStateImpl(
      workOutList: null == workOutList
          ? _value._workOutList
          : workOutList // ignore: cast_nullable_to_non_nullable
              as List<WorkOutUpcomingPayload>,
    ));
  }
}

/// @nodoc

class _$UpcomingStateImpl implements _UpcomingState {
  const _$UpcomingStateImpl(
      {required final List<WorkOutUpcomingPayload> workOutList})
      : _workOutList = workOutList;

  final List<WorkOutUpcomingPayload> _workOutList;
  @override
  List<WorkOutUpcomingPayload> get workOutList {
    if (_workOutList is EqualUnmodifiableListView) return _workOutList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workOutList);
  }

  @override
  String toString() {
    return 'UpcomingState(workOutList: $workOutList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpcomingStateImpl &&
            const DeepCollectionEquality()
                .equals(other._workOutList, _workOutList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_workOutList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpcomingStateImplCopyWith<_$UpcomingStateImpl> get copyWith =>
      __$$UpcomingStateImplCopyWithImpl<_$UpcomingStateImpl>(this, _$identity);
}

abstract class _UpcomingState implements UpcomingState {
  const factory _UpcomingState(
          {required final List<WorkOutUpcomingPayload> workOutList}) =
      _$UpcomingStateImpl;

  @override
  List<WorkOutUpcomingPayload> get workOutList;
  @override
  @JsonKey(ignore: true)
  _$$UpcomingStateImplCopyWith<_$UpcomingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
