// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_data_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserDataPayload _$UserDataPayloadFromJson(Map<String, dynamic> json) {
  return _UserDataPayload.fromJson(json);
}

/// @nodoc
mixin _$UserDataPayload {
  String get id => throw _privateConstructorUsedError;
  GenderType? get gender => throw _privateConstructorUsedError;
  DateTime? get dateOfBirth => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;
  int get weight => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDataPayloadCopyWith<UserDataPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDataPayloadCopyWith<$Res> {
  factory $UserDataPayloadCopyWith(
          UserDataPayload value, $Res Function(UserDataPayload) then) =
      _$UserDataPayloadCopyWithImpl<$Res, UserDataPayload>;
  @useResult
  $Res call(
      {String id,
      GenderType? gender,
      DateTime? dateOfBirth,
      int height,
      int weight});
}

/// @nodoc
class _$UserDataPayloadCopyWithImpl<$Res, $Val extends UserDataPayload>
    implements $UserDataPayloadCopyWith<$Res> {
  _$UserDataPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? gender = freezed,
    Object? dateOfBirth = freezed,
    Object? height = null,
    Object? weight = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as GenderType?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserDataPayloadImplCopyWith<$Res>
    implements $UserDataPayloadCopyWith<$Res> {
  factory _$$UserDataPayloadImplCopyWith(_$UserDataPayloadImpl value,
          $Res Function(_$UserDataPayloadImpl) then) =
      __$$UserDataPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      GenderType? gender,
      DateTime? dateOfBirth,
      int height,
      int weight});
}

/// @nodoc
class __$$UserDataPayloadImplCopyWithImpl<$Res>
    extends _$UserDataPayloadCopyWithImpl<$Res, _$UserDataPayloadImpl>
    implements _$$UserDataPayloadImplCopyWith<$Res> {
  __$$UserDataPayloadImplCopyWithImpl(
      _$UserDataPayloadImpl _value, $Res Function(_$UserDataPayloadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? gender = freezed,
    Object? dateOfBirth = freezed,
    Object? height = null,
    Object? weight = null,
  }) {
    return _then(_$UserDataPayloadImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as GenderType?,
      freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDataPayloadImpl implements _UserDataPayload {
  const _$UserDataPayloadImpl(
      this.id, this.gender, this.dateOfBirth, this.height, this.weight);

  factory _$UserDataPayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDataPayloadImplFromJson(json);

  @override
  final String id;
  @override
  final GenderType? gender;
  @override
  final DateTime? dateOfBirth;
  @override
  final int height;
  @override
  final int weight;

  @override
  String toString() {
    return 'UserDataPayload(id: $id, gender: $gender, dateOfBirth: $dateOfBirth, height: $height, weight: $weight)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDataPayloadImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, gender, dateOfBirth, height, weight);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDataPayloadImplCopyWith<_$UserDataPayloadImpl> get copyWith =>
      __$$UserDataPayloadImplCopyWithImpl<_$UserDataPayloadImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDataPayloadImplToJson(
      this,
    );
  }
}

abstract class _UserDataPayload implements UserDataPayload {
  const factory _UserDataPayload(
      final String id,
      final GenderType? gender,
      final DateTime? dateOfBirth,
      final int height,
      final int weight) = _$UserDataPayloadImpl;

  factory _UserDataPayload.fromJson(Map<String, dynamic> json) =
      _$UserDataPayloadImpl.fromJson;

  @override
  String get id;
  @override
  GenderType? get gender;
  @override
  DateTime? get dateOfBirth;
  @override
  int get height;
  @override
  int get weight;
  @override
  @JsonKey(ignore: true)
  _$$UserDataPayloadImplCopyWith<_$UserDataPayloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
