
import 'package:cms/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';


class AppTheme {
  AppTheme._();
  AppTheme();



 // static const Color bg = Color(0xFFFFFFFE);
  static const Color bg = Color(0xFF01090f);

  static const Color bgt = Color(0xFFFFFFFE);
 // static const Color bgt2 = Color(0xff0a1e2d);
  static const Color bu = Color(0xfffcbb3b);
 // static const Color bu2 = Color(0xFFffc900);

  static String timenow = DateFormat.yMMMd().format(DateTime.now());

  static final logo = new Image.asset(
    'assets/well.png',
    width: 150.0,
    height: 150.0,
  );
  static final logo1 = new Image.asset(
    'assets/el-shorouk.png',
    width: 150.0,
    height: 150.0,
  );





  //
  static const Color transparent = Colors.transparent;
  static const Color notWhite = Color(0xFFEDF0F2);
  static const Color nearlyWhite = Color(0xFFCCEEE7);
  static const Color white = Color(0xFFFFFFFE);
  static const Color black = Color(0xFF000000);
  static const Color red = Color.fromRGBO(200, 0, 0, 1);
  static const Color green = Color.fromRGBO(0, 200, 0, 1);

  static const Color nearlyBlack = Color(0xFF213333);
  static const Color grey = Color(0xFF3A5160);
  static const Color dark_grey = Color(0xFF313A44);

