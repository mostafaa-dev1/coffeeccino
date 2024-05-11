import 'package:cofee_project/features/home/widgets/item_view.dart';
import 'package:cofee_project/features/home/widgets/types_screen.dart';
import 'package:cofee_project/coffee_app/view_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'widgets/coffee_item.dart';
import '../../core/logic/cubit.dart';
import '../../core/logic/states.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CoffeeCubit, CoffeeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var width = MediaQuery.of(context).size.width;
        var model = CoffeeCubit.get(context);
        List<Widget> items = [
          Column(
            children: [
              ItemView(item: model.Cappuccino),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Suggested for you',
                style: GoogleFonts.lilitaOne(
                  color: Colors.white,
                  fontSize: 23,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    height: 120,
                    decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: const Image(
                              height: 100,
                              image:
                                  AssetImage('lib/assets/images/image12.jpg')),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '5 Coffee beans you\n must try !',
                          overflow: TextOverflow.visible,
                          maxLines: 2,
                          style: GoogleFonts.lilitaOne(
                              color: Colors.white, fontSize: 22),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          ItemView(item: model.imageEspressoCount),
          ItemView(item: model.Latte),
          ItemView(item: model.imageEspressoCount),
        ];
        return Scaffold(
          appBar: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.black45,
                statusBarIconBrightness: Brightness.light),
            backgroundColor: Colors.black45,
            actions: const [
              Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                      'lib/assets/images/me1.jpg',
                    ),
                  ))
            ],
            leading: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(10)),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.grid_view_rounded,
                      color: Colors.white38,
                    )),
              ),
            ),
          ),
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Coffecceno',
                        style: GoogleFonts.satisfy(
                            color: Colors.white, fontSize: 50),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white12,
                          borderRadius: BorderRadius.circular(20)),
                      child: TextFormField(
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.search,
                              color: Colors.white38,
                            ),
                            hintText: 'Find your coffee...',
                            hintStyle: TextStyle(color: Colors.white38)),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TypesScreen(),
                    const SizedBox(
                      height: 10,
                    ),
                    items[CoffeeCubit.get(context).itemIndex],
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
