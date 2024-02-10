import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_simple/view/home/model/home_model.dart';
import 'package:get/get.dart';

import '../../../core/network/vexana_manager.dart';
import '../model/jobdetail_model.dart';
import '../service/jobdetail_service.dart';
import '../viewmodel/jobdetail_view_model.dart';

class JobDetailView extends StatelessWidget {
  final HomeModel job;
  JobDetailView({Key? key, required this.job}) : super(key: key);
  final ctrl = Get.put(JobDetailViewModel(
      JobDetailService(VexanaManager.instance.networkManager)));
  initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // executes after build
      ctrl.getJobDetailItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    // ctrl.getJobDetailItems();
    initState();
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text('JobDetail'),
      ),
      body: getObservableBody(context),
    );
  }

  getObservableBody(BuildContext context) {
    return Obx(() => ctrl.isLoading.value ? buildCenterLoading() : buildPage());
  }

  buildCenterLoading() => Center(
        child: CircularProgressIndicator.adaptive(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          backgroundColor: Colors.grey,
        ),
      );

  buildPage() {
    return Column(
      children: [Text(job.title!), Text(job.price.toString())],
    );
  }
}
