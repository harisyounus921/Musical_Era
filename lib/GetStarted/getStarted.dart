import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_player/SourahScreen/SorahScreen.dart';

class getStrated extends StatelessWidget {
  const getStrated({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Column(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                height: 450,
                width: MediaQuery.of(context).size.width,
                child: const Image(
                  image: AssetImage("assets/start.png",),
                  fit: BoxFit.cover,),

              ),
            ),
            Column(
              children: [
                Text(
                  "WELCOME TO THE",
                  style: GoogleFonts.oswald(
                    color: Colors.black,
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontSize: 48,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Text(
                  "FIVE SURAH",
                  style: GoogleFonts.oswald(
                    color: Colors.black,
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontSize: 48,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Text(
                  "COLLECTION",
                  style: GoogleFonts.oswald(
                    color: Colors.black,
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontSize: 48,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.arrow_circle_right),
                  label:Text(
                    "LET'S START",
                    style: GoogleFonts.oswald(
                      color:Colors.grey[300],
                      textStyle: Theme.of(context).textTheme.headline4, fontSize: 23,
                      fontWeight: FontWeight.w700, fontStyle: FontStyle.italic,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    onPrimary: Colors.grey[300],
                    minimumSize: Size(double.infinity,60),
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SorahPage(indexnumber: 1)));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
