import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_simple/core/components/bottomnav/bottomnavigation.dart';
import 'package:flutter_template_simple/core/components/dialog/get_dialog_description.dart';
import 'package:flutter_template_simple/core/network/vexana_manager.dart';
import 'package:flutter_template_simple/view/addjob/view/addjob_view.dart';
import 'package:flutter_template_simple/view/home/model/home_model.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../jobdetail/view/jobdetail_view.dart';
import '../service/home_service.dart';
import '../viewmodel/home_view_model.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final ctrl = Get.put(
      HomeViewModel(HomeService(VexanaManager.instance.networkManager)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: getBottomNavigation(),
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text('Yapılacak İşler'),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(AddjobView());
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: getObservableBody(context),
    );
  }

  getObservableBody(BuildContext context) {
    return Obx(
        () => ctrl.isLoading.value ? buildCenterLoading() : buildListBuilder());
  }

  buildCenterLoading() => Center(
        child: CircularProgressIndicator.adaptive(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          backgroundColor: Colors.grey,
        ),
      );

  buildListBuilder() {
    var refreshKey = GlobalKey<RefreshIndicatorState>();
    var now = DateTime(2020, 7);

    // Getting the total number of days of the month
    var totalDays = ctrl.daysInMonth(now);

    // Stroing all the dates till the last date
    // since we have found the last date using generate
    var listOfDates = new List<int>.generate(totalDays, (i) => i + 1);
    return Container(
        // if there is another thing above or below list yo should make this expanded to fit .
        alignment: Alignment.center,
        height: Get.height,
        color: Colors.grey,
        child: listOfDates.isEmpty
            ? RefreshIndicator(
                onRefresh: () async {
                  await ctrl.getHomeItems();
                },
                child: Stack(
                  children: <Widget>[
                    ListView(),
                    Center(
                      child: Text(
                        'no title',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              )
            : RefreshIndicator(
                key: refreshKey,
                onRefresh: () async {
                  await ctrl.getHomeItems();
                },
                child: Scrollbar(
                  interactive: true,
                  isAlwaysShown: true,
                  radius: Radius.circular(50),
                  thickness: Get.width * 0.02,
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: listOfDates.length,
                      itemBuilder: (context, index) {
                        return getCardListWidget(context, index);
                      }),
                ),
              ));
  }

  Widget getCardListWidget(BuildContext context, int index) {
    var now = DateTime(2020, 7);

    // Getting the total number of days of the month
    var totalDays = ctrl.daysInMonth(now);

    // Stroing all the dates till the last date
    // since we have found the last date using generate
    var listOfDates = new List<int>.generate(totalDays, (i) => i + 1);
    print(listOfDates);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Get.width * 0.01, vertical: Get.height * 0.005),
      child: ExpansionTile(
        subtitle: ctrl.jobdays.contains(listOfDates[index])
            ? Text('iş var')
            : Text(''),
        collapsedBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
        childrenPadding: EdgeInsets.only(left: Get.width * 0.1),
        children: ctrl.joblist.value.map<Widget>((job) {
          if (DateTime.parse(job.jobStartDate!).day == listOfDates[index]) {
            return Container(child: _getBody(job));
          } else {
            return SizedBox();
          }
        }).toList(),
        title: AutoSizeText(
          listOfDates[index].toString() +
              '/' +
              DateTime.now().month.toString() +
              '/' +
              DateTime.now().year.toString(),
          style: TextStyle(
              color: ctrl.jobdays.contains(listOfDates[index])
                  ? Colors.blue
                  : Colors.black),
        ),
      ),
    );
    // return Column(children: [
    //   Card(
    //     child: Column(
    //       children: <Widget>[
    //         ListTile(
    //           onTap: () async {
    //             //Get.to(SomeView());
    //           },
    //           leading: Icon(
    //             Icons.wb_sunny,
    //             color: Colors.blue,
    //           ),
    //           title: AutoSizeText(
    //             listOfDates[index].toString() +
    //                 '/' +
    //                 DateTime.now().month.toString() +
    //                 '/' +
    //                 DateTime.now().year.toString(),
    //             maxLines: 2,
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    //   Divider(),
    //   Column(
    //       children: ctrl.joblist.value
    //           .map<Widget>((job) => Container(child: _getBody(job)))
    //           .toList())
    // ]);
  }

  _getBody(HomeModel e) {
    return Card(
      color: const Color.fromARGB(31, 165, 165, 165),
      child: Column(
        children: <Widget>[
          ListTile(
            onTap: () async {
              getDialogDescription(e);
              // Get.to(JobDetailView(job: e));
            },
            leading: Icon(
              Icons.wb_sunny,
              color: Colors.blue,
            ),
            title: AutoSizeText(e.title!),
          ),
        ],
      ),
    );
  }
}
