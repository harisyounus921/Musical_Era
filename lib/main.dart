import 'package:flutter/material.dart';
import 'package:music_player/GetStarted/getStarted.dart';
import 'package:music_player/splashScreen/spashScreen.dart';
import 'package:just_audio_background/just_audio_background.dart';

Future<void> main()async {
  await JustAudioBackground.init(
   androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home:const spalshScreen()
    );
  }
}
