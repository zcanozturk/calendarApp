// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jobdetail_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobDetailResponseModel _$JobDetailResponseModelFromJson(
        Map<String, dynamic> json) =>
    JobDetailResponseModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => JobDetailModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$JobDetailResponseModelToJson(
        JobDetailResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
