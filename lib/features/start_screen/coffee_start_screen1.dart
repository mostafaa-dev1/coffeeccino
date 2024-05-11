import 'dart:async';

import 'package:cofee_project/core/themes/colors.dart';
import 'package:cofee_project/features/home/home_page.dart';
import 'package:cofee_project/features/main_screen/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

import '../login/cofee_login.dart';

class CoffeeStartScreen1 extends StatefulWidget {
  @override
  State<CoffeeStartScreen1> createState() => _CoffeeStartScreen1State();
}

class _CoffeeStartScreen1State extends State<CoffeeStartScreen1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loged();
  }

  void loged() {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.push(context,
          PageTransition(child: MainPage(), type: PageTransitionType.fade));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                Lottie.asset('lib/assets/images/onboard/coffee.json',
                    height: 300),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Coffeeccino',
                  style: GoogleFonts.satisfy(
                    color: AppColors.mainColor,
                    fontSize: 60,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
