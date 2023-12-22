import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

import 'home_model.dart';



part 'home_response_model.g.dart';

@JsonSerializable()
class HomeResponseModel extends INetworkModel<HomeResponseModel> {
  
  List<HomeModel>? data;

  HomeResponseModel({ this.data});

  @override
  HomeResponseModel fromJson(Map<String, dynamic> json) {
    return _$HomeResponseModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$HomeResponseModelToJson(this);
  }
}
