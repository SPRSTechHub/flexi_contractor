import 'package:get/get.dart';

import '../models/rqudata.dart';

class CartController extends GetxController {
  var _item = {}.obs;

  void addProduct(RqForm item) {
    if (_item.containsKey(item)) {
      _item[item] += 1;
    } else {
      _item[item] = 1;
    }

    Get.snackbar('added', "Item : ${item.itemName}",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2));
  }

  void removeProduct(RqForm item) {
    if (_item.containsKey(item) && _item[item] == 1) {
      _item.removeWhere((key, value) => key == item);
    } else {
      _item[item] -= 1;
    }

    Get.snackbar('added', "Item : ${item.itemName}",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2));
  }

  get itemsAll => _item;

  get ItemTotal => itemsAll.length > 0
      ? _item.entries
          .map((item) => item.value)
          .toList()
          .reduce((value, element) => value + element)
          .toString()
      : 0;
  /* get ItemTotal => _item.entries
      .map((item) => item.value)
      .toList()
      .reduce((value, element) => value + element)
      .toString(); */
}
