import 'package:cofee_project/core/themes/colors.dart';
import 'package:cofee_project/core/themes/fonts.dart';
import 'package:cofee_project/features/chekout/widgets/pay_button.dart';
import 'package:cofee_project/features/chekout/widgets/payment_options.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/logic/cubit.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black45,
        title: Text('CheckOut', style: AppFonts.appBarTitle),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(colors: [
                        AppColors.backgroundColor1,
                        AppColors.backgroundColor2
                      ])),
                  child: Row(
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Location',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                )),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(children: [
                              Icon(
                                Icons.location_on,
                                color: AppColors.mainColor,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text('Egypt/Cairo',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                  )),
                            ])
                          ]),
                      const Spacer(),
                      OutlinedButton(
                          onPressed: () {},
                          child: Text('Change',
                              style: TextStyle(
                                color: AppColors.mainColor,
                                fontSize: 15,
                              )))
                    ],
                  )),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    AppColors.backgroundColor1,
                    AppColors.backgroundColor2
                  ]),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Text(
                      'Order summary',
                      style: AppFonts.style18w,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 1,
                      width: double.infinity,
                      color: Colors.white12,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text('Items', style: AppFonts.style18w),
                        Spacer(),
                        Text.rich(
                          TextSpan(children: [
                            TextSpan(text: '\$ ', style: AppFonts.style18color),
                            TextSpan(text: '20.00', style: AppFonts.style18w)
                          ]),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text('Tax', style: AppFonts.style18w),
                        Spacer(),
                        Text.rich(
                          TextSpan(children: [
                            TextSpan(text: '\$ ', style: AppFonts.style18color),
                            TextSpan(text: '5.00', style: AppFonts.style18w)
                          ]),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text('Total', style: AppFonts.style18color),
                        Spacer(),
                        Text.rich(
                          TextSpan(children: [
                            TextSpan(text: '\$ ', style: AppFonts.style18color),
                            TextSpan(
                                text: '25.00', style: AppFonts.style18color)
                          ]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  width: double.infinity,
                  height: 110,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      AppColors.backgroundColor1,
                      AppColors.backgroundColor2,
                    ]),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Promo Code',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 50,
                                child: TextFormField(
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                    decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.all(10),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide(
                                              color: AppColors.mainColor,
                                            )),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: const BorderSide(
                                              color: Colors.white12,
                                            )),
                                        prefixIcon: Icon(
                                          Icons.card_giftcard,
                                          color: AppColors.mainColor,
                                        ))),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            OutlinedButton(
                                onPressed: () {},
                                child:
                                    Text('Apply', style: AppFonts.style15color))
                          ]),
                    ],
                  )),
              const SizedBox(
                height: 20,
              ),
              PaymentOptions(),
              const SizedBox(
                height: 20,
              ),
              PAyButton(
                  text: 'Price',
                  price: '25.00',
                  buttonName: 'Pay from card',
                  onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}

Widget item(context) =>
    Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Image(
        image: AssetImage(
          'lib/assets/images/image12.jpg',
        ),
        height: 120,
      ),
      const SizedBox(
        width: 20,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Cappuccino',
              style: GoogleFonts.lilitaOne(
                color: Colors.white,
                fontSize: 23,
              )),
          const SizedBox(
            height: 10,
          ),
          Text(
            '\$10.00',
            style: GoogleFonts.lilitaOne(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              CoffeeCubit.get(context).counter <= 1
                  ? Container(
                      height: 35,
                      width: 30,
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
                      width: 30,
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
                style: GoogleFonts.lilitaOne(fontSize: 20, color: Colors.white),
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
                    width: 30,
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
      )
    ]);
