import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cms/courses/designCourse/homeDesignCourse.dart';
import 'package:cms/sign_in/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

enum AuthStates { unAuthentication, Authenticating, Authenticated }
String examID;
String imageProfile='https://icons-for-free.com/iconfiles/png/512/badge+business+circle+human+id+male+man+people+person+profile-1320184105268408486.png';

class AuthProvider with ChangeNotifier {
  AuthProvider() {
    _instance = FirebaseAuth.instance;
    _instance.authStateChanges().listen((User user) {
      if (user == null) {
        _authStates = AuthStates.unAuthentication;
      } else {
        _user = user;
        _authStates = AuthStates.Authenticated;
      }
      notifyListeners();
    });
  }

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseMessaging _fbm=FirebaseMessaging();
  AuthStates _authStates = AuthStates.unAuthentication;
  FirebaseAuth _instance;
  User _user;
  var exams, e = [];
  User get user => _user;
  AuthStates get authStates => _authStates;

  void checkSignIn(int f)async{
    await notifications();
    FirebaseAuth.instance.authStateChanges().listen((User user) {
      if(user==null){
        if(f==2){
          Get.to(SignInScreen());
        }else if(f==1){
          Get.to(SignInScreen());
        }
      }else{
        Get.to(DesignCourseHomeScreen());
      }
    });
  }

  //---------------Notifications with Firebase---------------------------

Future notifications()async{
  if(Platform.isIOS)
    _fbm.requestNotificationPermissions(IosNotificationSettings())  ;

  _fbm.configure(
      onMessage: (Map<String,dynamic>message)async{
        print("onMessage ==>$message");
      },   onLaunch:  (Map<String,dynamic>message)async{
    print("onLaunch ==>$message");
  },   onResume: (Map<String,dynamic>message)async{
    print("onResume ==>$message");
  }
  );
  _fbm.requestNotificationPermissions(const IosNotificationSettings(alert: true,sound: true ,badge: true));
  notifyListeners();
}

  //---------------Login With Email and Password---------------------------
  Future<String> login(String email, String password) async {
    try {
      _authStates = AuthStates.Authenticating;
      notifyListeners();
      UserCredential userCredential = await _instance
          .signInWithEmailAndPassword(email: email, password: password);
      _user = userCredential.user;
      await FirebaseFirestore.instance
          .collection('users')
          .doc(_user.uid)
          .snapshots();
      _authStates = AuthStates.Authenticated;
      notifyListeners();
      return 'success';
    } on FirebaseAuthException catch (e) {
      _authStates = AuthStates.unAuthentication;
      notifyListeners();
      return e.message;
    }
  }

  //---------------Registration---------------------------
  Future<String> register(String name, String phone, String email,
      String password, String school, String grade) async {
    try {
      _authStates = AuthStates.Authenticating;
      notifyListeners();
      UserCredential userCredential = await _instance
          .createUserWithEmailAndPassword(email: email, password: password);
      _user = userCredential.user;
      _user.updateProfile(displayName: name);
      await FirebaseFirestore.instance.collection('users').doc(_user.uid).set({
        "name": name,
        "phone": phone,
        "type": 'student',
        "school": school,
        "grade": '1',
      });
      return 'success';
    } on FirebaseAuthException catch (e) {
      _authStates = AuthStates.unAuthentication;
      notifyListeners();
      return e.message;
    }
  }

  //---------------SignIn with google account---------------------------
  void googleSignIn() async {
    try {
      final GoogleSignInAccount signInAccount = await _googleSignIn.signIn();
      imageProfile=signInAccount.photoUrl;
      notifyListeners();
      GoogleSignInAuthentication signInAuthentication =
          await signInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: signInAuthentication.idToken,
          accessToken: signInAuthentication.accessToken);
      await _instance.signInWithCredential(credential);
      notifyListeners();

    } catch (error) {
      print('error');
      print(error);
      notifyListeners();
    }
  }

  //---------------logOut with google account or email---------------------------
  logOut() async {

if( await _googleSignIn.isSignedIn())
    {  await _googleSignIn.signOut();
    _authStates = AuthStates.unAuthentication;
    notifyListeners();return;
    }
    await _instance.signOut();
    _authStates = AuthStates.unAuthentication;
    notifyListeners();

      Get.off(SignInScreen());
    return;
  }

  //---------------end Login---------------------------

  //---------------Add Exam in Firebase---------------------------
  Future<String> addExam(String userId, List exam) async {
    print(exam);
    if (exam == null || exam == []) {
      return null;
    }
    var dateTime = DateTime.now();
    dateTime.format('D, M j, H:i');
    try {
      await FirebaseFirestore.instance
          .collection('exam')
          .doc(userId)
          .collection('mcq')
          .doc()
          .set({
        'exam': exam,
        'date': dateTime.format(DateTimeFormats.american),
        'len': exam.length,
        'score': (0 / exam.length * 10).toString(),
        'state': 'wait'
      });
      notifyListeners();
      return 'success';
    } on FirebaseAuthException catch (e) {
      notifyListeners();
      return e.message;
    }
  }
  Future<String> deleteExam(String userId,String docrId) async {

    try {
      await FirebaseFirestore.instance
          .collection('exam')
          .doc(userId)
          .collection('mcq')
          .doc(docrId)
          .delete();
      notifyListeners();
      return 'success';
    } on FirebaseAuthException catch (e) {
      notifyListeners();
      return e.message;
    }
  }
  Future<String> addLecture(String userId, lecture) async {
    if (lecture == null || lecture == {}) {
      return null;
    }
    try {
      await FirebaseFirestore.instance
          .collection('Lectures')
          .doc(userId)
          .collection('Lecture')
          .doc()
          .set(lecture);
      notifyListeners();
      return 'success';
    } on FirebaseAuthException catch (e) {
      notifyListeners();
      return e.message;
    }
  }
  Future<String> deleteLecture(String userId,String docrId) async {

    try {
      await FirebaseFirestore.instance
          .collection('Lectures')
          .doc(userId)
          .collection('Lecture')
          .doc(docrId)
          .delete();
      notifyListeners();
      return 'success';
    } on FirebaseAuthException catch (e) {
      notifyListeners();
      return e.message;
    }
  }
  //---------------get Exam from Firebase---------------------------
  getExams(examId, exam) async {
    var dateTime = DateTime.now();
    dateTime.format('D, M j, H:i');
    await FirebaseFirestore.instance
        .collection('exam')
        .doc(_user.uid)
        .collection('mcq')
        .doc(examId)
        .update({
      'solove_date': dateTime.format(DateTimeFormats.american),
      'score': exam,
      'state': 'done'
    });
    notifyListeners();
  }

  //---------------get All Exam from Firebase---------------------------
}
