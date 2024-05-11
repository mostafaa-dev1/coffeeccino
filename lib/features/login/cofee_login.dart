import 'package:cofee_project/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../register/coffee_register.dart';
import '../../core/logic/cubit.dart';
import '../../core/logic/states.dart';
import '../main_screen/main_page.dart';

class CoffeeLogin extends StatelessWidget {
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CoffeeCubit, CoffeeStates>(
      listener: (context, state) {
        if (state is CoffeeLoginSuccessStates) {
          // CashHelper.SetUid(key: 'uId', value: state.uId).then((value) {
          //   Navigator.pushAndRemoveUntil(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => MainPage(),
          //       ),
          //       (route) => false);
          // });

          //custemToast(context: context, text: 'Signed in Successfully',color: AppColors.mainColor,icon: Icons.check);
        }
        if (state is CoffeeLoginErrorStates) {
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
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey[400],
                            fontWeight: FontWeight.w500),
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
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ('Password must not be empty');
                                }
                              },
                              keyboardType: TextInputType.visiblePassword,
                              controller: passController,
                              // obscureText: LoginCubit.get(context).isVisiable,
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
                      state is CoffeeLoadingStates
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
                                      overlayColor: MaterialStatePropertyAll(
                                          Colors.transparent)),
                                  onPressed: () async {
                                    if (formKey.currentState!.validate()) {
                                      //uid = await CashHelper.GetUid(key: 'uId');
                                    }
                                  },
                                  child: Text(
                                    'Sign in',
                                    style: TextStyle(
                                      color: AppColors.mainColor,
                                      fontSize: 20,
                                    ),
                                  )),
                            ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account?',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[400]),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        child: CoffeeRegister(),
                                        type: PageTransitionType.fade));
                              },
                              child: Text(
                                'Sign up',
                                style: TextStyle(color: AppColors.mainColor),
                              ))
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
