import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_template_simple/view/home/model/home_model.dart';
import 'package:flutter_template_simple/view/home/service/home_service.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  final IHomeService homeService;
  HomeViewModel(this.homeService);
  @override
  void onInit() {
    super.onInit();
    getHomeItems();
  }

  var counter = 0.obs;
  var isLoading = false.obs;
  var homeList = <HomeModel>[].obs;
  var joblist = <HomeModel>[].obs;
  List mylist = [].obs;
  int daysInMonth(DateTime date) {
    var firstDayThisMonth = new DateTime(date.year, date.month, date.day);
    var firstDayNextMonth = new DateTime(firstDayThisMonth.year,
        firstDayThisMonth.month + 1, firstDayThisMonth.day);
    return firstDayNextMonth.difference(firstDayThisMonth).inDays;
  }

  void increaseCounter() => counter++;

  void changeLoading() {
    isLoading.value = !isLoading.value;
  }

  Future<void> getHomeItems() async {
    final String localJsonPath = 'assets/jobs/jobs.json';

    final String response = await rootBundle.loadString(localJsonPath);
    var data = await json.decode(response);
    mylist = data["data"];
    joblist.value = mylist.map((user) => HomeModel.fromJson(user)).toList();

    print(joblist.first.description);
  }
}
