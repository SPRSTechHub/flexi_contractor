import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flexi_contractor/constants/constants.dart';
import 'package:flexi_contractor/controllers/forms_ctl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/material_ctl.dart';
import '../components/navbar.dart';
import '../const/constant.dart';
import 'cart_screen.dart';

class Requisitions extends StatefulWidget {
  const Requisitions({super.key});

  @override
  State<Requisitions> createState() => _RequisitionsState();
}

class _RequisitionsState extends State<Requisitions> {
  TextEditingController name = TextEditingController();
  final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formCtl = Get.put(FormCtl());
  final CartController controller = Get.put(CartController());

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
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.bottomRight,
              colors: Constant.gradientcard1),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: Get.width * .95,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: lightBrown,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(
                      height: 10,
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
                                      style:
                                          const TextStyle(color: Colors.black),
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
                            //print(formCtl.selectedBuilding.value);
                            return SizedBox(
                              height: 50,
                              width: Get.width * .85,
                              child: DropdownButton(
                                hint: const Text("Select Building"),
                                isExpanded: true,
                                value: (formCtl.selectedBuilding.value != '')
                                    ? formCtl.selectedBuilding.value
                                    : null, //formCtl.selectedBuilding.value,
                                items: formCtl.buldingList.map((item) {
                                  return DropdownMenuItem(
                                    value: item.buildingCode,
                                    child: Text(
                                      item.buildingName.toString(),
                                      style:
                                          const TextStyle(color: Colors.black),
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
                    AddedProducts(),
                    CartTotal(),
                    Center(
                      child: TextButton(
                          onPressed: () {}, child: const Text('Submit')),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: darkBrown,
        foregroundColor: Colors.white60,
        mini: true,
        onPressed: () {
          openBottomSheet();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void openBottomSheet() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.bottomRight,
              colors: Constant.gradientcard1),
        ),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Material Lists',
                  style: AppTextStyles.kTextStyleElevenThemeColor,
                ),
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.close_sharp))
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                  scrollDirection: Axis.vertical, child: Catalouge()),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class Catalouge extends StatelessWidget {
  Catalouge({super.key});
  final formCtl = Get.put(FormCtl());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Obx(
            (() {
              if (formCtl.isDataProcessing2.value == true) {
                return const CircularProgressIndicator();
              } else {
                if (formCtl.sampleData.isNotEmpty) {
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(formCtl.sampleData[index].itemName),
                                Text(formCtl.sampleData[index].itemSize),
                                Text(formCtl.sampleData[index].itemType)
                              ],
                            )),
                            const Text('10'),
                            IconButton(
                              icon: const Icon(Icons.add_circle_outline),
                              onPressed: () {
                                print('55');
                                cartController
                                    .addProduct(formCtl.sampleData[index]);
                              },
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
    );
  }
}

/*
  floatingActionButton: FabCircularMenu(
          key: fabKey,
          alignment: Alignment.bottomRight,
          ringColor: darkBrown.withOpacity(0.3),
          ringDiameter: 200,
          ringWidth: 60,
          fabSize: 64.0,
          fabElevation: 8.0,
          fabIconBorder: const CircleBorder(),
          fabColor: darkBrown,
          fabOpenIcon: const Icon(Icons.add_home_outlined, color: Colors.white),
          fabCloseIcon: const Icon(Icons.close, color: Colors.red),
          children: <Widget>[
            RawMaterialButton(
              onPressed: () {
                fabKey.currentState?.close();
              },
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(24.0),
              child: const Icon(
                Icons.business_outlined,
                color: Colors.white,
              ),
            ),
            RawMaterialButton(
              onPressed: () {
                fabKey.currentState?.close();
              },
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(24.0),
              child: const Icon(
                Icons.shopping_cart_checkout_outlined,
                color: Colors.white,
              ),
            ),
            RawMaterialButton(
              onPressed: () {
                fabKey.currentState?.close();
                Get.to(const AddedItem());
              },
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(24.0),
              child: const Icon(
                Icons.shopping_bag_outlined,
                color: Colors.white,
              ),
            ),
          ]),
 
*/

/*
Column(
          children: [
            Obx(
              (() {
                if (formCtl.isDataProcessing2.value == true) {
                  return const CircularProgressIndicator();
                } else {
                  if (formCtl.sampleData.isNotEmpty) {
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
*/