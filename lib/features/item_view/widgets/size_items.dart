import 'package:cofee_project/core/themes/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/logic/cubit.dart';

class SizeItems extends StatelessWidget {
  const SizeItems({
    Key? key,
    required this.type,
    required this.index,
    required this.isSelected,
  }) : super(key: key);
  final String type;
  final int index;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: MaterialStatePropertyAll(Colors.transparent),
      onTap: () {
        CoffeeCubit.get(context).IsSizePressed(index);
      },
      child: Container(
        height: 60,
        width: 130,
        decoration: BoxDecoration(
            color: isSelected ? AppColors.mainColor : Colors.white12,
            borderRadius: BorderRadius.circular(20)),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            type,
            style: GoogleFonts.lilitaOne(
                fontSize: 20,
                color: isSelected ? Colors.white : Colors.white70),
          ),
        ),
      ),
    );
    ;
  }
}
