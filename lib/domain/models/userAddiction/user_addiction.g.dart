// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_addiction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserAddictionImpl _$$UserAddictionImplFromJson(Map<String, dynamic> json) =>
    _$UserAddictionImpl(
      id: json['_id'] as String,
      userId: json['userId'] as String,
      addiction: json['addiction'] as String,
      costPerDay: (json['costPerDay'] as num?)?.toDouble(),
      timeSpentPerDay: (json['timeSpentPerDay'] as num?)?.toInt(),
      motivation: (json['motivation'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$UserAddictionImplToJson(_$UserAddictionImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'userId': instance.userId,
      'addiction': instance.addiction,
      'costPerDay': instance.costPerDay,
      'timeSpentPerDay': instance.timeSpentPerDay,
      'motivation': instance.motivation,
    };
