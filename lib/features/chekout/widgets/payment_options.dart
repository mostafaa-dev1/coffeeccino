import 'package:cofee_project/core/logic/cubit.dart';
import 'package:cofee_project/core/themes/colors.dart';
import 'package:cofee_project/core/themes/fonts.dart';
import 'package:flutter/material.dart';

class PaymentOptions extends StatelessWidget {
  const PaymentOptions({super.key});

  @override
  Widget build(BuildContext context) {
    var item = CoffeeCubit.get(context).payment;
    return ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: LinearGradient(colors: [
                AppColors.backgroundColor1,
                AppColors.backgroundColor2
              ]),
            ),
            child: Row(
              children: [
                Image(height: 30, image: AssetImage(item[index]['image'])),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  item[index]['name'],
                  style: AppFonts.style15,
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 10,
          );
        },
        itemCount: item.length);
  }
}
