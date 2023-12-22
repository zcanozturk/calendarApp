import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'addjob_model.g.dart';

@JsonSerializable()
class AddjobModel {
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

  AddjobModel(
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
  factory AddjobModel.fromJson(Map<String, dynamic> json) =>
      _$AddjobModelFromJson(json);
  Map<String, dynamic> toJson() => _$AddjobModelToJson(this);
}
