import 'package:flexi_contractor/views/home/test.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/constants.dart';
import '../components/navbar.dart';
import '../const/constant.dart';
import 'requisitions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: Navbar(),
      ),
      body: Container(
        decoration: AppStyles.backgrounds,
        height: Get.height,
        width: Get.width,
        child: SingleChildScrollView(
          child: Column(
            children: const [
              Greetings(),
              SizedBox(
                height: 10,
              ),
              DashCard(),
              SizedBox(
                height: 10,
              ),
              CardButtons(),
              SizedBox(
                height: 10,
              ),
              CardNotice(),
              SizedBox(
                height: 10,
              ),
              Ads()
            ],
          ),
        ),
      ),
    );
  }
}

class Greetings extends StatelessWidget {
  const Greetings({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * .9,
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 96,
            height: 96,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(50.0)),
              border: Border.all(
                color: Colors.brown,
                width: 3.0,
              ),
            ),
            child: ClipOval(
              child: Align(
                alignment: Alignment.topCenter,
                heightFactor: 0.5,
                child: Image.network(
                  'https://picsum.photos/200/200',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('Good Evening,', style: Constant.greetings1),
              Text('Mr. XYZ', style: Constant.greetings2),
            ],
          )
        ],
      ),
    );
  }
}

class DashCard extends StatelessWidget {
  const DashCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * .9,
      height: 118,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: Constant.gradientcard1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('15', style: Constant.greetings1
//                  style: TextStyle(color: Colors.black87, fontSize: 30),
                    ),
                const Text(
                  'Site Covered',
                ),
              ],
            ),
            const VerticalDivider(color: Colors.white54, thickness: 1),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  '15',
                  style: TextStyle(color: Colors.black87, fontSize: 30),
                ),
                Text(
                  'Site Claimed',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CardButtons extends StatelessWidget {
  const CardButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * .9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Buttonshape(
                icons: const Icon(
                  Icons.add_shopping_cart_outlined,
                  color: Colors.white,
                ),
                title: 'Requisitions',
                onPressed: () {
                  print('object1');
                  Get.to(const RequisitionsT());
                },
              ),
              Buttonshape(
                icons: const Icon(
                  Icons.featured_play_list_outlined,
                  color: Colors.white,
                ),
                title: 'Requisitions',
                onPressed: () {
                  print('object2');
                  Get.to(const Requisitions());
                },
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Buttonshape(
                icons: const Icon(
                  Icons.stacked_bar_chart,
                  color: Colors.white,
                ),
                title: 'My Stocks',
                onPressed: () {
                  print('object3');
                },
              ),
              Buttonshape(
                icons: const Icon(
                  Icons.business_outlined,
                  color: Colors.white,
                ),
                title: 'My Sites',
                onPressed: () {
                  print('object4');
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}

class Buttonshape extends StatelessWidget {
  const Buttonshape(
      {super.key,
      required this.onPressed,
      required this.title,
      required this.icons});

  final Icon? icons;
  final String? title;
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 160,
        height: 48,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(242, 166, 90, 1),
                Color.fromRGBO(119, 46, 25, 0.96),
              ]),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: icons,
            ),
            Text(title.toString(), style: Constant.cardbuttontext)
          ],
        ),
      ),
    );
  }
}

class CardNotice extends StatelessWidget {
  const CardNotice({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width * .9,
        height: 350,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(242, 166, 90, 1),
                Color.fromRGBO(119, 46, 25, 0.26),
              ]),
        ));
  }
}

class Ads extends StatelessWidget {
  const Ads({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.redAccent,
    );
  }
}



/* .... */