import 'package:cms/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';
import '../size_config.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t have an account? ",
          style: TextStyle(fontSize: getScreenWidth(16)),
        ),
        GestureDetector(
          onTap: () => Get.to(SignUpScreen()),
          child: Text(
            "Sign Up",
            style:
                TextStyle(fontSize: getScreenWidth(16), color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
