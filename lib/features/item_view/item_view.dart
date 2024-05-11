import 'package:cofee_project/coffee_app/view_screen.dart';
import 'package:cofee_project/features/home/widgets/coffee_item.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class ItemView extends StatelessWidget {
  const ItemView({super.key, required this.item});
  final dynamic item;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: item.length,
      primary: false,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: width > 500 ? 3 : 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        childAspectRatio: .60,
      ),
      itemBuilder: (context, index) {
        return InkWell(
            overlayColor: const MaterialStatePropertyAll(Colors.transparent),
            borderRadius: BorderRadius.zero,
            radius: 20,
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      child: ViewScreen(
                          image: item[index]['image'],
                          mainTitle: item[index]['name'],
                          subTitle: 'With chocolate'),
                      type: PageTransitionType.fade));
            },
            child: CoffeeItem(
              item: item[index],
            ));
      },
    );
  }
}
