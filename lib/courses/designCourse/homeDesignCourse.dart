import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cms/appTheme.dart';
import 'package:cms/courses/designCourse/add_exam.dart';
import 'package:cms/courses/designCourse/add_lecture.dart';
import 'package:cms/courses/designCourse/courseInfoScreen.dart';
import 'package:cms/courses/designCourse/models/category.dart';
import 'package:cms/profile/profile_screen.dart';
import 'package:cms/provider/auth_provider.dart';
import 'package:cms/quiz/models/Questions.dart';
import 'package:cms/quiz/screens/quiz/quiz_screen.dart';
import 'package:cms/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class DesignCourseHomeScreen extends StatefulWidget {
  @override
  _DesignCourseHomeScreenState createState() => _DesignCourseHomeScreenState();
}

class _DesignCourseHomeScreenState extends State<DesignCourseHomeScreen> {
  Map<String, String> imge = {
    'Math': 'assets/images.jpg',
    'Science': 'assets/seci.jpg',
    'Arabic': 'assets/arabic.jpg',
    'English': 'assets/engl.jpg'
  };
  CategoryType categoryType = CategoryType.ui;
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<AuthProvider>(context);
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          getAppBarUI(pro.user.displayName),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 16, left: 16, right: 16),
                      child: Row(
                        children: <Widget>[
                          getButtonUI(
                              CategoryType.ui, categoryType == CategoryType.ui),
                          SizedBox(
                            width: 16,
                          ),
                          getButtonUI(CategoryType.quiz,
                              categoryType == CategoryType.quiz),
                          SizedBox(
                            width: 16,
                          ),
                          getButtonUI(CategoryType.basic,
                              categoryType == CategoryType.basic),
                        ],
                      ),
                    ),
                    Flexible(
                      child: categoryType == CategoryType.quiz
                          ? getQuizUI()
                          : getPopularCourseUI(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(categoryType == CategoryType.quiz
            ? Icons.post_add
            : Icons.description),
        onPressed: () {
          if (categoryType == CategoryType.quiz) Get.to(AddExam());
          if (categoryType == CategoryType.ui) Get.to(AddLecture());
        },
      ),
    ));
  }

  Widget getAppBarUI(user) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 10, right: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 0, left: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.60,
                  height: 64,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: Container(
                      decoration: new BoxDecoration(
                        color: AppTheme.nearlyWhite,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(13.0),
                          bottomLeft: Radius.circular(13.0),
                          topLeft: Radius.circular(13.0),
                          topRight: Radius.circular(13.0),
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: new Container(
                              padding: EdgeInsets.only(left: 16, right: 16),
                              child: new TextFormField(
                                style: TextStyle(
                                  fontFamily: 'WorkSans',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: AppTheme.bu,
                                ),
                                keyboardType: TextInputType.text,
                                decoration: new InputDecoration(
                                  labelText: 'Search for course',
                                  border: InputBorder.none,
                                  helperStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: AppTheme.black,
                                  ),
                                  labelStyle: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    letterSpacing: 0.2,
                                    color: AppTheme.black,
                                  ),
                                ),
                                onEditingComplete: () {},
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 60,
                            height: 60,
                            child: Icon(Icons.search, color: AppTheme.black),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () => Get.to(ProfileScreen()),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: Image.network(imageProfile),
            ),
          )
        ],
      ),
    );
  }

  Widget getQuizUI() {
    var pro = Provider.of<AuthProvider>(context);
    return Container(
      alignment: Alignment.center,
      child: FutureBuilder<QuerySnapshot>(
          future: FirebaseFirestore.instance
              .collection('exam')
              .doc(pro.user.uid)
              .collection('mcq')
              .get(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(
                  child: Text("Nothing Here !!"),
                );
                break;
              case ConnectionState.waiting:
                return CircularProgressIndicator();
                break;
              case ConnectionState.active:
              case ConnectionState.done:
                return GridView(
                    padding: EdgeInsets.all(8),
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                    ),
                    children: snapshot.data.docs
                        .map(
                          (doc) => FlatButton(
                              onPressed: () {
                                if (doc['state'] == 'wait') {
                                  setState(() {
                                    examID = doc.id;
                                    sample_data = doc['exam'];
                                  });
                                  Get.to(QuizScreen());
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 10),
                                padding: EdgeInsets.all(12),
                                width: getScreenWidth(
                                    MediaQuery.of(context).size.width * .9),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  color: doc['state'] == 'done'
                                      ? AppTheme.bu
                                      : AppTheme.nearlyBlack,
                                  border: Border.all(
                                      width: 5, color: AppTheme.black),
                                ),
                                child: doc['state'] == 'done'
                                    ? Text(
                                        'State : ${doc['state']} '
                                        '\n Start \n${doc['date']}'
                                        '\n end \n${doc['solove_date']}'
                                        '\n\n  (${doc['score']})',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: AppTheme.white,
                                            fontSize: 15),
                                      )
                                    : Text(
                                        ' \nState : ${doc['state']} '
                                        '\n\n Start \n ${doc['date']}\n\n'
                                        '(0/${doc['len']}0)\n',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: AppTheme.white,
                                            fontSize: 15),
                                      ),
                              )),
                        )
                        .toList());
            }
            return Center(
              child: Text(
                "Nothing Here !!",
                style: TextStyle(fontSize: 20, color: AppTheme.black),
              ),
            );
          }),
    );
  }

  Widget getPopularCourseUI() {
    var pro = Provider.of<AuthProvider>(context);
    return Container(
      alignment: Alignment.center,
      child: FutureBuilder<QuerySnapshot>(
          future: FirebaseFirestore.instance
              .collection('Lectures')
              .doc(pro.user.uid)
              .collection('Lecture')
              .get(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(
                  child: Text(
                    "Nothing Here !!",
                    style: TextStyle(fontSize: 20, color: AppTheme.black),
                  ),
                );
                break;
              case ConnectionState.waiting:
                return CircularProgressIndicator();
                break;
              case ConnectionState.active:
              case ConnectionState.done:
                return ListView(
                    padding: EdgeInsets.all(8),
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    children: snapshot.data.docs
                        .map(
                          (doc) => Stack(
                            children: [
                              FlatButton(
                                  onPressed: () {
                                    setState(() {
                                      examID = doc.id;
                                      Lecture.lectures = Lecture(
                                          title: doc['title'],
                                          subject: doc['subject'],
                                          imagePath: imge[doc['category']],
                                      );
                                    });


                                    Navigator.of(context).push(
                                        PageRouteBuilder(
                                          fullscreenDialog: true,
                                          transitionDuration: Duration(milliseconds: 1000),
                                          pageBuilder: (BuildContext context,
                                              Animation<double> animation,
                                              Animation<double> secondaryAnimation) {
                                            return CourseInfoScreen();
                                          },
                                          transitionsBuilder: (BuildContext context,
                                              Animation<double> animation,
                                              Animation<double> secondaryAnimation,
                                              Widget child) {
                                            return FadeTransition(
                                              opacity: animation, // CurvedAnimation(parent: animation, curve: Curves.elasticInOut),
                                              child: child,
                                            );
                                          },
                                        ));
                                  },
                                  child: Container(
                                      alignment: Alignment.bottomLeft,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 10),
                                      height: getScreenHeight(
                                          MediaQuery.of(context).size.height *
                                              .27),
                                      width: getScreenWidth(
                                          MediaQuery.of(context).size.width *
                                              .9),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: new ExactAssetImage(
                                              imge[doc['category']]),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        color: AppTheme.bu,
                                      ),
                                      child: Container(
                                        height: getScreenHeight(
                                            MediaQuery.of(context).size.height *
                                                .08),
                                        padding: EdgeInsets.only(
                                            bottom: 10, left: 10, top: 10),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        color: AppTheme.white.withOpacity(.7),
                                        child: Text(
                                          '${doc['title'].toString().capitalizeFirst}  ',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: AppTheme.black,
                                              letterSpacing: 2,
                                              fontSize: 15),
                                        ),
                                      ))),
                              Positioned(
                                left: 250,
                                top: 20,
                                child: FlatButton(
                                  onPressed: () {
                                    pro.deleteLecture(pro.user.uid, doc.id);
                                  },
                                  child: Icon(
                                    Icons.clear,
                                    size: 25,
                                    color: AppTheme.red,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                        .toList());
                break;
            }
            return Center(
              child: Text(
                "Nothing Here !!",
                style: TextStyle(fontSize: 20, color: AppTheme.black),
              ),
            );
          }),
    );
  }

  Widget getButtonUI(CategoryType categoryTypeData, bool isSelected) {
    var txt = '';
    if (CategoryType.ui == categoryTypeData) {
      txt = 'Lecture';
    } else if (CategoryType.quiz == categoryTypeData) {
      txt = 'Quiz';
    } else if (CategoryType.basic == categoryTypeData) {
      txt = 'Book';
    }
    return Expanded(
      child: Container(
        decoration: new BoxDecoration(
            color: isSelected ? AppTheme.bu : AppTheme.nearlyWhite,
            borderRadius: BorderRadius.all(Radius.circular(24.0)),
            border: new Border.all(color: AppTheme.bu)),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.white24,
            borderRadius: BorderRadius.all(Radius.circular(24.0)),
            onTap: () {
              setState(() {
                categoryType = categoryTypeData;
              });
            },
            child: Padding(
              padding:
                  EdgeInsets.only(top: 12, bottom: 12, left: 18, right: 18),
              child: Center(
                child: Text(
                  txt,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    letterSpacing: 0.27,
                    color: isSelected ? AppTheme.nearlyWhite : AppTheme.bu,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum CategoryType {
  ui,
  quiz,
  basic,
}
