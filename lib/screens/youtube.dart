import 'package:fb_audience_network/fb_audience_network.dart';
import 'package:flutter/material.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_insta/flutter_insta.dart';
import 'package:flutter_youtube_downloader/flutter_youtube_downloader.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';
import 'package:social_downloader/screens/reels.dart';
class Youtube extends StatefulWidget {

  Youtube({Key? key}) : super(key: key);

  @override
  _YoutubeState createState() => _YoutubeState();
}

class _YoutubeState extends State<Youtube> {

// FB END
  bool hasTapped = false;
   bool isInterstitialAdLoaded = false;
  bool isRewardedAdLoaded = false;
  bool isRewardedVideoComplete = false;
   TextEditingController textController = TextEditingController();
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

  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
 

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.red,
      //  floatingActionButton:
               floatingActionButton: FabCircularMenu(
                              alignment: Alignment.bottomRight,
            ringColor: Colors.redAccent,
            ringDiameter: 500.0,
            ringWidth: 150.0,
            fabSize: 64.0,
            fabElevation: 8.0,
            fabIconBorder: CircleBorder(),
            fabColor: Colors.red,
            fabOpenIcon: Icon(Icons.add, color: Colors.white),
            fabCloseIcon: Icon(Icons.close, color: Colors.white),
            fabMargin: const EdgeInsets.all(16.0),
            animationDuration: const Duration(milliseconds: 800),
            animationCurve: Curves.easeInOutCirc,
            onDisplayChange: (isOpen) {
              _showSnackBar(context, "The menu is ${isOpen ? "open" : "closed"}");
            
            },
          children: <Widget>[
            // Container(),
              RawMaterialButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>ReelsWidget(),));
                disposew();
                },
                shape: CircleBorder(),
                padding: const EdgeInsets.all(24.0),
                child: Text("Instagram",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
                ),
              ),
              RawMaterialButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>ReelsWidget(),));
                disposew();
                },
                shape: CircleBorder(),
                padding: const EdgeInsets.all(24.0),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/ig.png"))),
                ),
              ),
              // Container()
            ]
        ),
       
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[900],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                //AppBar Section

        
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      GestureDetector(
                        onTap: (){
                          loadInterstitialAd();
                          showInterstitialAd();
                          // loadRewardedVideoAd();
                          },
                        child: Image.asset(
                          'assets/images/logonobg.png',
                          width: 80,
                          height: 80,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Text(
                          'Youtube \nDownloader',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Lexend Deca',
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                //Container Section
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height - 213,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35),
                        ),
                      ),
                      child: Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 40, 0, 0),
                              child: Text(
                                'Youtube',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.grey[900],
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Text(
                                'Videos',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: 'Lexend Deca',
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
                              child: TextFormField(
                               
                                controller: textController,
                                // onFieldSubmitted: hasSubmitted,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Youtube URL Link',
                                  labelStyle: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Lexend Deca',
                                  ),
                                  hintText: 'Link...',
                                  hintStyle: TextStyle(
                                    fontFamily: 'Lexend Deca',
                                    color: Colors.white,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x9AFFFFFF),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x9AFFFFFF),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey[900],
                                  prefixIcon: Icon(
                                    Icons.content_copy,
                                    color: Colors.white,
                                  ),
                                ),
                                style: TextStyle(
                                    fontFamily: 'Lexend Deca',
                                    color: Colors.redAccent),
                                keyboardType: TextInputType.emailAddress,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return 'Please fill in the video link';
                                  }

                                  return null;
                                },
                              ),
                            ),

                             //Button
                !hasTapped
                    ? Padding(
                        padding: EdgeInsets.only(top: 40),
                        child: Center(
                          child: GestureDetector(
                           onTap: 
                           (){
                             downloadVideo();
                             setState(() async{
                               hasTapped =true;
                               
                             });
                           },
                            child: _animatedButtonUI,
                          ),
                        ),
                      )
                    : Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text("Downloading"),
                    ),

                //SocialMediaAnimation
                !hasTapped ?Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Container(
                            width: 300,
                            height: 100,
                            child:  LottieBuilder.asset('assets/lottie/yt.json'),
                          ),
                        ),
                      ):Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Container(
                            width: 300,
                            height: 150,
                            child:  GestureDetector(
                              onTap: (){
                             hasTapped=true;
                              },
                              child: LottieBuilder.asset('assets/lottie/downloading.json')),
                          ),
                        ),
                      )
                
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

               
              ],
            ),
          ),
        ),
      ),
    );
  }

  //button
  Widget get _animatedButtonUI => Container(
        height: 40,
        width: 300,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0),
            boxShadow: [
              BoxShadow(
                color: Color(0x80000000),
                blurRadius: 30.0,
                offset: Offset(0.0, 5.0),
              ),
            ],
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.black,
                Color(0x4267B2),
              ],
            )),
        child: Center(
          child: Text(
            'Download',
            style: TextStyle(
                // fontSize: 30.0,s
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
      );



    void _showSnackBar(BuildContext context, String message) {
    Scaffold.of(context).showSnackBar(
        SnackBar(
      content: Text(message),
      duration: const Duration(milliseconds: 1000),
        )
    );
  }


      Future<void> downloadVideo() async {
        loadInterstitialAd();
        showInterstitialAd();
        final result = await FlutterYoutubeDownloader.downloadVideo(
            textController.text, "Social Downloader", 18);
        print(result);
      }
      void disposew(){
  setState(() {
    super.dispose();
  });
      }
}

