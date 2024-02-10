import 'package:flutter/material.dart';
import 'package:flutter_template_simple/view/home/model/home_model.dart';
import 'package:flutter_template_simple/view/jobdetail/view/jobdetail_view.dart';
import 'package:get/get.dart';

getDialogDescription(HomeModel job) {
  Get.defaultDialog(
      content: Column(
        children: [
          Text(job.locationfrom!),
          Text(DateTime.parse(job.jobStartDate!).hour.toString() +
              ':' +
              DateTime.parse(job.jobStartDate!).minute.toString())
        ],
      ),
      onConfirm: () {
        Get.to(JobDetailView(job: job));
      },
      title: job.title!,
      textConfirm: 'Düzenle',
      textCancel: 'Cancel');
}
