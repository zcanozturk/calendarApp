import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

import 'jobdetail_model.dart';

part 'jobdetail_response_model.g.dart';

@JsonSerializable()
class JobDetailResponseModel extends INetworkModel<JobDetailResponseModel> {
  
  List<JobDetailModel>? data;

  JobDetailResponseModel({ this.data});

  @override
  JobDetailResponseModel fromJson(Map<String, dynamic> json) {
    return _$JobDetailResponseModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$JobDetailResponseModelToJson(this);
  }
}
