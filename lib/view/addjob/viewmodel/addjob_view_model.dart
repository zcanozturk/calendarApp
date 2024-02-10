import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template_simple/view/addjob/model/addjob_model.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

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
  var jobnameController = TextEditingController();
  var locationfromController = TextEditingController();
  var locationtoController = TextEditingController();
  var leaveDayController = TextEditingController();
  var jobStartDate = DateTime.now().obs;
  var joblist = <AddjobModel>[].obs;
  List mylist = [].obs;
  void increaseCounter() => counter++;

  void changeLoading() {
    isLoading.value = !isLoading.value;
  }

  Future<void> getCalendarItems() async {
    const String localJsonPath = 'assets/jobs/jobs.json';
    final File file = await _localFile;
    AddjobModel newJob = AddjobModel(
      id: 2,
      locationfrom: "location alınan",
      locationto: "location bırakılan",
      title: "İşin Adı",
      description: "10 kişi yolcu",
      jobDayRange: 2,
      price: 2200,
      jobStartDate: "2023-12-26 22:17:17.303413",
      jobStartHour: "",
      jobFinishHour: "",
    );

    //final String response = await rootBundle.loadString(localJsonPath);
    String jsonString = await file.readAsString();

    var data = await json.decode(jsonString);
    mylist = data["data"];
    joblist.value = mylist.map((user) => AddjobModel.fromJson(user)).toList();
    joblist.value.add(newJob);
    String updatedJsonString = json.encode({"data": joblist});
    await file.writeAsString(updatedJsonString);
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/');
  }

  Future<File> writeCounter(AddjobModel job) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$job');
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }
}