  static const Color darkText = Color(0xFF253840);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);
  static const Color deactivatedText = Color(0xFF767676);
  static const Color dismissibleBackground = Color(0xFF364A54);
  static const Color chipBackground = Color(0xFFEEF1F3);
  static const Color spacer = Color(0xFFF2F2F2);
  static const String fontName = 'WorkSans';

  // This Style for Lables in Entry Pages
  static const TextStyle Question = TextStyle(
    color: AppTheme.white, //
    fontWeight: FontWeight.w400,
    fontSize: 40,
    fontFamily: "Roboto",
  );

  static const TextStyle inputStyle =
      TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold);
  static const TextStyle hintStyle =
      TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w100);
  static const TextStyle TextBuStyle = TextStyle(
    fontSize: 15,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle TitleStyle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white);
  static const TextStyle homeLable = TextStyle(
    color: AppTheme.black, //
    fontWeight: FontWeight.normal,
    fontSize: 25,
  );
  static const TextStyle infoLabletitle = TextStyle(
    // Caption -> caption
    fontFamily: "Roboto",
    fontWeight: FontWeight.normal,
    fontSize: 30,
    letterSpacing: 0.2,
    color: AppTheme.black, // was lightText
  );
  static const TextStyle infoLable = TextStyle(
    // Caption -> caption
    fontFamily: fontName,
    fontWeight: FontWeight.normal,
    fontSize: 20,
    letterSpacing: 0.2,
    color: AppTheme.black, // // was lightText
  );
  static const TextStyle inf20 = TextStyle(
    // Caption -> caption
    fontFamily: fontName,
    fontWeight: FontWeight.normal,
    fontSize: 20,
    letterSpacing: 0.2,
    color: AppTheme.black, // // was lightText
  );
  static const TextStyle inf15 = TextStyle(
    // Caption -> caption
    fontFamily: fontName,
    fontWeight: FontWeight.normal,
    fontSize: 15,
    letterSpacing: 0.2,
    color: AppTheme.black, // // was lightText
  );
  static const TextStyle inf10 = TextStyle(
    // Caption -> caption
    fontFamily: fontName,
    fontWeight: FontWeight.normal,
    fontSize: 10,
    letterSpacing: 0.2,
    color: AppTheme.black, // // was lightText
  );

  static const keyboardTypenumber = TextInputType.number;
  static const keyboardTypetext = TextInputType.text;
  static const keyboardTypeemail = TextInputType.emailAddress;
  static const keyboardTypedate = TextInputType.datetime;
  static const keyboardTypepass = TextInputType.visiblePassword;


  ThemeData theme() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: "Muli",
      appBarTheme: appBarTheme(),
      textTheme: textTheme(),
      inputDecorationTheme: inputDecorationTheme(),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  InputDecorationTheme inputDecorationTheme() {
    OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: kTextColor),
      gapPadding: 10,
    );
    return InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      border: outlineInputBorder,
    );
  }

  TextTheme textTheme() {
    return TextTheme(
      bodyText1: TextStyle(color: kTextColor),
      bodyText2: TextStyle(color: kTextColor),
    );
  }

  AppBarTheme appBarTheme() {
    return AppBarTheme(
      color: Colors.white,
      elevation: 0,
      brightness: Brightness.light,
      iconTheme: IconThemeData(color: Colors.black),
      textTheme: TextTheme(
        headline6: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
      ),
    );
  }

  static const IconId = Icon(
    Icons.confirmation_number,
    size: 25,
    color: Colors.black,
  );
  static const IconIq = Icon(
    null,
    size: 25,
    color: Colors.black,
  );
  static const IconIanswer = Icon(
    Icons.question_answer,
    size: 25,
    color: Colors.black,
  );
  static const Iconpass = Icon(
    Icons.lock,
    size: 25,
    color: Colors.black,
  );
  static const Icongrade = Icon(
    Icons.contact_mail,
    size: 25,
    color: Colors.black,
  );
  static const Icondep = Icon(
    Icons.account_balance,
    size: 25,
    color: Colors.black,
  );
  static const Iconname = Icon(
    Icons.person,
    size: 25,
    color: Colors.white,
  );
  static const Iconemail = Icon(
    Icons.email,
    size: 25,
    color: Colors.black,
  );
  static const Iconphone = Icon(
    Icons.phone,
    size: 30,
    color: Colors.black,
  );
  static const Iconback = Icon(
    Icons.fast_rewind,
    size: 30,
    color: Colors.black,
  );
  static const Icondownload = Icon(
    Icons.file_download,
    size: 30,
    color: Colors.black,
  );
  static const Iconcomment = Icon(
    Icons.comment,
    size: 30,
    color: Colors.white,
  );
  static const Icondelelt = Icon(
    Icons.delete,
    size: 30,
    color: Colors.white,
  );

  static Widget logoname(String text, double h,datauser) {
    return
    datauser.profile_image == null
        ? Container(
      alignment: Alignment.center, height: h, width: h,

      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin:Alignment.topLeft ,end: Alignment.bottomRight,

            colors: [ Colors.amber[500],bu]
        ),
        borderRadius: BorderRadius.all(Radius.circular(100)),
        boxShadow: <BoxShadow>[
          BoxShadow(
//                        color: AppTheme.grey.withOpacity(0.6),
//                       offset: Offset(20.0, 4.0),spreadRadius: 10,
              blurRadius: 1),
        ],
        border: Border.all(width: h / 20, color: Colors.white),
      ),
      child: Text(
        text,textAlign: TextAlign.center,
        style: TextStyle(

          color: Colors.black,
          fontSize: h/1.3,
        ),
      ),
    )
        : Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: NetworkImage("https://api.hicit-learning.me/"+datauser.profile_image),fit: BoxFit.cover)),
    )
    ;
  }
  static Widget inputfild(
      String hint, BuildContext context, keyboardType, Icons, contr, visable) {
    return Container(
      margin: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width *.8,
      height: 50,
      decoration: BoxDecoration(
        color: AppTheme.transparent,
        borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(width: 3,color: AppTheme.grey)
      ),
      child:  TextFormField(
        controller: contr,
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintStyle: TextStyle(
              color: AppTheme.grey, fontSize: 20,),

          hintText: hint,
        ),
      ),


    );
  }

  static Widget Abar(String text, BuildContext context) {
    return AppBar(
      title: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w700,
          fontSize: 25,
        ),
      ),
      centerTitle: true,
      leading: Container(
        child: IconButton(
          icon: Icon(
            Icons.fast_rewind,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        color: bu,
      ),
      backgroundColor: AppTheme.bg,
      elevation: 0,
    );
  }


  static Widget info20(String text) {
    return Text(
      text,
      style: inf20,
      maxLines: 50,textScaleFactor: 1.0,
    );
  }

  static Widget info15(String text) {
    return Text(
      text,
      style: inf15,
    );
  }

  static Widget info10(String text) {
    return Text(
      text,
      style: inf10,
    );
  }



  static Widget post1(String name, String Date, String text, String comment,datauser) {

    return Container(
      decoration: BoxDecoration(
        color: AppTheme.bg,

          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 1)],
      ),
      padding: EdgeInsets.all( 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              logoname(name[0] + name[1], 50.0,datauser),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AppTheme.info20(name),
                  AppTheme.info15(Date),

                ],
              ),



            ],
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: AppTheme.info20(text),
          ),
          //  post,
          Container(
            height: 30,
            alignment: Alignment.centerLeft,
            child: AppTheme.info15(comment + " comment"),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.comment,
                    color: Colors.white,
                    size: 20,
                  ),
                  label: Text(
                    "Comment",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  )),
              FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.file_download,
                    color: Colors.white,
                    size: 20,
                  ),
                  label: Text(
                    "DownLoad",
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          )
        ],
      ),
    );
  }

  //________________________________________________________________________________

}





final background = Container(
  decoration: BoxDecoration(
    color: Color(0xff343b45),
//        image: DecorationImage(
//            image: AssetImage('assets/Background.png'), fit: BoxFit.cover)
  ),
);
final post = Container(
  height: 200,
  width: 300,
  decoration: BoxDecoration(
      color: Color(0xff343b45),
      image: DecorationImage(
          image: AssetImage('assets/bgg.png'), fit: BoxFit.cover)),
);
final post22 = Container(
 // height: MediaQuery.of(context).size.height / 3,
 // width: MediaQuery.of(context).size.width,
  decoration: BoxDecoration(
      color: Color(0xff343b45),
      image: DecorationImage(
          image: AssetImage('assets/bgg.png'), fit: BoxFit.cover)),
);


