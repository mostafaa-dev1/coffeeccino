import 'package:cofee_project/features/chekout/check_out.dart';
import 'package:cofee_project/core/logic/states.dart';
import 'package:cofee_project/core/themes/colors.dart';
import 'package:cofee_project/core/themes/fonts.dart';
import 'package:cofee_project/features/chekout/widgets/pay_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../../core/logic/cubit.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black45,
        title: Text(
          'Cart',
          style: AppFonts.appBarTitle,
        ),
      ),
      backgroundColor: Colors.black45,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemBuilder: (context, index) => item(context), itemCount: 1),
          ),
          PAyButton(
              text: 'Total',
              price: '20.00',
              buttonName: 'Pay',
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: CheckOut(),
                        type: PageTransitionType.rightToLeft));
              })
        ],
      ),
    );
  }
}

Widget item(context) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        Container(
          height: 200,
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(stops: [
                0.6,
                1
              ], colors: [
                AppColors.backgroundColor1,
                AppColors.backgroundColor2
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: const Image(
                    image: AssetImage(
                      'lib/assets/images/image12.jpg',
                    ),
                    fit: BoxFit.fill,
                    height: 100,
                    width: 120,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Cappuccino', style: AppFonts.style22),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'With Almond milk',
                      style: AppFonts.style15,
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 35,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'M',
                      style: AppFonts.style18w,
                    ),
                  ),
                ),
                Text.rich(
                  TextSpan(children: [
                    TextSpan(text: '\$ ', style: AppFonts.style18color),
                    TextSpan(text: '20.00', style: AppFonts.style18w)
                  ]),
                ),
                Row(
                  children: [
                    CoffeeCubit.get(context).counter <= 1
                        ? Container(
                            height: 35,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.white12,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Icon(
                              CupertinoIcons.minus,
                              size: 20,
                              color: Colors.white,
                            ))
                        : Container(
                            height: 35,
                            width: 50,
                            decoration: BoxDecoration(
                                color: AppColors.mainColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: IconButton(
                                onPressed: () {
                                  CoffeeCubit.get(context).Mini();
                                },
                                icon: const Icon(
                                  CupertinoIcons.minus,
                                  color: Colors.white,
                                )),
                          ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${CoffeeCubit.get(context).counter}',
                      style: GoogleFonts.lilitaOne(
                          fontSize: 20, color: Colors.white),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        CoffeeCubit.get(context).Add();
                      },
                      child: Container(
                          height: 35,
                          width: 50,
                          decoration: BoxDecoration(
                              color: AppColors.mainColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Icon(
                            CupertinoIcons.plus,
                            size: 20,
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ]),
        )
      ]),
    );
