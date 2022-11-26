import 'package:flexi_contractor/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppStyles.backgrounds,
        height: Get.height,
        width: Get.width,
        child: Stack(children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: 390,
              height: 546,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/login_img_1.png'),
                    fit: BoxFit.fitWidth),
              ),
            ),
          ),
          const Positioned(
            top: 487,
            left: 48,
            child: Text(
              'Login',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'Inter',
                  fontSize: 20,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1),
            ),
          ),
          const Positioned(
              top: 650,
              left: 243,
              child: Text(
                'Forget Password!',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(0, 209, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 12,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
          Positioned(
            top: 520,
            left: 48,
            child: Container(
              width: 295,
              height: 51,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                color: Color.fromRGBO(255, 255, 255, 0.15000000596046448),
              ),
            ),
          ),
          Positioned(
              top: 580,
              left: 48,
              child: Container(
                  width: 295,
                  height: 51,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                    color: Color.fromRGBO(255, 255, 255, 0.15000000596046448),
                  ))),
          Positioned(
            top: 681,
            left: 86,
            child: Container(
              width: 229,
              height: 42,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                  bottomLeft: Radius.circular(18),
                  bottomRight: Radius.circular(18),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.25),
                      offset: Offset(0, 4),
                      blurRadius: 4)
                ],
                color: Color.fromRGBO(65, 17, 1, 1),
              ),
            ),
          ),
          const Positioned(
            top: 690,
            left: 152,
            child: Text(
              'Continue',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'Inter',
                  fontSize: 20,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1),
            ),
          ),
        ]),
      ),
    );
  }
}
