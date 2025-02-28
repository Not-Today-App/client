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
  // ignore: duplicate_ignore
// ignore: invalid_annotation_target
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get quitReason => throw _privateConstructorUsedError;
  List<String>? get symptoms => throw _privateConstructorUsedError;
  List<String>? get treatmentOptions => throw _privateConstructorUsedError;
  List<String>? get triggers => throw _privateConstructorUsedError;

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
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? name,
      String? quitReason,
      List<String>? symptoms,
      List<String>? treatmentOptions,
      List<String>? triggers});
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
    Object? id = freezed,
    Object? name = freezed,
    Object? quitReason = freezed,
    Object? symptoms = freezed,
    Object? treatmentOptions = freezed,
    Object? triggers = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      quitReason: freezed == quitReason
          ? _value.quitReason
          : quitReason // ignore: cast_nullable_to_non_nullable
              as String?,
      symptoms: freezed == symptoms
          ? _value.symptoms
          : symptoms // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      treatmentOptions: freezed == treatmentOptions
          ? _value.treatmentOptions
          : treatmentOptions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      triggers: freezed == triggers
          ? _value.triggers
          : triggers // ignore: cast_nullable_to_non_nullable
              as List<String>?,
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
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? name,
      String? quitReason,
      List<String>? symptoms,
      List<String>? treatmentOptions,
      List<String>? triggers});
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
    Object? id = freezed,
    Object? name = freezed,
    Object? quitReason = freezed,
    Object? symptoms = freezed,
    Object? treatmentOptions = freezed,
    Object? triggers = freezed,
  }) {
    return _then(_$AddictionImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      quitReason: freezed == quitReason
          ? _value.quitReason
          : quitReason // ignore: cast_nullable_to_non_nullable
              as String?,
      symptoms: freezed == symptoms
          ? _value._symptoms
          : symptoms // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      treatmentOptions: freezed == treatmentOptions
          ? _value._treatmentOptions
          : treatmentOptions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      triggers: freezed == triggers
          ? _value._triggers
          : triggers // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddictionImpl implements _Addiction {
  const _$AddictionImpl(
      {@JsonKey(name: '_id') this.id,
      required this.name,
      required this.quitReason,
      final List<String>? symptoms,
      final List<String>? treatmentOptions,
      final List<String>? triggers})
      : _symptoms = symptoms,
        _treatmentOptions = treatmentOptions,
        _triggers = triggers;

  factory _$AddictionImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddictionImplFromJson(json);
// ignore: duplicate_ignore
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? name;
  @override
  final String? quitReason;
  final List<String>? _symptoms;
  @override
  List<String>? get symptoms {
    final value = _symptoms;
    if (value == null) return null;
    if (_symptoms is EqualUnmodifiableListView) return _symptoms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _treatmentOptions;
  @override
  List<String>? get treatmentOptions {
    final value = _treatmentOptions;
    if (value == null) return null;
    if (_treatmentOptions is EqualUnmodifiableListView)
      return _treatmentOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _triggers;
  @override
  List<String>? get triggers {
    final value = _triggers;
    if (value == null) return null;
    if (_triggers is EqualUnmodifiableListView) return _triggers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Addiction(id: $id, name: $name, quitReason: $quitReason, symptoms: $symptoms, treatmentOptions: $treatmentOptions, triggers: $triggers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddictionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.quitReason, quitReason) ||
                other.quitReason == quitReason) &&
            const DeepCollectionEquality().equals(other._symptoms, _symptoms) &&
            const DeepCollectionEquality()
                .equals(other._treatmentOptions, _treatmentOptions) &&
            const DeepCollectionEquality().equals(other._triggers, _triggers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      quitReason,
      const DeepCollectionEquality().hash(_symptoms),
      const DeepCollectionEquality().hash(_treatmentOptions),
      const DeepCollectionEquality().hash(_triggers));

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
      {@JsonKey(name: '_id') final String? id,
      required final String? name,
      required final String? quitReason,
      final List<String>? symptoms,
      final List<String>? treatmentOptions,
      final List<String>? triggers}) = _$AddictionImpl;

  factory _Addiction.fromJson(Map<String, dynamic> json) =
      _$AddictionImpl.fromJson;
// ignore: duplicate_ignore
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get name;
  @override
  String? get quitReason;
  @override
  List<String>? get symptoms;
  @override
  List<String>? get treatmentOptions;
  @override
  List<String>? get triggers;

  /// Create a copy of Addiction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddictionImplCopyWith<_$AddictionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
