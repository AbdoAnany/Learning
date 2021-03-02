import 'package:cms/appTheme.dart';
import 'package:cms/courses/designCourse/homeDesignCourse.dart';
import 'package:cms/provider/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class AddExam extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AddExamState();
  }
}

class AddExamState extends State<AddExam> {
  String flag = 'Error';
  String _simpleValue = 'Math';

  var KeyLogin = GlobalKey<ScaffoldState>();
  FirebaseAuth instance = FirebaseAuth.instance;
  int radioValue = 0;
  int count = 0;
  List exam = [];
  TextEditingController question;
  TextEditingController option1;
  TextEditingController option2;
  TextEditingController option3;
  TextEditingController option4;
  TextEditingController answer;
  TextEditingController lev;
  TextEditingController category;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    question = new TextEditingController();
    option1 = new TextEditingController();
    option2 = new TextEditingController();
    option3 = new TextEditingController();
    option4 = new TextEditingController();
    answer = new TextEditingController();
    lev = new TextEditingController();
    category = new TextEditingController();
  }

  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<AuthProvider>(context);

    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        key: KeyLogin,
        backgroundColor: AppTheme.bg,
        body: Container(
          alignment: Alignment.center,
          child: ListView(
            children: <Widget>[
              Text(
                'Number of Question : ${count}',
                style: TextStyle(
                  color: AppTheme.white,
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: AppTheme.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    border: Border.all(width: 3, color: AppTheme.grey)),
                child: TextFormField(
                  controller: question,
                  style: TextStyle(
                    color: AppTheme.white,
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Question',
                    hintStyle: TextStyle(
                      color: AppTheme.grey,
                      fontSize: 30,
                    ),
                  ),
                  maxLines: 5,
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                        color: AppTheme.bg,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        border: Border.all(width: 2, color: AppTheme.white)),
                    child: Radio<int>(
                      value: 0,
                      groupValue: radioValue,
                      onChanged: handleRadioValueChanged,
                      activeColor: Colors.green,
                      autofocus: true,
                    ),
                  ),
                  AppTheme.inputfild(
                      "option1",
                      context,
                      AppTheme.keyboardTypetext,
                      AppTheme.IconIanswer,
                      option1,
                      true),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                        color: AppTheme.bg,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        border: Border.all(width: 2, color: AppTheme.white)),
                    child: Radio<int>(
                      value: 1,
                      groupValue: radioValue,
                      onChanged: handleRadioValueChanged,
                      activeColor: Colors.green,
                      autofocus: true,
                    ),
                  ),
                  AppTheme.inputfild(
                      "option2",
                      context,
                      AppTheme.keyboardTypetext,
                      AppTheme.IconIanswer,
                      option2,
                      true),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                        color: AppTheme.bg,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        border: Border.all(width: 2, color: AppTheme.white)),
                    child: Radio<int>(
                      value: 2,
                      groupValue: radioValue,
                      onChanged: handleRadioValueChanged,
                      activeColor: Colors.green,
                      autofocus: true,
                    ),
                  ),
                  AppTheme.inputfild(
                      "option3",
                      context,
                      AppTheme.keyboardTypetext,
                      AppTheme.IconIanswer,
                      option3,
                      true),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                        color: AppTheme.bg,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        border: Border.all(width: 2, color: AppTheme.white)),
                    child: Radio<int>(
                      value: 3,
                      groupValue: radioValue,
                      onChanged: handleRadioValueChanged,
                      activeColor: Colors.green,
                      autofocus: true,
                    ),
                  ),
                  AppTheme.inputfild(
                      "option4",
                      context,
                      AppTheme.keyboardTypetext,
                      AppTheme.IconIanswer,
                      option4,
                      true),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              menu(),
              SizedBox(
                height: 15,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                width: MediaQuery.of(context).size.width * .4,
                height: 40,
                decoration: BoxDecoration(
                    color: AppTheme.bu,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    boxShadow: [BoxShadow(color: Colors.white, blurRadius: 1)]),
                child: FlatButton(
                  child: Text(" (${count})  Next Question >>",
                      style: TextStyle(fontSize: 20)),
                  onPressed: () async {
                    try {
                      if (question.text.isEmpty ||
                          option1.text.isEmpty ||
                          option2.text.isEmpty ||
                          option3.text.isEmpty ||
                          option4.text.isEmpty) {
                        KeyLogin.currentState.showSnackBar(
                            SnackBar(content: Text('Complete input')));
                        return;
                      }
                      exam.add({
                        'question': question.text,
                        'options': [
                          option1.text,
                          option2.text,
                          option3.text,
                          option4.text,
                        ],
                        'answer_index': radioValue,
                        'lev': 1,
                        'category': _simpleValue
                      });
                      setState(() {
                        count++;
                      });

                      question.clear();
                      option1.clear();
                      option2.clear();
                      option3.clear();
                      option4.clear();

                      KeyLogin.currentState.showSnackBar(SnackBar(
                        content: Text('success added Question'),
                      ));
                    } catch (e) {
                      KeyLogin.currentState
                          .showSnackBar(SnackBar(content: Text('fail')));
                    }
                  },
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * .4,
                height: 40,
                decoration: BoxDecoration(
                    color: AppTheme.bu,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    boxShadow: [BoxShadow(color: Colors.white, blurRadius: 1)]),
                child: FlatButton(
                  child: Text("Send Exam ", style: AppTheme.inputStyle),
                  onPressed: () async {
                    try {
                      if (exam.isEmpty) {
                        Get.to(DesignCourseHomeScreen());
                      }
                      if (exam.isNotEmpty) {
                        pro.addExam(pro.user.uid, exam);
                        Get.off(DesignCourseHomeScreen());
                      }
                    } catch (e) {
                      KeyLogin.currentState
                          .showSnackBar(SnackBar(content: Text('fail')));
                    }
                  },
                ),
              ),
              SizedBox(
                height: 70,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showAndSetMenuSelection(BuildContext context, String value) {
    setState(() {
      _simpleValue = value;
    });
  }

  Widget menu() {
    return PopupMenuButton<String>(
      padding: EdgeInsets.zero,
      initialValue: _simpleValue,
      onSelected: (value) => showAndSetMenuSelection(context, value),
      child: ListTile(
          title: Text(
            "Select Category",
            style: TextStyle(color: AppTheme.white, fontSize: 25),
          ),
          subtitle: Text(_simpleValue,
              style: TextStyle(color: AppTheme.white, fontSize: 20))),
      itemBuilder: (context) => <PopupMenuItem<String>>[
        PopupMenuItem<String>(
          value: "Math",
          child: Text('Math'),
        ),
        PopupMenuItem<String>(
          value: "Science",
          child: Text('Science'),
        ),
        PopupMenuItem<String>(
          value: "Arabic",
          child: Text('Arabic'),
        ),
        PopupMenuItem<String>(
          value: "English",
          child: Text('English'),
        ),
      ],
    );
  }
}
