import 'package:cms/onboarding_screen/page/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class ID extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EA STADY',
      theme: ThemeData(
        primaryColor: Colors.amberAccent,
      ),
      home: OnBoardingPage(),
    );
  }
}
