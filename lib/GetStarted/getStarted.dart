import 'package:flutter/material.dart';
import 'package:music_player/songScreen/songScreen.dart';

class getStrated extends StatelessWidget {
  const getStrated({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SongPage(indexnumber: 1)));
            },
                child: Text('Let Start')),
          ),
        ],
      ),
    );
  }
}
