import 'package:cofee_project/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/logic/cubit.dart';
import '../../../core/logic/states.dart';

class TypesScreen extends StatelessWidget {
  const TypesScreen({
    Key? key,
  }) : super(key: key);
  // final String type;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CoffeeCubit, CoffeeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var types = CoffeeCubit.get(context).types;
        return Container(
          height: 70,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return InkWell(
                splashFactory: NoSplash.splashFactory,
                overlayColor: MaterialStatePropertyAll(Colors.transparent),
                onTap: () {
                  CoffeeCubit.get(context).IsPressed(index);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      Text(
                        types[index][0],
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                          color: types[index][1]
                              ? AppColors.mainColor
                              : Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      types[index][1]
                          ? Container(
                              height: 1,
                              width: index == 0
                                  ? 70
                                  : index == 2
                                      ? 40
                                      : 60,
                              color: AppColors.mainColor,
                            )
                          : SizedBox(),
                    ],
                  ),
                ),
              );
              // return TypesScreen(
              //   type: CoffeeCubit.get(context).types[index][0],
              //   index: index,
              //   isSelected: CoffeeCubit.get(context).types[index][1],
              // );
            },
            separatorBuilder: (context, index) => const SizedBox(
              width: 10,
            ),
            itemCount: CoffeeCubit.get(context).types.length,
          ),
        );
      },
    );
  }
}
