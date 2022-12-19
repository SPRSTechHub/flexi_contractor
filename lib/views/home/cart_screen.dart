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
        height: 480,
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
    return Container(
      height: 62,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        color: Color.fromARGB(19, 255, 255, 255),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.itemName,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Inter',
                      fontSize: 14,
                      letterSpacing: 0,
                      fontWeight: FontWeight.bold,
                      height: 1),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Badge(itemS: item.itemSize ?? "xxxx"),
                    Badge(itemS: item.itemType ?? "xxxx"),
                    //Text(item.itemType),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 16,
          ),
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

class Badge extends StatelessWidget {
  String? itemS;
  Badge({
    Key? key,
    required this.itemS,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              offset: Offset(1, 3),
              blurRadius: 3),
        ],
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(138, 255, 235, 55),
              Color.fromARGB(156, 255, 47, 0)
            ]),
        //color: Color.fromRGBO(217, 217, 217, 0.11),
      ),
      child: Center(
        child: Text(
          itemS.toString(),
          style: const TextStyle(
              color: Colors.white, fontFamily: 'Inter', fontSize: 10),
        ),
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
