import 'package:flutter/material.dart';
import 'package:flutter_template_simple/view/addjob/model/addjob_model.dart';
import 'package:get/get.dart';

import '../service/addjob_service.dart';

class AddjobViewModel extends GetxController {
  final IAddjobService addjobService;
  AddjobViewModel(this.addjobService);

  var counter = 0.obs;
  var isLoading = false.obs;
  var calendarList = <AddjobModel>[].obs;
  int? selectedJobDay;

  var selectedDay = 0.obs;
  List<int> daylist = <int>[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31
  ];
  List<String> typeList = <String>[
    'Transfer',
    'Saatlik İş',
  ];
  var selectedJobType = 'Seçiniz'.obs;
  String? selectedType;
  String? selectedStartHour;
  var selectedSHour = '07.00'.obs;
  List<String> hourList = <String>[
    '07:00',
    '08:00',
    '09:00',
    '10:00',
    '11:00',
    '12:00',
    '13:00',
    '14:00',
    '15:00',
    '16:00',
    '17:00',
    '18:00',
    '19:00',
    '19:00'
  ];
  String? selectedFinishHour;
  var selectedFHour = '07.00'.obs;
  var descriptionController = TextEditingController();
  var leaveDayController = TextEditingController();
  var jobStartDate = DateTime.now().obs;

  void increaseCounter() => counter++;

  void changeLoading() {
    isLoading.value = !isLoading.value;
  }

  Future<void> getCalendarItems() async {}
}
