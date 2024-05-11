import 'package:cofee_project/core/themes/colors.dart';
import 'package:cofee_project/features/coffee_item/widgets/size_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';
import '../core/logic/cubit.dart';
import '../core/logic/states.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen(
      {Key? key,
      required this.image,
      required this.mainTitle,
      required this.subTitle})
      : super(key: key);
  final String image;
  final String mainTitle;
  final String subTitle;

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CoffeeCubit, CoffeeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.black,
            body: CustomScrollView(slivers: [
              SliverAppBar(
                systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarBrightness: Brightness.light,
                ),

                expandedHeight: 300,
                backgroundColor: Colors.black,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      widget.image,
                    ),
                  ),
                ),
                pinned: true,
                // bottom: PreferredSize(

                //   preferredSize:,
                //   child: Container(
                //     width: double.infinity,
                //     height: 50,
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.only(
                //         topLeft: Radius.circular(20),
                //         topRight: Radius.circular(20),
                //       )
                //     ),
                //   )
                // ),
                leadingWidth: 80,
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 50,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black87,
                    ),
                    child: Center(
                      child: IconButton(
                        splashRadius: 5,
                        alignment: Alignment.centerRight,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white38,
                        ),
                      ),
                    ),
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 50,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black87,
                      ),
                      child: IconButton(
                        splashRadius: 5,
                        alignment: Alignment.center,
                        onPressed: () {},
                        icon: const Icon(
                          CupertinoIcons.heart_fill,
                          color: Colors.white38,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SliverToBoxAdapter(
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF252A32),
                                      Color(0xff141921)
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight),
                                color: Color(0xFF141921),
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.mainTitle,
                                      style: GoogleFonts.lilitaOne(
                                          fontSize: 30, color: Colors.white),
                                    ),
                                    const Spacer(),
                                    Icon(
                                      Icons.star,
                                      color: AppColors.mainColor,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '4.5',
                                      style: GoogleFonts.lilitaOne(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(widget.subTitle,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ))
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Text(
                            'Description',
                            style: GoogleFonts.lilitaOne(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            'A Cappuccino is a coffee-based drink made primary from espresso and milkA Cappuccino is a coffee-based drink made primary from espresso and milkA Cappuccino is a coffee-based drink made primary from espresso and milkA Cappuccino is a coffee-based drink made primary from espresso and milkA Cappuccino is a coffee-based drink made primary from espresso and milkA Cappuccino is a coffee-based drink made primary from espresso and milkA Cappuccino is a coffee-based drink made primary from espresso and milkA Cappuccino is a coffee-based drink made primary from espresso and milkA Cappuccino is a coffee-based drink made primary from espresso and milkA Cappuccino is a coffee-based drink made primary from espresso and milk',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 17,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Size',
                            style: GoogleFonts.lilitaOne(
                                fontSize: 20, color: Colors.white),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              SizeItems(
                                type: CoffeeCubit.get(context).sizes[0][0],
                                index: 0,
                                isSelected: CoffeeCubit.get(context).sizes[0]
                                    [1],
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              SizeItems(
                                type: CoffeeCubit.get(context).sizes[1][0],
                                index: 1,
                                isSelected: CoffeeCubit.get(context).sizes[1]
                                    [1],
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              SizeItems(
                                type: CoffeeCubit.get(context).sizes[2][0],
                                index: 2,
                                isSelected: CoffeeCubit.get(context).sizes[2]
                                    [1],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Container(
                              height: 110,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white12),
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 20),
                                  child: Row(children: [
                                    Column(
                                      children: [
                                        Text(
                                          'Price',
                                          style: GoogleFonts.lilitaOne(
                                              fontSize: 20,
                                              color: Colors.white),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          '\$ ${CoffeeCubit.get(context).newPrice}',
                                          style: GoogleFonts.lilitaOne(
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    CoffeeCubit.get(context).counter <= 1
                                        ? Container(
                                            height: 40,
                                            width: 35,
                                            decoration: BoxDecoration(
                                                color: Colors.white12,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: const Icon(
                                              CupertinoIcons.minus,
                                              color: Colors.white,
                                            ))
                                        : Container(
                                            height: 40,
                                            width: 35,
                                            decoration: BoxDecoration(
                                                color: AppColors.mainColor,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: IconButton(
                                                onPressed: () {
                                                  CoffeeCubit.get(context)
                                                      .Mini();
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
                                    Container(
                                      height: 40,
                                      width: 35,
                                      decoration: BoxDecoration(
                                          color: AppColors.mainColor,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: IconButton(
                                          onPressed: () {
                                            CoffeeCubit.get(context).Add();
                                          },
                                          icon: const Icon(
                                            CupertinoIcons.plus,
                                            color: Colors.white,
                                          )),
                                    ),
                                    const Spacer(),
                                    Container(
                                      width: 150,
                                      decoration: BoxDecoration(
                                        color: AppColors.mainColor,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Add to cart',
                                            style: GoogleFonts.poppins(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white),
                                          )),
                                    ),
                                  ])))
                        ],
                      )))
            ]));
      },
    );
  }
}
