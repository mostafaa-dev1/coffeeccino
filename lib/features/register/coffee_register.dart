import 'package:cofee_project/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../../core/logic/cubit.dart';
import '../../core/logic/states.dart';
import '../main_screen/main_page.dart';

class CoffeeRegister extends StatelessWidget {
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var passController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CoffeeCubit, CoffeeStates>(
      listener: (context, state) {
        if (state is CoffeeRegisterSuccessStates) {
          // CashHelper.SetUid(key: 'uId', value: state.uId).then((value) {
          //   Navigator.pushAndRemoveUntil(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => MainPage(),
          //       ),
          //       (route) => false);
          // });

          //custemToast(context: context, text: 'Signed in Successfully',color: mainColor,icon: Icons.check);
        }
        if (state is CoffeeRegisterErrorStates) {
          //custemToast(context: context, text: 'Error check your email and password',color: Colors.red,icon: Icons.error);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Coffeeccino',
                        style: GoogleFonts.satisfy(
                          color: AppColors.mainColor,
                          fontSize: 60,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Sign in and enjoy shopping coffee',
                        style: TextStyle(fontSize: 20, color: Colors.grey[400]),
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ('name must not be empty');
                                }
                              },
                              keyboardType: TextInputType.emailAddress,
                              controller: nameController,
                              decoration: InputDecoration(
                                  hintText: 'Name',
                                  hoverColor: AppColors.mainColor,
                                  hintStyle: TextStyle(
                                      color: Colors.grey[400], fontSize: 17),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  )),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ('Email must not be empty');
                                }
                              },
                              keyboardType: TextInputType.emailAddress,
                              controller: emailController,
                              decoration: InputDecoration(
                                  hintText: 'Email',
                                  hoverColor: AppColors.mainColor,
                                  hintStyle: TextStyle(
                                      color: Colors.grey[400], fontSize: 17),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  )),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ('Password must not be empty');
                                }
                              },
                              keyboardType: TextInputType.visiblePassword,
                              controller: passController,
                              decoration: InputDecoration(
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                      color: Colors.grey[400], fontSize: 17),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15))),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      state is CoffeeRegisterLoadingStates
                          ? CircularProgressIndicator(
                              color: AppColors.mainColor,
                            )
                          : Container(
                              width: 150,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white12,
                              ),
                              child: TextButton(
                                  style: const ButtonStyle(
                                      splashFactory: NoSplash.splashFactory,
                                      overlayColor: MaterialStatePropertyAll(
                                          Colors.transparent)),
                                  onPressed: () async {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            child: MainPage(),
                                            type: PageTransitionType.fade));

                                    if (formKey.currentState!.validate()) {
                                      //uid = await CashHelper.GetUid(key: 'uId');
                                    }
                                  },
                                  child: Text(
                                    'Sign up',
                                    style: TextStyle(
                                        color: AppColors.mainColor,
                                        fontSize: 20),
                                  )),
                            ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already have an account?',
                              style: TextStyle(
                                  color: Colors.grey[400], fontSize: 15)),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Sign in',
                                  style: TextStyle(
                                      color: AppColors.mainColor,
                                      fontSize: 17))),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
