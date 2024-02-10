// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jobdetail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobDetailModel _$JobDetailModelFromJson(Map<String, dynamic> json) =>
    JobDetailModel(
      id: json['id'] as int?,
      locationfrom: json['locationfrom'] as String?,
      locationto: json['locationto'] as String?,
      jobtype: json['jobtype'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      jobDayRange: json['jobDayRange'] as int?,
      price: json['price'] as int?,
      jobStartDate: json['jobStartDate'] as String?,
      jobStartHour: json['jobStartHour'] as String?,
      jobFinishHour: json['jobFinishHour'] as String?,
    );

Map<String, dynamic> _$JobDetailModelToJson(JobDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'locationfrom': instance.locationfrom,
      'locationto': instance.locationto,
      'jobtype': instance.jobtype,
      'title': instance.title,
      'description': instance.description,
      'jobDayRange': instance.jobDayRange,
      'price': instance.price,
      'jobStartDate': instance.jobStartDate,
      'jobStartHour': instance.jobStartHour,
      'jobFinishHour': instance.jobFinishHour,
    };
