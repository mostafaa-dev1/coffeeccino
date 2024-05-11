import 'package:bloc/bloc.dart';
import 'package:cofee_project/core/logic/states.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/cart/cart_screen.dart';
import '../../features/favourites/favourite_screen.dart';
import '../../features/home/home_page.dart';

class CoffeeCubit extends Cubit<CoffeeStates> {
  CoffeeCubit() : super(CoffeeInitialStates());
  static CoffeeCubit get(context) => BlocProvider.of(context);
  int currentPrice = 0;
  List types = [
    ['Cappuccino', true],
    ['Espresso', false],
    ['Latte', false],
    ['flat white', false],
  ];
  List sizes = [
    ['S', true],
    ['M', false],
    ['L', false],
  ];
  int currentIndex = 0;

  List<double> prices = [3.00, 5.00, 7.00];

  int itemIndex = 0;
  void IsPressed(int index) {
    for (int i = 0; i < types.length; i++) {
      types[i][1] = false;
    }
    itemIndex = index;
    types[index][1] = true;
    emit(Price());
  }

  double? newPrice = 3.00;
  void IsSizePressed(int index) {
    for (int i = 0; i < sizes.length; i++) {
      sizes[i][1] = false;
    }
    currentPrice = index;
    counter = 1;
    newPrice = prices[currentPrice];
    sizes[index][1] = true;
    emit(Size());
  }

  int counter = 1;

  void Add() {
    newPrice = newPrice! + prices[currentPrice];
    ++counter;
    print(counter);
    emit(AddState());
  }

  void Mini() {
    newPrice = newPrice! - prices[currentPrice];
    --counter;
    emit(MiniState());
  }

  void ChangNavBar(int index) {
    currentIndex = index;
    emit(ChangeNavBar());
  }

//   void UserCofeeLogin ({
//     required String email,
//     required String password,
// }){
//     emit(CoffeeLoadingStates());
//     FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value) {
//       emit(CoffeeLoginSuccessStates(value.user!.uid));
//     }).catchError((error){
//       emit(CoffeeLoginErrorStates());
//     });
//   }
//   void UserCoffeeRegister ({
//     required String email,
//     required String password
// }){
//     emit(CoffeeRegisterLoadingStates());
//     FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value){
//       emit(CoffeeRegisterSuccessStates(value.user!.uid));
//     }).catchError((error){
//       emit(CoffeeRegisterErrorStates());
//     });
//   }
  List<Map<String, dynamic>> imageEspressoCount = [
    {
      'name': 'Cappuccino',
      'image': 'lib/assets/images/image67.jpg',
      'title': 'White Coffee',
      'price': '3.00',
      'favorite': false,
    },
    {
      'name': 'Cappuccino',
      'image': 'lib/assets/images/image68.jpg',
      'title': 'White Coffee',
      'price': '3.00',
      'favorite': false,
    },
    {
      'name': 'Cappuccino',
      'image': 'lib/assets/images/image68.jpg',
      'title': 'White Coffee',
      'price': '3.00',
      'favorite': false,
    },
    {
      'name': 'Cappuccino',
      'image': 'lib/assets/images/image69.jpg',
      'title': 'White Coffee',
      'price': '3.00',
      'favorite': false,
    }
  ];
  List<Map<String, dynamic>> Latte = [
    {
      'name': 'Cappuccino',
      'image': 'lib/assets/images/image67.jpg',
      'title': 'White Coffee',
      'price': '3.00',
      'favorite': false,
    },
    {
      'name': 'Cappuccino',
      'image': 'lib/assets/images/image68.jpg',
      'title': 'White Coffee',
      'price': '3.00',
      'favorite': false,
    },
    {
      'name': 'Cappuccino',
      'image': 'lib/assets/images/image68.jpg',
      'title': 'White Coffee',
      'price': '3.00',
      'favorite': false,
    },
    {
      'name': 'Cappuccino',
      'image': 'lib/assets/images/image69.jpg',
      'title': 'White Coffee',
      'price': '3.00',
      'favorite': false,
    }
  ];

