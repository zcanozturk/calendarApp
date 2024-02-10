import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../model/jobdetail_model.dart';
import '../service/jobdetail_service.dart';

class JobDetailViewModel extends GetxController {
  final IJobDetailService jobDetailService;
  JobDetailViewModel(this.jobDetailService);

  var counter = 0.obs;
  var isLoading = false.obs;
  var jobDetailList = <JobDetailModel>[].obs;
  var joblist = <JobDetailModel>[].obs;
  List mylist = [].obs;
  List jobdays = [].obs;
  void increaseCounter() => counter++;

  void changeLoading() {
    isLoading.value = !isLoading.value;
  }

  Future<void> getJobDetailItems() async {
    final String localJsonPath = 'assets/jobs/jobs.json';

    final String response = await rootBundle.loadString(localJsonPath);
    var data = await json.decode(response);
    mylist = data["data"];
    joblist.value =
        mylist.map((user) => JobDetailModel.fromJson(user)).toList();
    jobdays =
        joblist.value.map((e) => DateTime.parse(e.jobStartDate!).day).toList();
    print(joblist.first.description);
  }
}
