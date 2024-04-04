// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_exploler/contaner.dart';
import 'package:money_exploler/control/controler.dart';
import 'package:money_exploler/transaction.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var controler = Get.put(Control());

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Get.to(Transaction());
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        title: Text('Overview'),
        actions: [],
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Costumcontainer(
                    text: 'Total Salary', amount: '200', icon: Icons.wallet),
                Costumcontainer(
                    text: 'Total Expense', amount: '100', icon: Icons.wallet),
                Costumcontainer(
                    text: 'Romaning', amount: '50', icon: Icons.wallet),
              ],
            ),
            // Expanded(
            //     child: Container(
            //   child: FutureBuilder(
            //       future: controler.fetchdata(),
            //       builder: (context, snapshot) {
            //         if (snapshot.data == null) {
            //           return CircularProgressIndicator();
            //         } else {
            //           return Container();
            //         }
            //       }),
            // ))
          ],
        ),
      ),
    );
  }
}
