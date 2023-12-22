import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

import 'addjob_model.dart';




part 'addjob_response_model.g.dart';

@JsonSerializable()
class AddjobResponseModel extends INetworkModel<AddjobResponseModel> {
  
  List<AddjobModel>? data;

  AddjobResponseModel({ this.data});

  @override
  AddjobResponseModel fromJson(Map<String, dynamic> json) {
    return _$AddjobResponseModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$AddjobResponseModelToJson(this);
  }
}
