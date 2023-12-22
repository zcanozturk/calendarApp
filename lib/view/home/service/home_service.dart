import 'package:flutter_template_simple/core/network/network_helper.dart';
import 'package:flutter_template_simple/view/home/model/home_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vexana/vexana.dart';

abstract class IHomeService {
  INetworkManager networkManager;
  IHomeService(this.networkManager);

}

class HomeService extends IHomeService with NetworkHelper {
  HomeService(INetworkManager networkManager) : super(networkManager);
  final box = GetStorage();

  
}
