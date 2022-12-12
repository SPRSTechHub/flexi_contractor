import 'package:flexi_contractor/models/rqudata.dart';
import 'package:flexi_contractor/models/sitedata.dart';
import 'package:get/get.dart';

import '../services/api.dart';

class FormCtl extends GetxController {
  // It is mandatory initialize with one value from listType
  var siteList = <Sitedata>[].obs;
  var buldingList = <Buildingsdata>[].obs;
  var sampleData = <RqForm>[].obs;

  late var selectedBuilding = ''.obs;
  late var selected = ''.obs;

  var isDataProcessing = false.obs;
  var isDataProcessing1 = false.obs;
  var isDataProcessing2 = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void setSelected(String value) {
    selected.value = value.toString();
    //buldingList.clear();
  }

  setSelectedBuilding(String value) {
    selectedBuilding.value = value.toString();
  }

  getBuildings(String sitecode) async {
    try {
      isDataProcessing1(true);
      var items1 =
          await RemoteApiService.fetchBuildings('get_buildings', sitecode);
      buldingList.clear();
      if (items1 != null) {
        buldingList.assignAll(items1);
        isDataProcessing1(false);
      }
    } finally {
      isDataProcessing1(false);
    }
  }

  void siteListCall(var param) async {
    try {
      isDataProcessing(true);
      var items = await RemoteApiService.fetchSiteLists('get_sites', param);
      siteList.clear();
      if (items != null) {
        isDataProcessing(false);
        siteList.assignAll(items);
      }
    } finally {
      isDataProcessing(false);
    }
  }

  void callForm(var param) async {
    try {
      isDataProcessing2(true);
      var items = await RemoteApiService.fetchForm('get_rq_form', param);
      if (items != null) {
        isDataProcessing2(false);
        sampleData.assignAll(items);
      }
    } finally {
      isDataProcessing2(false);
    }
  }

  void changeData(String newData) {
    selected.value = newData;
    update();
  }
}
