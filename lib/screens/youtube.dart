import 'package:flutter/material.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_insta/flutter_insta.dart';
import 'package:flutter_youtube_downloader/flutter_youtube_downloader.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

   TextEditingController textController = TextEditingController();
  @override
  void initState() {
 
    super.initState();
  }

  

  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
  }

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
                super.dispose();
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
                super.dispose();
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
                      Image.asset(
                        'assets/images/logonobg.png',
                        width: 80,
                        height: 80,
                        fit: BoxFit.contain,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Text(
                          'Facebook Downloader',
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
//REELS
//Download reel video on button clickl
  // void download() async {
  

  // // facebook
  //   // var myvideourl = await flutterInsta.downloadReels(textController.text);

  //   // await FlutterDownloader.enqueue(
  //   //   url: '$myvideourl',
  //   //   savedDir: '/sdcard/Download',
  //   //   showNotification: true,
  //   //   // show download progress in status bar (for Android)
  //   //   openFileFromNotification: true, // click on notification to open downloaded file (for Android)
  //   // ).whenComplete(() {
  //   //   Fluttertoast.showToast(msg: "Download Has Started");
  //   //   setState(() {
  //   //     hasTapped = false; // set to false to stop Progress indicator
  //   //   });
  //   // });
  // }

      Future<void> downloadVideo() async {
        final result = await FlutterYoutubeDownloader.downloadVideo(
            textController.text, "Video Title goes Here", 18);
        print(result);
      }
}
