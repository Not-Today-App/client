// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addiction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddictionImpl _$$AddictionImplFromJson(Map<String, dynamic> json) =>
    _$AddictionImpl(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      quitReason: json['quitReason'] as String?,
      symptoms: (json['symptoms'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      treatmentOptions: (json['treatmentOptions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      triggers: (json['triggers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$AddictionImplToJson(_$AddictionImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'quitReason': instance.quitReason,
      'symptoms': instance.symptoms,
      'treatmentOptions': instance.treatmentOptions,
      'triggers': instance.triggers,
    };
