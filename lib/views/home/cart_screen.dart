import 'package:flexi_contractor/constants/constants.dart';
import 'package:flexi_contractor/controllers/material_ctl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/rqudata.dart';
import '../components/navbar.dart';
import '../const/constant.dart';

class AddedItem extends StatefulWidget {
  const AddedItem({super.key});

  @override
  State<AddedItem> createState() => _AddedItemState();
}

class _AddedItemState extends State<AddedItem> {
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
        child: Column(
          children: [
            AddedProducts(),
            CartTotal(),
          ],
        ),
      ),
    );
  }
}

class AddedProducts extends StatelessWidget {
  final CartController controller = Get.find();
  AddedProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 600,
        child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: controller.itemsAll.length,
            itemBuilder: (BuildContext context, int index) {
              return CartItemCard(
                  controller: controller,
                  index: index,
                  item: controller.itemsAll.keys.toList()[index],
                  quantity: controller.itemsAll.values.toList()[index]);
            }),
      ),
    );
  }
}

class CartItemCard extends StatelessWidget {
  final CartController controller;
  final RqForm item;
  final int quantity;
  final int index;

  const CartItemCard(
      {super.key,
      required this.controller,
      required this.item,
      required this.quantity,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Row(
        children: [
          Expanded(child: Text(item.itemName)),
          IconButton(
            onPressed: (() {
              controller.removeProduct(item);
            }),
            icon: const Icon(Icons.remove_circle_outline),
          ),
          Text('$quantity'),
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed: () {
              print('55');
              controller.addProduct(item);
            },
          ),
        ],
      ),
    );
  }
}

class CartTotal extends StatelessWidget {
  final CartController controller = Get.find();

  CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Total: ', style: AppTextStyles.kTextStyleElevenThemeColor),
            Text('${controller.ItemTotal}',
                style: AppTextStyles.kTextStyleElevenThemeColor),
            /* if (controller.itemsAll.length > 0)
              {
                
              }
            else
              {
                Text('0', style: AppTextStyles.kTextStyleElevenThemeColor),
              } */
          ],
        ),
      ),
    );
  }
}
