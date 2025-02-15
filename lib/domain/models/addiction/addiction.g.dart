// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addiction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddictionImpl _$$AddictionImplFromJson(Map<String, dynamic> json) =>
    _$AddictionImpl(
      name: json['name'] as String,
      symptoms:
          (json['symptoms'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$AddictionImplToJson(_$AddictionImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'symptoms': instance.symptoms,
    };
