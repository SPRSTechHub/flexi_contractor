import 'dart:convert';

import 'package:get/get.dart';

import '../models/rqudata.dart';
import '../services/api.dart';
import '../views/const/constant.dart';

class CartController extends GetxController {
  var _item = {}.obs;

  void addProduct(RqForm item) {
    if (_item.containsKey(item)) {
      _item[item] += 1;
    } else {
      _item[item] = 1;
    }

    Get.snackbar('added', "Item : ${item.itemName}",
        snackPosition: SnackPosition.TOP, duration: const Duration(seconds: 1));
  }

  void removeProduct(RqForm item) {
    if (_item.containsKey(item) && _item[item] == 1) {
      _item.removeWhere((key, value) => key == item);
    } else {
      _item[item] -= 1;
    }

    /*  Get.snackbar('added', "Item : ${item.itemName}",
        snackPosition: SnackPosition.TOP, duration: const Duration(seconds: 1)); */
  }

  get itemsAll => _item;

  get ItemTotal => itemsAll.length > 0
      ? _item.entries
          .map((item) => item.value)
          .toList()
          .reduce((value, element) => value + element)
          .toString()
      : 0;

  void formSubmit() async {
    if (itemsAll.length > 0) {
      var cartData = _item.entries.map((item) {
        return {
          "site_code": Constant.box.read('site_code'),
          "building_code": Constant.box.read('building_code'),
          "itemTitle": item.key.itemName,
          "itemCode": item.key.itemCode,
          "itemQty": item.value,
        };
      }).toList();
      String stringstudents = json.encode(cartData);
      Get.snackbar('Alert', "Data stored successfully!",
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 1));
      //print(stringstudents);
      if (stringstudents != null) {
        //print(stringstudents);
        await RemoteApiService.submitRequisitionForm(stringstudents);
      }
    } else {
      Get.snackbar('Alert', "No Items selected!",
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 1));
    }
  }
  /* get ItemTotal => _item.entries
      .map((item) => item.value)
      .toList()
      .reduce((value, element) => value + element)
      .toString(); */
}
