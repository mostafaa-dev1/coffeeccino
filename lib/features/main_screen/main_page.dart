import 'package:cofee_project/core/themes/colors.dart';
import 'package:cofee_project/features/cart/cart_screen.dart';
import 'package:cofee_project/profile_screen.dart';
import 'package:floating_navigation_bar/floating_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/logic/cubit.dart';
import '../../core/logic/states.dart';
import '../favourites/favourite_screen.dart';
import '../home/home_page.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  var currentIndex = 0;
  List<Widget> screens = [
    HomePage(),
    Favourites(),
    CartScreen(),
    ProfileScreen()
  ];
  Widget build(BuildContext context) {
    return BlocConsumer<CoffeeCubit, CoffeeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: screens[currentIndex],
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: FloatingNavigationBar(
            backgroundColor: Colors.black87,
            iconColor: Colors.white,
            indicatorColor: AppColors.mainColor,
            barHeight: 60,
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 14.0,
            ),
            iconSize: 20.0,
            items: [
              NavBarItems(icon: Icons.home, title: "Home"),
              NavBarItems(icon: CupertinoIcons.heart, title: "Favorite"),
              NavBarItems(icon: Icons.shopping_cart_rounded, title: "Cart"),
              NavBarItems(
                icon: Icons.person,
                title: "Profile",
              ),
            ],
            onChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
          ),
        );
      },
    );
  }
}
