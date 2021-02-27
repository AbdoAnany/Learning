import 'package:cms/appTheme.dart';
import 'package:cms/courses/designCourse/homeDesignCourse.dart';
import 'package:cms/provider/auth_provider.dart';
import 'package:cms/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:date_time_format/date_time_format.dart';

class AddLecture extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AddLectureState();
  }
}

class AddLectureState extends State<AddLecture> {
  String flag = 'Error';
  String _simpleValue='Math';

  var KeyLogin = GlobalKey<ScaffoldState>();
  FirebaseAuth instance = FirebaseAuth.instance;
  Map<String,dynamic> lecture = {};
  TextEditingController question;
  TextEditingController option1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    question = new TextEditingController();
    option1 = new TextEditingController();

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
              SizedBox(
                height: 10,
              ),
              menu(),
              AppTheme.inputfild(
                  "Title",
                  context,
                  AppTheme.keyboardTypetext,
                  AppTheme.IconIanswer,
                  option1,
                  true),
              SizedBox(
                height: 10,
              ),
              Container(
                height: getScreenHeight(400),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: AppTheme.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    border: Border.all(width: 3,color: AppTheme.grey)
                ),
                child:   TextFormField(
                  controller: question,
                  style: TextStyle(
                    color: AppTheme.white,
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Subject',
                    hintStyle: TextStyle(color: AppTheme.grey, fontSize: 30,),

                  ),
                  maxLines: 1000,
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width * .4,
                height: 40,margin:EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: AppTheme.bu,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(color: Colors.white, blurRadius: 1)
                    ]),
                child: FlatButton(
                  child: Text("Send Lecture ", style: AppTheme.inputStyle),
                  onPressed: () async {
                    lecture={'category':_simpleValue,
                    'title':option1.text,
                      'subject':question.text,
                     'date' :DateTime.now().format('D, M j, H:i')
                    };
                    print(lecture);
                    try{
                      if(lecture.isEmpty)
                      {
                        Get.to(DesignCourseHomeScreen());
                      }
                      if(lecture.isNotEmpty)
                      {
                        pro.addLecture(pro.user.uid,lecture);
                      Get.off(DesignCourseHomeScreen());
                      }
                    }catch(e){
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
  Widget menu(){
    return PopupMenuButton<String>(
      padding: EdgeInsets.zero,
      initialValue: _simpleValue,
      onSelected: (value) => showAndSetMenuSelection(context,value),
      child: ListTile(
          title: Text(
            "Select Category",style: TextStyle(color: AppTheme.white,fontSize: 25),),
          subtitle: Text( _simpleValue,style: TextStyle(color: AppTheme.white,fontSize: 20))
      ),
      itemBuilder: (context) => <PopupMenuItem<String>>[
        PopupMenuItem<String>(
          value:"Math" ,
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
          value: "English" ,
          child: Text('English'),
        ),
      ],
    );
  }


}


