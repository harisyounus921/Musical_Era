import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player/GetStarted/getStarted.dart';
import 'dart:async';
import 'package:music_player/songScreen/songScreen.dart';
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
        Navigator.push(context, MaterialPageRoute(builder: (context)=>SongPage(indexnumber: 1)));
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
      backgroundColor: Colors.grey[500],
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.white70,
          child: const Image(
            image: AssetImage("assets/splash1.png"),
            fit: BoxFit.fitWidth,),
        ),
      ),
    );
  }
}


