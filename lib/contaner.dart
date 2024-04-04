// ignore_for_file: sized_box_for_whitespace, prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_exploler/control/controler.dart';

class Costumcontainer extends StatelessWidget {
  final String text;
  final String amount;
  final IconData icon;
  

  const Costumcontainer({
    super.key,
    required this.text,
    required this.amount,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    var controler = Get.put(Control());
    return Container(
      height: 130,
      width: 110,
      decoration: BoxDecoration(
          color: controler.boxclr, borderRadius: BorderRadius.circular(20)),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: controler.iconclr,
            ),
            Text(
              text.toString(),
              style: TextStyle(color: controler.textclr),
            ),
            Text(amount.toString(), style: TextStyle(color: controler.textclr)),
          ]),
    );
  }
}
