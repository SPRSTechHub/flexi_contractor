// ignore_for_file: use_function_type_syntax_for_parameters

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dropdownfield2/dropdownfield2.dart';
import 'package:flexi_contractor/controllers/forms_ctl.dart';
import 'package:flexi_contractor/models/sitedata.dart';
import 'package:flexi_contractor/views/const/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constants.dart';
import '../components/navbar.dart';

class Requisitions extends StatefulWidget {
  const Requisitions({super.key});

  @override
  State<Requisitions> createState() => _RequisitionsState();
}

class _RequisitionsState extends State<Requisitions> {
  TextEditingController? textController1;
  TextEditingController? textController2;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late bool passwordVisibility;

  final formCtl = Get.put(FormCtl());

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    passwordVisibility = false;
    formCtl.siteListCall('demo1');
  }

  @override
  void dispose() {
    textController1?.dispose();
    textController2?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: Navbar(),
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: AppStyles.backgrounds,
        height: Get.height,
        width: Get.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                height: 100,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                height: 700,
                width: Get.width * .95,
                decoration: BoxDecoration(
                  color: Constant.background,
                  borderRadius: const BorderRadius.all(Radius.circular(18.0)),
                  border: Border.all(
                    color: Colors.white60,
                    width: 0.4,
                  ),
                ), //Constant.background,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Obx(
                      (() {
                        if (formCtl.isDataProcessing.value == true) {
                          return const CircularProgressIndicator();
                        } else {
                          if (formCtl.siteList.isNotEmpty) {
                            return SizedBox(
                              height: 50,
                              width: Get.width * .85,
                              child: DropdownButton(
                                isExpanded: true,
                                hint: Text("Select Sites",
                                    style: Constant.cardbuttontext),
                                style: const TextStyle(color: Colors.white),
                                focusColor: Colors.black,
                                items: formCtl.siteList.map((selectedType) {
                                  return DropdownMenuItem(
                                    value: selectedType.siteCode,
                                    child: Text(
                                      selectedType.siteName.toString(),
                                      style: Constant.dropdowntext,
                                    ),
                                  );
                                }).toList(),
                                value: (formCtl.selected.value != '')
                                    ? formCtl.selected.value
                                    : null,
                                onChanged: (newValue) {
                                  setState(() {
                                    formCtl.getBuildings(newValue!);
                                    formCtl.setSelected(newValue.toString());
                                    formCtl.setSelectedBuilding('');
                                  });
                                },
                              ),
                            );
                          } else {
                            return const Text('No value');
                          }
                        }
                      }),
                    ),
                    const SizedBox(height: 10),
                    Obx(
                      (() {
                        if (formCtl.isDataProcessing1.value == true) {
                          return const CircularProgressIndicator();
                        } else {
                          if (formCtl.buldingList.isNotEmpty) {
                            return SizedBox(
                              height: 50,
                              width: Get.width * .85,
                              child: DropdownButton(
                                hint: Text("Select Buildings",
                                    style: Constant.cardbuttontext),
                                style: const TextStyle(color: Colors.white),
                                isExpanded: true,
                                value: (formCtl.selectedBuilding.value != '')
                                    ? formCtl.selectedBuilding.value
                                    : null,
                                items: formCtl.buldingList.map((item) {
                                  return DropdownMenuItem(
                                    value: item.buildingCode,
                                    child: Text(
                                      item.buildingName.toString(),
                                      style: Constant.dropdowntext,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    formCtl.setSelectedBuilding(value!);
                                  });
                                },
                              ),
                            );
                          } else {
                            return Text('No value',
                                style: Constant.cardbuttontext);
                          }
                        }
                      }),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Meterial Items",
                        style: Constant.dropdowntext,
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
