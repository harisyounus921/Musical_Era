import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_player/GetStarted/getStarted.dart';
import 'dart:async';
import 'package:music_player/SourahScreen/SorahScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class spalshScreen extends StatefulWidget {
  const spalshScreen({Key? key}) : super(key: key);

  @override
  _spalshScreenState createState() => _spalshScreenState();
}

class _spalshScreenState extends State<spalshScreen> {
  @override
  void initState() {
    super.initState();
    login();
  }

  void login(){
    Timer(const Duration(seconds: 2), ()async{
      //SharedPreferences.setMockInitialValues({});
      final sp = await SharedPreferences.getInstance();
      bool islogin= sp.getBool("islogin")??false;

      if(islogin){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>SorahPage(indexnumber: 1)));
      }else{
        sp.setBool("islogin",true);
        sp.setStringList("like", <String>[]);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>getStrated()));
      }

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 400,
              width: MediaQuery.of(context).size.width,
              child: const Image(
                image: AssetImage("assets/splash.png"),
              ),
            ),
          ),
          Text(
            "AL QURAN",
            style: GoogleFonts.oswald(
              color: Colors.black54,
              textStyle: Theme.of(context).textTheme.headline4,
              fontSize: 48,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.italic,
            ),
          ),
          Text(
            "FIVE SURAH",
            style: GoogleFonts.oswald(
              color: Colors.black54,
              textStyle: Theme.of(context).textTheme.headline4,
              fontSize: 48,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}


