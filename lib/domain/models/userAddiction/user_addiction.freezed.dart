// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_addiction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserAddiction _$UserAddictionFromJson(Map<String, dynamic> json) {
  return _UserAddiction.fromJson(json);
}

/// @nodoc
mixin _$UserAddiction {
// ignore: invalid_annotation_target
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'userId')
  String get userId => throw _privateConstructorUsedError;
  String get addiction => throw _privateConstructorUsedError;
  double? get costPerDay => throw _privateConstructorUsedError;
  int? get timeSpentPerDay => throw _privateConstructorUsedError;
  List<String> get motivation => throw _privateConstructorUsedError;

  /// Serializes this UserAddiction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserAddiction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserAddictionCopyWith<UserAddiction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAddictionCopyWith<$Res> {
  factory $UserAddictionCopyWith(
          UserAddiction value, $Res Function(UserAddiction) then) =
      _$UserAddictionCopyWithImpl<$Res, UserAddiction>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: 'userId') String userId,
      String addiction,
      double? costPerDay,
      int? timeSpentPerDay,
      List<String> motivation});
}

/// @nodoc
class _$UserAddictionCopyWithImpl<$Res, $Val extends UserAddiction>
    implements $UserAddictionCopyWith<$Res> {
  _$UserAddictionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserAddiction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? addiction = null,
    Object? costPerDay = freezed,
    Object? timeSpentPerDay = freezed,
    Object? motivation = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      addiction: null == addiction
          ? _value.addiction
          : addiction // ignore: cast_nullable_to_non_nullable
              as String,
      costPerDay: freezed == costPerDay
          ? _value.costPerDay
          : costPerDay // ignore: cast_nullable_to_non_nullable
              as double?,
      timeSpentPerDay: freezed == timeSpentPerDay
          ? _value.timeSpentPerDay
          : timeSpentPerDay // ignore: cast_nullable_to_non_nullable
              as int?,
      motivation: null == motivation
          ? _value.motivation
          : motivation // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserAddictionImplCopyWith<$Res>
    implements $UserAddictionCopyWith<$Res> {
  factory _$$UserAddictionImplCopyWith(
          _$UserAddictionImpl value, $Res Function(_$UserAddictionImpl) then) =
      __$$UserAddictionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: 'userId') String userId,
      String addiction,
      double? costPerDay,
      int? timeSpentPerDay,
      List<String> motivation});
}

/// @nodoc
class __$$UserAddictionImplCopyWithImpl<$Res>
    extends _$UserAddictionCopyWithImpl<$Res, _$UserAddictionImpl>
    implements _$$UserAddictionImplCopyWith<$Res> {
  __$$UserAddictionImplCopyWithImpl(
      _$UserAddictionImpl _value, $Res Function(_$UserAddictionImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserAddiction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? addiction = null,
    Object? costPerDay = freezed,
    Object? timeSpentPerDay = freezed,
    Object? motivation = null,
  }) {
    return _then(_$UserAddictionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      addiction: null == addiction
          ? _value.addiction
          : addiction // ignore: cast_nullable_to_non_nullable
              as String,
      costPerDay: freezed == costPerDay
          ? _value.costPerDay
          : costPerDay // ignore: cast_nullable_to_non_nullable
              as double?,
      timeSpentPerDay: freezed == timeSpentPerDay
          ? _value.timeSpentPerDay
          : timeSpentPerDay // ignore: cast_nullable_to_non_nullable
              as int?,
      motivation: null == motivation
          ? _value._motivation
          : motivation // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserAddictionImpl implements _UserAddiction {
  const _$UserAddictionImpl(
      {@JsonKey(name: '_id') required this.id,
      @JsonKey(name: 'userId') required this.userId,
      required this.addiction,
      this.costPerDay,
      this.timeSpentPerDay,
      final List<String> motivation = const []})
      : _motivation = motivation;

  factory _$UserAddictionImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserAddictionImplFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  @JsonKey(name: 'userId')
  final String userId;
  @override
  final String addiction;
  @override
  final double? costPerDay;
  @override
  final int? timeSpentPerDay;
  final List<String> _motivation;
  @override
  @JsonKey()
  List<String> get motivation {
    if (_motivation is EqualUnmodifiableListView) return _motivation;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_motivation);
  }

  @override
  String toString() {
    return 'UserAddiction(id: $id, userId: $userId, addiction: $addiction, costPerDay: $costPerDay, timeSpentPerDay: $timeSpentPerDay, motivation: $motivation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserAddictionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.addiction, addiction) ||
                other.addiction == addiction) &&
            (identical(other.costPerDay, costPerDay) ||
                other.costPerDay == costPerDay) &&
            (identical(other.timeSpentPerDay, timeSpentPerDay) ||
                other.timeSpentPerDay == timeSpentPerDay) &&
            const DeepCollectionEquality()
                .equals(other._motivation, _motivation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      addiction,
      costPerDay,
      timeSpentPerDay,
      const DeepCollectionEquality().hash(_motivation));

  /// Create a copy of UserAddiction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserAddictionImplCopyWith<_$UserAddictionImpl> get copyWith =>
      __$$UserAddictionImplCopyWithImpl<_$UserAddictionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserAddictionImplToJson(
      this,
    );
  }
}

abstract class _UserAddiction implements UserAddiction {
  const factory _UserAddiction(
      {@JsonKey(name: '_id') required final String id,
      @JsonKey(name: 'userId') required final String userId,
      required final String addiction,
      final double? costPerDay,
      final int? timeSpentPerDay,
      final List<String> motivation}) = _$UserAddictionImpl;

  factory _UserAddiction.fromJson(Map<String, dynamic> json) =
      _$UserAddictionImpl.fromJson;

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  @JsonKey(name: 'userId')
  String get userId;
  @override
  String get addiction;
  @override
  double? get costPerDay;
  @override
  int? get timeSpentPerDay;
  @override
  List<String> get motivation;

  /// Create a copy of UserAddiction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserAddictionImplCopyWith<_$UserAddictionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
