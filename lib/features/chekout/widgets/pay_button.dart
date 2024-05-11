import 'package:cofee_project/core/themes/colors.dart';
import 'package:cofee_project/core/themes/fonts.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class PAyButton extends StatelessWidget {
  const PAyButton(
      {super.key,
      required this.text,
      required this.price,
      required this.buttonName,
      required this.onPressed});
  final String text;
  final String price;
  final String buttonName;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: AppFonts.style15,
              ),
              const SizedBox(
                height: 5,
              ),
              Text.rich(
                TextSpan(children: [
                  TextSpan(text: '\$ ', style: AppFonts.style18color),
                  TextSpan(text: price, style: AppFonts.style18w)
                ]),
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: onPressed,
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child:
                    Center(child: Text(buttonName, style: AppFonts.style15))),
          )
        ],
      ),
    );
  }
}
