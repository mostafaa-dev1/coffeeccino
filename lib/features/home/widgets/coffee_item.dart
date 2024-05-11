import 'package:cofee_project/core/themes/colors.dart';
import 'package:cofee_project/core/themes/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/logic/cubit.dart';
import '../../../core/logic/states.dart';

class CoffeeItem extends StatefulWidget {
  const CoffeeItem({Key? key, this.item}) : super(key: key);
  final dynamic item;

  @override
  State<CoffeeItem> createState() => _CoffeeItemState();
}

class _CoffeeItemState extends State<CoffeeItem> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CoffeeCubit, CoffeeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8.0),
          child: Container(
              width: 180,
              decoration: BoxDecoration(
                color: const Color(0xFF252A32),
                gradient: LinearGradient(colors: [
                  AppColors.backgroundColor1,
                  AppColors.backgroundColor2
                ], begin: Alignment.topLeft, end: Alignment.topRight),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      clipBehavior: Clip.hardEdge,
                      borderRadius: BorderRadius.circular(20),
                      child: Image(
                        fit: BoxFit.fill,
                        alignment: Alignment.topCenter,
                        height: 180,
                        width: 200,
                        image: AssetImage(widget.item['image']),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.item['name'], style: AppFonts.style22),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(widget.item['title'], style: AppFonts.style15),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text.rich(TextSpan(children: [
                              TextSpan(
                                  text: '\$', style: AppFonts.style18color),
                              TextSpan(
                                  text: ' ${widget.item['price']} ',
                                  style: AppFonts.style18w)
                            ])),
                            IconButton(
                                splashRadius: 5,
                                onPressed: () {
                                  setState(() {
                                    CoffeeCubit.get(context)
                                        .favorite
                                        .add(widget.item);
                                    widget.item['favorite'] =
                                        !widget.item['favorite'];
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            backgroundColor:
                                                AppColors.mainColor,
                                            content: Text('Added to favorites',
                                                style: AppFonts.style18w)));
                                  });
                                },
                                icon: Icon(
                                  widget.item['favorite']
                                      ? CupertinoIcons.heart_fill
                                      : CupertinoIcons.heart,
                                  color: widget.item['favorite']
                                      ? AppColors.mainColor
                                      : Colors.white,
                                  size: 30,
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        );
      },
    );
  }
}
