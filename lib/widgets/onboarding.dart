import 'package:fb_audience_network/ad/ad_banner.dart';
import 'package:fb_audience_network/fb_audience_network.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:onboarding/onboarding.dart';
import 'package:social_downloader/screens/reels.dart';


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  // FB END
  bool hasTapped = false;
   bool isInterstitialAdLoaded = false;
  bool isRewardedAdLoaded = false;
  bool isRewardedVideoComplete = false;
  @override
  void initState() {
loadInterstitialAd();
loadRewardedVideoAd();

  FacebookAudienceNetwork.init(
    
      testingId: "b9f2908b-1a6b-4a5b-b862-ded7ce289e41",
    );

    super.initState();
  }
    void loadInterstitialAd() {
    FacebookInterstitialAd.loadInterstitialAd(
      placementId:
          "539689593325231_875257409768446", //"IMG_16_9_APP_INSTALL#2312433698835503_2650502525028617" YOUR_PLACEMENT_ID
      listener: (result, value) {
        print(">> FAN > Interstitial Ad: $result --> $value");
        if (result == InterstitialAdResult.LOADED)
        isInterstitialAdLoaded = true;

        /// Once an Interstitial Ad has been dismissed and becomes invalidated,
        /// load a fresh Ad by calling this function.
        if (result == InterstitialAdResult.DISMISSED &&
            value["invalidated"] == true) {
          isInterstitialAdLoaded = false;
          loadInterstitialAd();
        }
      },
    );
  }

  showInterstitialAd() {
     if (isInterstitialAdLoaded == true)
      FacebookInterstitialAd.showInterstitialAd();
    else
      print("Interstial Ad not yet loaded!");
  }

   showRewardedAd() {
    if (isRewardedAdLoaded == true)
      FacebookRewardedVideoAd.showRewardedVideoAd();
    else
      print("Rewarded Ad not yet loaded!");
  }

  showBannerAd() {
  FacebookBannerAd(
        // placementId:
        //     "IMG_16_9_APP_INSTALL#2312433698835503_2964944860251047", //testid
        bannerSize: BannerSize.STANDARD,
        listener: (result, value) {
          print("Banner Ad: $result -->  $value");
        },
      );
  }

    void loadRewardedVideoAd() {
    FacebookRewardedVideoAd.loadRewardedVideoAd(
      placementId: "539689593325231_875239713103549",
      listener: (result, value) {
        print("Rewarded Ad: $result --> $value");
        if (result == RewardedVideoAdResult.LOADED) isRewardedAdLoaded = true;
        if (result == RewardedVideoAdResult.VIDEO_COMPLETE)
          isRewardedVideoComplete = true;

        /// Once a Rewarded Ad has been closed and becomes invalidated,
        /// load a fresh Ad by calling this function.
        if (result == RewardedVideoAdResult.VIDEO_CLOSED &&
            (value == true || value["invalidated"] == true)) {
          isRewardedAdLoaded = false;
          loadRewardedVideoAd();
        }
      },
    );
  }
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
      home: GestureDetector(
        onTap: (){
          loadInterstitialAd();
        },
        child: Onboarding(
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
      ),
    );
  }
}