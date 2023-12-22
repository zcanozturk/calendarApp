import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_simple/core/extensions/context_extension.dart';
import 'package:get/get.dart';

import '../../../core/components/appbar/app_bar.dart';
import '../../../core/constants/app/app_constants.dart';
import '../../../core/network/vexana_manager.dart';
import '../service/addjob_service.dart';
import '../viewmodel/addjob_view_model.dart';

class AddjobView extends StatelessWidget {
  AddjobView({Key? key}) : super(key: key);
  final ctrl = Get.put(
      AddjobViewModel(AddjobService(VexanaManager.instance.networkManager)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar('İş Ekle'),
      body: getObservableBody(context),
    );
  }

  getObservableBody(BuildContext context) {
    return Obx(() =>
        ctrl.isLoading.value ? buildCenterLoading() : buildColumnBody(context));
  }

  buildCenterLoading() => Center(
        child: CircularProgressIndicator.adaptive(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          backgroundColor: Colors.grey,
        ),
      );

  buildColumnBody(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width * 0.95,
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            buildFormBuilder(context),
            saveButton(context),
          ],
        ),
      ),
    );
  }

  ElevatedButton saveButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        onPrimary: Colors.white,
        primary: AppColors.APP_BLUE,
        padding: context.paddingLow,
        minimumSize: Size(Get.width * 0.85, 50),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50))),
      ),
      child: Obx(() => ctrl.isLoading.value
          ? Icon(Icons.watch_later_outlined)
          : Text('Kaydet')),
    );
  }

  Future<DateTime?> picked(BuildContext context) => showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100));

  buildFormBuilder(BuildContext context) {
    var jobDate =
        '${ctrl.jobStartDate.value.day}/${ctrl.jobStartDate.value.month}/${ctrl.jobStartDate.value.year}';
    var selectStartCalendarDate = Padding(
      padding: context.paddingNormal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('İş Tarihi:'),
          TextButton(
            onPressed: () async {
              final date = await picked(context);
              if (date == null) return;
              ctrl.jobStartDate.value = date;
            },
            child: Text(
              jobDate,
              style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                  fontSize: 20),
            ),
          ),
        ],
      ),
    );
    return Column(
      children: [
        selectBranch(context),
        Padding(
          padding: context.paddingNormal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Location From:'),
              SizedBox(
                width: Get.width * 0.6,
                child: TextField(
                  controller: ctrl.descriptionController,
                  // keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    isDense: true,
                    filled: true,
                    fillColor: Color.fromARGB(157, 222, 222, 222),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: context.paddingNormal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Location To:'),
              SizedBox(
                width: Get.width * 0.6,
                child: TextField(
                  controller: ctrl.descriptionController,
                  // keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    isDense: true,
                    filled: true,
                    fillColor: Color.fromARGB(157, 222, 222, 222),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        // Padding(
        //   padding: context.paddingNormal,
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Text('Fiyat:'),
        //       SizedBox(
        //         width: Get.width * 0.6,
        //         child: TextField(
        //           controller: ctrl.descriptionController,
        //           keyboardType: TextInputType.number,
        //           maxLines: null,
        //           decoration: InputDecoration(
        //             isDense: true,
        //             filled: true,
        //             fillColor: Color.fromARGB(157, 222, 222, 222),
        //             border: OutlineInputBorder(
        //               borderRadius: BorderRadius.all(Radius.circular(5.0)),
        //             ),
        //           ),
        //         ),
        //       )
        //     ],
        //   ),
        // ),
        //selectType(context),
        selectStartCalendarDate,
        selectHours(context),
        // Obx((() => ctrl.selectedJobType.value == 'Saatlik İş'
        //     ? SizedBox()
        //     : selectCalendarDay(context))),
        // Obx((() => ctrl.selectedJobType.value == 'Günlük İş'
        //     ? SizedBox()
        //     : selectHours(context))),
        enterDescription(context),
      ],
    );
  }

  Column selectHours(BuildContext context) {
    return Column(
      children: [
        selectStartHour(context),
        //selectFinishHour(context),
      ],
    );
  }

  Padding selectCalendarDay(BuildContext context) {
    return Padding(
      padding: context.paddingNormal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('İş Gün Sayısı:'),
          DropdownButton<int>(
              hint: Obx(() => ctrl.selectedDay.value != ''
                  ? Text(ctrl.selectedDay.value.toString())
                  : Text('')),
              items: ctrl.daylist.map((e) {
                return DropdownMenuItem<int>(
                  value: e,
                  child: Text(e.toString()),
                );
              }).toList(),
              onChanged: (day) {
                ctrl.selectedJobDay = day;
                ctrl.selectedDay.value = day ?? 0;
              })
        ],
      ),
    );
  }

  Padding selectFinishHour(BuildContext context) {
    return Padding(
      padding: context.paddingNormal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Bitiş Saati:'),
          DropdownButton<String>(
              hint: Obx(() => ctrl.selectedFHour.value != ''
                  ? Text(ctrl.selectedFHour.value)
                  : Text('')),
              items: ctrl.hourList.map((e) {
                return DropdownMenuItem<String>(
                  value: e,
                  child: Text(e),
                );
              }).toList(),
              onChanged: (hour) {
                ctrl.selectedFinishHour = hour;
                ctrl.selectedFHour.value = hour ?? 'izin ismi yok';
              })
        ],
      ),
    );
  }

  Padding selectStartHour(BuildContext context) {
    return Padding(
      padding: context.paddingNormal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Başlangıç Saati:'),
          DropdownButton<String>(
              hint: Obx(() => ctrl.selectedSHour.value != ''
                  ? Text(ctrl.selectedSHour.value)
                  : Text('')),
              items: ctrl.hourList.map((e) {
                return DropdownMenuItem<String>(
                  value: e,
                  child: Text(e),
                );
              }).toList(),
              onChanged: (hour) {
                ctrl.selectedStartHour = hour;
                ctrl.selectedSHour.value = hour ?? 'izin ismi yok';
              })
        ],
      ),
    );
  }

  Padding enterDescription(BuildContext context) {
    return Padding(
      padding: context.paddingNormal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('İş Açıklama:'),
          SizedBox(
            width: Get.width * 0.6,
            height: Get.height * 0.2,
            child: TextField(
              minLines: 5,
              controller: ctrl.descriptionController,
              // keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                isDense: true,
                filled: true,
                fillColor: Color.fromARGB(157, 222, 222, 222),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding selectType(BuildContext context) {
    return Padding(
      padding: context.paddingNormal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('İş Türü:'),
          DropdownButton<String>(
              hint: Obx(() => ctrl.selectedJobType.value != ''
                  ? Text(ctrl.selectedJobType.value)
                  : Text('')),
              items: ctrl.typeList.map((e) {
                return DropdownMenuItem<String>(
                  value: e,
                  child: Text(e),
                );
              }).toList(),
              onChanged: (type) {
                ctrl.selectedType = type;
                ctrl.selectedJobType.value = type ?? 'izin ismi yok';
              })
        ],
      ),
    );
  }

  Padding selectBranch(BuildContext context) {
    return Padding(
      padding: context.paddingNormal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('İş Adı:'),
          SizedBox(
            width: Get.width * 0.6,
            child: TextField(
              controller: ctrl.descriptionController,
              // keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                isDense: true,
                filled: true,
                fillColor: Color.fromARGB(157, 222, 222, 222),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
