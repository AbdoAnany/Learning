import 'package:cms/components/default_button.dart';
import 'package:cms/courses/designCourse/homeDesignCourse.dart';
import 'package:cms/provider/auth_provider.dart';
import 'package:cms/quiz/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:cms/quiz/controllers/question_controller.dart';

class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    var pro=Provider.of<AuthProvider>(context);

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("assets/bg2.png", fit: BoxFit.fill),
          Column(
            children: [
              Spacer(flex: 3),
              Text(
                "Score",
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    .copyWith(color: kSecondaryColor),
              ),
              Spacer(),
              Text(
                "${_qnController.numOfCorrectAns * 10}/${_qnController.questions.length * 10}",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: kSecondaryColor),
              ),
              Spacer(flex: 3),
              DefaultButton(
                text: "Done",
                press: () {
                  pro.getExams(examID,"${_qnController.numOfCorrectAns * 10}/${_qnController.questions.length * 10}");
                  Get.off(DesignCourseHomeScreen());
                },
              ),
              Spacer(flex: 3),
            ],
          )
        ],
      ),
    );
  }
}
