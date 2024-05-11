import 'package:cofee_project/core/logic/bloc_observer.dart';
import 'package:cofee_project/core/themes/colors.dart';
import 'package:cofee_project/features/login/cofee_login.dart';
import 'package:cofee_project/features/start_screen/coffee_start_screen1.dart';
import 'package:cofee_project/core/logic/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/logic/cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CoffeeCubit(),
      child: BlocConsumer<CoffeeCubit, CoffeeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(color: Colors.white),
              ),
              scaffoldBackgroundColor: Colors.black,
              colorScheme: ColorScheme.fromSeed(seedColor: AppColors.mainColor),
              useMaterial3: true,
            ),
            debugShowCheckedModeBanner: false,
            home: CoffeeStartScreen1(),
          );
        },
      ),
    );
  }
}
