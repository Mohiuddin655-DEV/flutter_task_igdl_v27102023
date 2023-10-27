import 'package:app_color/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_andomie/core.dart';
import 'package:flutter_androssy/widgets.dart';
import 'package:get/get.dart';

import '../../viewmodel/controllers/profile_controller.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  ProfileController controller = ProfileController();

  @override
  void initState() {
    controller.fetchUser();
    controller.fetchUserLastDigitsOfPhone();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: LinearLayout(
          children: [
            Obx(() {
              final user = controller.user.value;
              return LinearLayout(
                layoutGravity: LayoutGravity.center,
                children: [
                  IconView(
                    icon: CupertinoIcons.person,
                    padding: 8,
                    background: Colors.white.darkness(10),
                    size: 120,
                    shape: ViewShape.circular,
                    tint: Colors.black.t25,
                    margin: 32,
                  ),
                  TextView(
                    text: user.name ?? "Loading...",
                    textSize: 24,
                    textFontWeight: FontWeight.bold,
                    textColor: Colors.black,
                  ),
                  Obx(() {
                    return TextView(
                      marginTop: 8,
                      text:
                          "Last Four Digits : ${controller.lastFourDigitsOfPhone.value}",
                      textColor: Colors.grey,
                      textSize: 14,
                    );
                  }),
                  LinearLayout(
                    padding: 16,
                    paddingHorizontal: 32,
                    background: Colors.white,
                    borderRadius: 24,
                    children: user.source.entries.map((e) {
                      return LinearLayout(
                        orientation: Axis.horizontal,
                        paddingVertical: 4,
                        children: [
                          TextView(
                            flex: 1,
                            text: e.key.toString().uppercase,
                            textColor: Colors.black,
                            textOverflow: TextOverflow.ellipsis,
                          ),
                          const TextView(text: " : "),
                          TextView(
                            flex: 2,
                            text: e.value.toString(),
                            textColor: Colors.grey,
                            textOverflow: TextOverflow.ellipsis,
                            marginStart: 8,
                          ),
                        ],
                      );
                    }).toList(),
                  )
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
