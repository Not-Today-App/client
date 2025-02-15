// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'addiction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Addiction _$AddictionFromJson(Map<String, dynamic> json) {
  return _Addiction.fromJson(json);
}

/// @nodoc
mixin _$Addiction {
  /// The name of the addiction.
  String get name => throw _privateConstructorUsedError;

  /// List of symptoms associated with the addiction.
  List<String> get symptoms => throw _privateConstructorUsedError;

  /// Serializes this Addiction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Addiction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddictionCopyWith<Addiction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddictionCopyWith<$Res> {
  factory $AddictionCopyWith(Addiction value, $Res Function(Addiction) then) =
      _$AddictionCopyWithImpl<$Res, Addiction>;
  @useResult
  $Res call({String name, List<String> symptoms});
}

/// @nodoc
class _$AddictionCopyWithImpl<$Res, $Val extends Addiction>
    implements $AddictionCopyWith<$Res> {
  _$AddictionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Addiction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? symptoms = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      symptoms: null == symptoms
          ? _value.symptoms
          : symptoms // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddictionImplCopyWith<$Res>
    implements $AddictionCopyWith<$Res> {
  factory _$$AddictionImplCopyWith(
          _$AddictionImpl value, $Res Function(_$AddictionImpl) then) =
      __$$AddictionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, List<String> symptoms});
}

/// @nodoc
class __$$AddictionImplCopyWithImpl<$Res>
    extends _$AddictionCopyWithImpl<$Res, _$AddictionImpl>
    implements _$$AddictionImplCopyWith<$Res> {
  __$$AddictionImplCopyWithImpl(
      _$AddictionImpl _value, $Res Function(_$AddictionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Addiction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? symptoms = null,
  }) {
    return _then(_$AddictionImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      symptoms: null == symptoms
          ? _value._symptoms
          : symptoms // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddictionImpl implements _Addiction {
  const _$AddictionImpl(
      {required this.name, required final List<String> symptoms})
      : _symptoms = symptoms;

  factory _$AddictionImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddictionImplFromJson(json);

  /// The name of the addiction.
  @override
  final String name;

  /// List of symptoms associated with the addiction.
  final List<String> _symptoms;

  /// List of symptoms associated with the addiction.
  @override
  List<String> get symptoms {
    if (_symptoms is EqualUnmodifiableListView) return _symptoms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_symptoms);
  }

  @override
  String toString() {
    return 'Addiction(name: $name, symptoms: $symptoms)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddictionImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._symptoms, _symptoms));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(_symptoms));

  /// Create a copy of Addiction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddictionImplCopyWith<_$AddictionImpl> get copyWith =>
      __$$AddictionImplCopyWithImpl<_$AddictionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddictionImplToJson(
      this,
    );
  }
}

abstract class _Addiction implements Addiction {
  const factory _Addiction(
      {required final String name,
      required final List<String> symptoms}) = _$AddictionImpl;

  factory _Addiction.fromJson(Map<String, dynamic> json) =
      _$AddictionImpl.fromJson;

  /// The name of the addiction.
  @override
  String get name;

  /// List of symptoms associated with the addiction.
  @override
  List<String> get symptoms;

  /// Create a copy of Addiction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddictionImplCopyWith<_$AddictionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
