import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:onboarding/onboarding.dart';
import 'package:social_downloader/screens/reels.dart';


class MyApp extends StatelessWidget {
  final onboardingPagesList = [
    PageModel(
      widget: Column(
        children: [
          Container(
              padding: EdgeInsets.only(bottom: 45.0),
              child:   LottieBuilder.asset("assets/lottie/swipe_left.json"),),
          Container(
              width: double.infinity,
              child: Text('SOCIAL DOWNLOAD', style: pageTitleStyle)),
          Container(
            width: double.infinity,
            child: Text(
              'Welcome to the new \n experience',
              style: pageInfoStyle,
            ),
          ),
        ],
      ),
    ),
    PageModel(
      widget: Column(
        children: [
          LottieBuilder.asset("assets/lottie/social_media.json"),
          Text('GET ', style: pageTitleStyle),
          Text(
            'Access to Fast Instagram and \nYoutube Downloader',
            style: pageInfoStyle,
          )
        ],
      ),
    ),
    PageModel(
      widget: Column(
        children: [
         LottieBuilder.asset("assets/lottie/excited.json"),
          Text('EASY', style: pageTitleStyle),
          Text(
            "Let's get Started",
            style: pageInfoStyle,
          ),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Onboarding(
        proceedButtonStyle: ProceedButtonStyle(
          proceedpButtonText: Text("Start",
          style: TextStyle(color: Colors.white),
          ),
          proceedButtonRoute: (context) {
            return Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => ReelsWidget(),
              ),
              (route) => false,
            );
          },
        ),
        pages: onboardingPagesList,
        isSkippable: false,
        indicator: Indicator(
            indicatorDesign: IndicatorDesign.polygon(
                polygonDesign: PolygonDesign(
                    polygon: DesignType.polygon_square, polygonSpacer: 13.0))),
      ),
    );
  }
}