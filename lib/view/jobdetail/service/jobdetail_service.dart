import 'package:flutter_template_simple/core/network/network_helper.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vexana/vexana.dart';


abstract class IJobDetailService {
  INetworkManager networkManager;
  IJobDetailService(this.networkManager);

}

class JobDetailService extends IJobDetailService with NetworkHelper {
  JobDetailService(INetworkManager networkManager) : super(networkManager);
  final box = GetStorage();

 
}
