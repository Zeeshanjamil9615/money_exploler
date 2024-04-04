// ignore_for_file: unused_local_variable, non_constant_identifier_names, await_only_futures, unrelated_type_equality_checks, avoid_print

import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:money_exploler/model/person.dart';
// import 'package:money_exploler/model/model.dart';

class Control extends GetxController {
  var aditindes = 0.obs;
  var title1 = TextEditingController();
  var rupees = TextEditingController();

  late Box box;
  @override
  void onInit() {
    // TODO: implement onInit
    box = Hive.box('Money');

    super.onInit();
  }

  Future adddata(int amount, String title) async {
    var value = {'income': amount, 'title': title};

    box.add(value);
  }


  var Date = DateTime.now().obs;
  var title = ''.obs;
  List month = [
    'Jan',
    'Feb',
    'Mar',
    'April',
    'May',
    'June',
    'July',
    ' Aug',
    'Sep',
    'OCT',
    'Nov',
    'Dem'
  ];

  slectdate(BuildContext context) async {
    final DateTime? picker = await showDatePicker(
        context: context,
        initialDate: Date.value,
        firstDate: DateTime(2020, 12),
        lastDate: DateTime(2100, 01));
    if (picker != null && picker != Date) {
      Date.value = picker;
    }
  }

  var Income = 0.obs;
  var epence_amount = 0.obs;
  var Romaning_amount = 0.obs;
  var boxclr = Colors.blue;
  var textclr = Colors.white;
  var iconclr = Colors.white;
  totoadd(title_amount, amount) {
    var value4 = Person(title_amount, amount);
    box.add(value4);
    print('data adit');
  }

  del(index) {
    box.deleteAt(index);
  }

  updatedata(int index, String title, int amount) {
    var data = box.getAt(index);
    if (data != null) {
      // Update the values
      data.name = title;
      data.age = amount;
      // Put the updated data back into the box
      box.putAt(index, data);
    }
  }
}
