// ignore_for_file: use_function_type_syntax_for_parameters

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dropdownfield2/dropdownfield2.dart';
import 'package:flexi_contractor/controllers/forms_ctl.dart';
import 'package:flexi_contractor/models/sitedata.dart';
import 'package:flexi_contractor/views/const/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                height: 100,
              ),
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
                          hint: const Text("Select Sites"),
                          style: const TextStyle(color: Colors.white),
                          focusColor: Colors.black,
                          items: formCtl.siteList.map((selectedType) {
                            return DropdownMenuItem(
                              value: selectedType.siteCode,
                              child: Text(
                                selectedType.siteName.toString(),
                                style: const TextStyle(color: Colors.black),
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
                      print(formCtl.selectedBuilding.value);
                      return SizedBox(
                        height: 50,
                        width: Get.width * .85,
                        child: DropdownButton(
                          isExpanded: true,
                          value: (formCtl.selectedBuilding.value != '')
                              ? formCtl.selectedBuilding.value
                              : null, //formCtl.selectedBuilding.value,
                          items: formCtl.buldingList.map((item) {
                            return DropdownMenuItem(
                              value: item.buildingCode,
                              child: Text(
                                item.buildingName.toString(),
                                style: const TextStyle(color: Colors.black),
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
                      return const Text('No value');
                    }
                  }
                }),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