  List<double> espressoPrices = [5.00, 7.00, 8.50, 9.50];
  int currentEsPrice = 0;
  double? newEsPrice = 5.00;
  void IsSizeEsPressed(int index) {
    for (int i = 0; i < sizes.length; i++) {
      sizes[i][1] = false;
    }
    currentPrice = index;
    Escounter = 1;
    newEsPrice = espressoPrices[currentEsPrice];
    sizes[index][1] = true;
    emit(Size());
  }

  int Escounter = 1;

  void EsAdd(int index) {
    newEsPrice = espressoPrices[index] += espressoPrices[index];
    ++Escounter;

    emit(AddState());
  }

  void EsMini(int index) {
    espressoPrices[index] -= espressoPrices[index];
    --Escounter;
    emit(MiniState());
  }

  List<String> imageLatteCount = [
    'lib/assets/images/image68.jpg',
  ];
  List<Map<String, dynamic>> Cappuccino = [
    {
      'name': 'Cappuccino',
      'image': 'lib/assets/images/image66.jpg',
      'title': 'White Coffee',
      'price': '3.00',
      'favorite': false,
    },
    {
      'name': 'Cappuccino',
      'image': 'lib/assets/images/image12.jpg',
      'title': 'White Coffee',
      'price': '3.00',
      'favorite': false,
    },
    {
      'name': 'Cappuccino',
      'image': 'lib/assets/images/image13.jpg',
      'title': 'White Coffee',
      'price': '3.00',
      'favorite': false,
    },
    {
      'name': 'Cappuccino',
      'image': 'lib/assets/images/image69.jpg',
      'title': 'White Coffee',
      'price': '3.00',
      'favorite': false,
    }
  ];
  Map<String, Map<String, dynamic>> superMap = {
    'espresso': {
      'price': {
        's': 5.00,
        'm': 7.00,
        'l': 9.00,
      },
      'image': 'lib/assets/images/image68.jpg',
    }
  };
  List<String> nameLatteCount = [
    'Piccolo latte',
    'Caffe latte',
    'Mocha',
    'Doppio',
  ];
  List<double> LatteSmallPrices = [5.00, 7.00, 8.50, 9.50];
  List<double> LatteMedPrices = [7.00, 9.00, 10.50, 11.50];
  List<double> LatteLargePrices = [9.00, 11.00, 12.50, 13.50];
  int latteSize = 0;
  double lattePrice = 5.0;
  int Lacounter = 1;
  void IsSizeLattePressed(int index, latteIndex) {
    emit(SizeLatte());
    for (int i = 0; i < sizes.length; i++) {
      sizes[i][1] = false;
    }
    latteSize = index;

    if (index == 0) {
      lattePrice = superMap[superMap.keys.toList()[0]]?['price']['s'];
    }
    if (index == 1) {
      lattePrice = superMap[superMap.keys.toList()[0]]?['price']['m'];
    }
    if (index == 2) {
      lattePrice = superMap[superMap.keys.toList()[0]]?['price']['l'];
    }
    Lacounter = 1;
    newPrice = prices[currentPrice];
    sizes[index][1] = true;
    emit(SizeLatte());
  }

  void LatteAdd() {
    lattePrice = lattePrice! + lattePrice!;
    ++Lacounter;
    emit(AddLatteState());
  }

  void LatteMini() {
    lattePrice = lattePrice! - lattePrice!;
    --Lacounter;
    emit(MiniLatteState());
  }

  List<Map<String, dynamic>> favorite = [];
  List<Map<String, dynamic>> cart = [];

  List<Map<String, dynamic>> payment = [
    {
      'name': 'Wallet',
      'image': 'lib/assets/images/payment/image1.png',
    },
    {
      'name': 'Google pay',
      'image': 'lib/assets/images/payment/image2.png',
    },
    {
      'name': 'Apple pay',
      'image': 'lib/assets/images/payment/image3.png',
    },
    {
      'name': 'Amazon pay',
      'image': 'lib/assets/images/payment/image.png',
    }
  ];
}
