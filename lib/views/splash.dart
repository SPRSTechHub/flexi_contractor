import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flexi_contractor/constants/constants.dart';
import 'package:flexi_contractor/views/auth/login.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import '../constants/constants.dart';
import 'auth/permissions.dart';
import 'components/push.dart';
import 'const/constant.dart';
import 'home/requisitions.dart';

class Splash extends StatefulWidget {
  const Splash({super.key, required this.title});
  final String title;

  @override
  State<Splash> createState() => SplashState();
}

class SplashState extends State<Splash> {
  late bool _isVisible = false;

  @override
  void initState() {
    super.initState();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      //print('Got a message whilst in the foreground!');
      //print('Message data: ${message.data}');

      if (message.notification != null) {
        //print('Message also contained a notification: ${message.notification}');
      }
    });

    LocalNotificationService.initialize(context);
    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        print("FirebaseMessaging.instance.getInitialMessage");
        if (message != null) {
          //  print("New Notification");
          // if (message.data['_id'] != null) {
          //   Navigator.of(context).push(
          //     MaterialPageRoute(
          //       builder: (context) => DemoScreen(
          //         id: message.data['_id'],
          //       ),
          //     ),
          //   );
          // }
        }
      },
    );
    FirebaseMessaging.onMessage.listen(
      (message) {
        print("FirebaseMessaging.onMessage.listen");
        if (message.notification != null) {
          /*   print(message.notification!.title);
          print(message.notification!.body);
          print("message.data11 ${message.data}"); */
          LocalNotificationService.createanddisplaynotification(message);
        }
      },
    );
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        print("FirebaseMessaging.onMessageOpenedApp.listen");
        if (message.notification != null) {
          //  print(message.notification!.title);
//print(message.notification!.body);
          //   print("message.data22 ${message.data['_id']}");
        }
      },
    );

    /*    Timer(const Duration(milliseconds: 1000), () {
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => const LoginScreen()), //Requisitions()),
            (route) => false);
      });
    });
    Timer(const Duration(milliseconds: 100), () {
      setState(() {
        _isVisible = true;
      });
    }); */
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: AppColors.gradientBackground,
          begin: const FractionalOffset(0, 0),
          end: const FractionalOffset(1.0, 0.0),
          stops: const [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: AnimatedOpacity(
        opacity: _isVisible ? 1.0 : 0,
        duration: const Duration(milliseconds: 1200),
        child: Center(
          child: Container(
            height: 140.0,
            width: 140.0,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 1.0,
                    offset: const Offset(5.0, 3.0),
                    spreadRadius: 2.0,
                  )
                ]),
            child: const Center(
              child: ClipOval(
                child: Image(
                    image: AssetImage('assets/icon/icon.png'),
                    fit: BoxFit.fill),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
