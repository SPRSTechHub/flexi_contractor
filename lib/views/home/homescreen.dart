import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/iconic_icons.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:get/get.dart';
import '../../constants/constants.dart';

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

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: darkBrown,
      height: 82,
      width: Get.width,
      child: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    LineariconsFree.menu,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'DASHBOARD',
                  style: TextStyle(color: Colors.amber, fontSize: 20),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    LineariconsFree.bullhorn,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    LineariconsFree.power_swtich,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ],
            ),
          ],
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
                color: Colors.red,
                width: 4.0,
              ),
            ),
            child: ClipOval(
              child: Align(
                alignment: Alignment.topCenter,
                heightFactor: 0.5,
                child: Image.network(
                  'https://picsum.photos/seed/637/600',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const Text(
            'data',
          ),
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
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromRGBO(242, 166, 90, 1),
              Color.fromRGBO(119, 46, 25, 0.96)
            ]),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              'data',
            ),
            Text(
              'data',
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
    return Container(
      width: 160,
      height: 48,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(242, 166, 90, 1),
              Color.fromRGBO(119, 46, 25, 0.96),
            ]),
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