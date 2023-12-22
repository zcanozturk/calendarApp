import 'package:flutter_template_simple/core/network/network_helper.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vexana/vexana.dart';

import '../model/addjob_model.dart';

abstract class IAddjobService {
  INetworkManager networkManager;
  IAddjobService(this.networkManager);

}

class AddjobService extends IAddjobService with NetworkHelper {
  AddjobService(INetworkManager networkManager) : super(networkManager);
  final box = GetStorage();

  
}
