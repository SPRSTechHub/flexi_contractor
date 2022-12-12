import 'dart:convert';

import 'package:flexi_contractor/controllers/forms_ctl.dart';
import 'package:flexi_contractor/services/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/navbar.dart';
import '../const/constant.dart';

class Requisitions extends StatefulWidget {
  const Requisitions({super.key});

  @override
  State<Requisitions> createState() => _RequisitionsState();
}

class _RequisitionsState extends State<Requisitions> {
  TextEditingController name = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  // add dynamic fields
  final formCtl = Get.put(FormCtl());

  @override
  void initState() {
    super.initState();
    formCtl.siteListCall('demo1');
    formCtl.callForm('FLXCTSK1');
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: Navbar(),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Obx(
              (() {
                if (formCtl.isDataProcessing2.value == true) {
                  return const CircularProgressIndicator();
                } else {
                  if (formCtl.sampleData.isNotEmpty) {
                    //print(formCtl.sampleData.value.toString());
                    return ListView.builder(
                      itemCount: formCtl.sampleData.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (ctx, int index) => Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(30.0),
                            ),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: Constant.gradientcard1),
                          ),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(formCtl.sampleData[index].itemName),
                                  Text(formCtl.sampleData[index].itemSize),
                                  Text(formCtl.sampleData[index].itemType)
                                ],
                              )),
                              IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return const Text('No value');
                  }
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
