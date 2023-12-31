import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'home_model.g.dart';

@JsonSerializable()
class HomeModel{
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

  HomeModel(
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
    factory HomeModel.fromJson(Map<String, dynamic> json) =>
      _$HomeModelFromJson(json);
  Map<String, dynamic> toJson() => _$HomeModelToJson(this);
}
