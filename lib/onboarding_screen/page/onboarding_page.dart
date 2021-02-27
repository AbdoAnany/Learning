import 'package:cms/roleidpage.dart';
import 'package:cms/size_config.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';


class OnBoardingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return
      Scaffold(
        body: IntroductionScreen(
          pages: [
            PageViewModel(
              title: 'A reader lives a thousand lives',
              body: 'The man who never reads lives only one.',
              image: buildImage('assets/boarding/ebook.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Featured Books',
              body: 'Available right at your fingerprints',
              image: buildImage('assets/boarding/readingbook.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Simple UI',
              body: 'For enhanced reading experience',
              image: buildImage('assets/boarding/manthumbs.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Today a reader, tomorrow a leader',
              body: 'Start your journey',
              footer: buttonWidget(
                 'Start Reading',context,
                 () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => RoleIDPage()),
                ),
              ),
              image: buildImage('assets/boarding/learn.png'),
              decoration: getPageDecoration(),
            ),
          ],
          done: Text('Read', style: TextStyle(fontWeight: FontWeight.w600)),
          onDone: () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => RoleIDPage()),
          ),
          showSkipButton: true,
          skip: Text('Skip'),
          onSkip: () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => RoleIDPage()),
          ),
          next: Icon(Icons.arrow_forward),
          dotsDecorator: getDotDecoration(),
        //  onChange: (index) => print('Page $index selected'),
          globalBackgroundColor: Theme.of(context).primaryColor,
          skipFlex: 0,
          nextFlex: 0,
          // isProgressTap: false,
          // isProgress: false,
          // showNextButton: false,
          // freeze: true,
          // animationDuration: 1000,
        ),
      );
  }

  Widget buildImage(String path) => Center(child: Image.asset(path, width: 350));
  Widget buttonWidget(text,context,onClicked) => RaisedButton(
    onPressed: onClicked,
    color: Theme.of(context).primaryColor,
    shape: StadiumBorder(),
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    child: Text(
      text,
      style: TextStyle(color: Colors.white, fontSize: 16),
    ),
  );
  DotsDecorator getDotDecoration() => DotsDecorator(
        color: Color(0xFFBDBDBD),
        //activeColor: Colors.orange,
        size: Size(10, 10),
        activeSize: Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );

  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 20),
        descriptionPadding: EdgeInsets.all(16).copyWith(bottom: 0),
        imagePadding: EdgeInsets.all(24),
        pageColor: Colors.white,
      );
}
