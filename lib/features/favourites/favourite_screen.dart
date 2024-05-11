import 'package:cofee_project/core/logic/cubit.dart';
import 'package:cofee_project/core/themes/colors.dart';
import 'package:cofee_project/core/themes/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Favourites extends StatelessWidget {
  const Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.black45,
            title: Text(
              'Favourites',
              style: AppFonts.appBarTitle,
            )),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Container(
              height: 130,
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
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                              height: 5,
                            ),
                            Text(
                              'With Almond milk',
                              style: AppFonts.style15,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text.rich(TextSpan(children: [
                              TextSpan(
                                  text: '\$ ', style: AppFonts.style18color),
                              TextSpan(text: '20.00', style: AppFonts.style18w)
                            ]))
                          ],
                        )
                      ],
                    ),
                  ]),
            )
          ]),
        ));
  }
}
