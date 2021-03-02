import 'package:cms/provider/auth_provider.dart';
import 'package:cms/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'appTheme.dart';

class RoleIDPage extends StatefulWidget {
  @override
  _RoleIDPageState createState() => _RoleIDPageState();
}

class _RoleIDPageState extends State<RoleIDPage> {
  FirebaseAuth instance = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<AuthProvider>(context);
    return Scaffold(
        backgroundColor: AppTheme.white,
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            SizedBox(
              height: getScreenHeight(50),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: getScreenHeight(300),
              decoration: BoxDecoration(
                  //    borderRadius: BorderRadius.only(bottomLeft:  Radius.circular(75),bottomRight:  Radius.circular(75)),
                  color: AppTheme.white),
              child: Image.asset(
                'assets/hei.png',
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: AppTheme.white,
              ),
              child: Text(
                "Choose Category",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'SirinStencil',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.nearlyBlack),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              color: AppTheme.white,
              margin: EdgeInsets.only(top: 25, bottom: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      width: getScreenWidth(150),
                      child: Column(
                        children: <Widget>[
                          FlatButton(
                            child: Image.asset(
                              'assets/t.jpg',
                            ),
                            onPressed: () {
                              pro.checkSignIn(1);
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Teacher",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'SirinStencil',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.black),
                          ),
                        ],
                      )),
                  Container(
                      width: getScreenWidth(200),
                      child: Column(
                        children: <Widget>[
                          FlatButton(
                            child: Image.asset(
                              'assets/boarding/manthumbs.png',
                            ),
                            onPressed: () {
                              pro.checkSignIn(2);
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Student",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'SirinStencil',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.black),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ],
        )));
  }
}
