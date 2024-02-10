import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'jobdetail_model.g.dart';

@JsonSerializable()
class JobDetailModel{
int? id;
  String? locationfrom;
  String? locationto;
  String? jobtype;
  String? title;
  String? description;
  int? jobDayRange;
  int? price;
  String? jobStartDate;
  String? jobStartHour;
  String? jobFinishHour;

  JobDetailModel(
      {this.id,
      this.locationfrom,
      this.locationto,
      this.jobtype,
      this.title,
      this.description,
      this.jobDayRange,
      this.price,
      this.jobStartDate,
      this.jobStartHour,
      this.jobFinishHour});
    factory JobDetailModel.fromJson(Map<String, dynamic> json) =>
      _$JobDetailModelFromJson(json);
  Map<String, dynamic> toJson() => _$JobDetailModelToJson(this);
}
