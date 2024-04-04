// ignore_for_file: prefer_const_literals_to_create_immutables, sized_box_for_whitespace, prefer_const_constructors, avoid_unnecessary_containers, unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_exploler/control/controler.dart';
import 'package:money_exploler/expence.dart';
import 'package:money_exploler/home.dart';

class Transaction extends StatelessWidget {
  const Transaction({super.key});

  @override
  Widget build(BuildContext context) {
    var controler = Get.put(Control());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Transaction'),
        centerTitle: true,
      ),
      body: Obx(
        () => Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          height: Get.height,
          width: Get.width,
          child: Column(
            children: [
              Container(
                child: TextFormField(
                  // style: TextStyle(color: Colors.blue),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    var value1 = int.parse(value);
                    controler.Income.value = value1;
                  },
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.lightBlue)),
                      labelText: 'Income',
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.lightBlue),
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {
                      // controler.slectdate(context);
                    },
                    child: Text(
                      'Date : ${controler.Date.value.day}, ${controler.month[controler.Date.value.month - 1]}',
                      style: TextStyle(color: Colors.blue),
                    ),
                  )),
              Container(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                        onPressed: () {
                          Get.to(Home());
                        },
                        child: Text('Add income',
                            style: TextStyle(color: Colors.white))),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                        onPressed: () {
                          Get.to(Expence());
                        },
                        child: Text(
                          'ADD Expence',
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
