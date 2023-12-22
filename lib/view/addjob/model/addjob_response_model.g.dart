// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addjob_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddjobResponseModel _$AddjobResponseModelFromJson(Map<String, dynamic> json) =>
    AddjobResponseModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AddjobModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddjobResponseModelToJson(
        AddjobResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
