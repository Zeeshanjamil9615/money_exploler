// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, unnecessary_cast, unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
// import 'package:hive/hive.dart';
import 'package:money_exploler/control/controler.dart';
// import 'package:money_exploler/home.dart';

// import 'package:get/get_core/src/get_main.dart';
class Expence extends StatelessWidget {
  const Expence({super.key});

  @override
  Widget build(BuildContext context) {
    var controler = Get.put(Control());
    // final box = Hive.box('Money');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Expence'),
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            height: Get.height,
            width: Get.width,
            child: Column(
              children: [
                Container(
                  child: TextFormField(
                    controller: controler.title1,
                    // style: TextStyle(color: Colors.blue),
                    keyboardType: TextInputType.name,
                    onChanged: (value) {
                      controler.title.value = value;
                    },
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.lightBlue)),
                        labelText: 'Income Title',
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.lightBlue),
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: TextFormField(
                    controller: controler.rupees,
                    // style: TextStyle(color: Colors.blue),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      var value2 = int.parse(value);
                      controler.epence_amount.value = value2;
                    },
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.lightBlue)),
                        labelText: 'Amount',
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
                        controler.slectdate(context);
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
                            String title = controler.title1.text;
                            int rupees =
                                int.parse(controler.rupees.text) as int;

                            controler.totoadd(title, rupees);
                            controler.title1.text = '';
                            controler.rupees.text = '';
                          },
                          child: Text('Add expence',
                              style: TextStyle(color: Colors.white))),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue),
                          onPressed: () async {
                            String title = controler.title1.text;
                            int rupees =
                                int.parse(controler.rupees.text) as int;

                            controler.updatedata(
                                controler.aditindes.value, title, rupees);

                            controler.title1.text = '';
                            controler.rupees.text = '';
                          },
                          child: Text('Update',
                              style: TextStyle(color: Colors.white))),
                    ],
                  ),
                ),
                ValueListenableBuilder(
                    valueListenable: controler.box.listenable(),
                    builder: (context, Box box, Widget) {
                      return ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: box.length,
                          itemBuilder: (context, index) {
                            var data = box.getAt(index);
                            return ListTile(
                              title: Text(data.name),
                              subtitle: Text(data.age.toString()),
                              trailing: Container(
                                width: 100,
                                child: Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          controler.del(index);
                                        },
                                        icon: Icon(Icons.delete)),
                                    IconButton(
                                        onPressed: () {
                                          controler.title1.text = data.name;
                                          controler.rupees.text =
                                              data.age.toString();
                                          controler.aditindes.value = index;
                                        },
                                        icon: Icon(Icons.edit))
                                  ],
                                ),
                              ),
                            );
                          });
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
