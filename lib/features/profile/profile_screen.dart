import 'package:cofee_project/core/themes/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  List<String> text = [
    'My profile',
    'Settings',
    'Help center',
    'Privacy Policy',
    'Invite friends',
    'Logout'
  ];
  List<IconData> icons = [
    Icons.person,
    Icons.settings,
    Icons.info,
    Icons.close,
    CupertinoIcons.person_add,
    Icons.login,
  ];
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black45,
          title: Text(
            'Profile',
            style: GoogleFonts.lilitaOne(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
        backgroundColor: Colors.black45,
        body: Center(
          child: Column(children: [
            const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage(
                      'lib/assets/images/me1.jpg',
                    ))),
            Text('Jemmy',
                style: GoogleFonts.lilitaOne(
                  color: Colors.white,
                  fontSize: 25,
                )),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white10,
                ),
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.cube_box_fill,
                      color: AppColors.mainColor,
                      size: 25,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'My orders',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'font2'),
                        ),
                        Text(
                          'You have 5 active orders',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontFamily: 'font3'),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.mainColor,
                        ))
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white10,
                  ),
                  child: ListView.separated(
                      shrinkWrap: true,
                      primary: false,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return item(text[index], icons[index]);
                      },
                      separatorBuilder: (context, index) {
                        return Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 1,
                              width: MediaQuery.sizeOf(context).width / 1.1,
                              color: Colors.white54,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        );
                      },
                      itemCount: text.length)),
            )
          ]),
        ));
  }
}

Widget item(texts, icons) => GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                icons,
                color: AppColors.mainColor,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                texts,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    fontFamily: 'font3'),
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                color: AppColors.mainColor,
              )
            ],
          )
        ],
      ),
    );
