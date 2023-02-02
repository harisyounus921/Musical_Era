import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart'as RX;
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:music_player/modal/modal.dart';
import 'package:music_player/playList/playList.dart';
import 'package:music_player/weidgets/neuBox.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SongPage extends StatefulWidget {
  int indexnumber;
  SongPage({Key? key,required this.indexnumber}) : super(key: key);

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {


  AudioPlayer audioPlayer=AudioPlayer();
  List<String> itemList=[];

  SharedPreferences? sp;
  @override
  void initState() {
    super.initState();
    initializer();
    getSharedPrefs();
  }
  getSharedPrefs() async {
     sp = await SharedPreferences.getInstance();
  }
  Future<void>initializer()async{
    await audioPlayer.setLoopMode(LoopMode.all);
    await audioPlayer.setAudioSource(playList);
  }
  @override
  void dispose() {
    super.dispose();
    audioPlayer.dispose();
  }

  Stream<PositionData>get PositionDataStream=>
      RX.Rx.combineLatest3<Duration,Duration,Duration?,PositionData>(
        audioPlayer.positionStream,
        audioPlayer.bufferedPositionStream,
        audioPlayer.durationStream,
            (a, b, c) => PositionData(position: a,
            bufferPosition: b,
            duration: c??Duration.zero),);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                const SizedBox(height: 10),
                // back button and menu button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){ },
                        child: const SizedBox(
                            height: 60,
                            width: 60,
                            child: NeuBox(child: Icon(Icons.arrow_back))),
                        ),
                    const Text('M U S I C A L     E R A'),
                    InkWell(
                      onTap: (){
                        audioPlayer.pause;
                        audioPlayer.dispose();
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const playListScreen()));
                      },
                      child: const SizedBox(
                        height: 60,
                        width: 60,
                        child: NeuBox(child: Icon(Icons.menu)),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                StreamBuilder<SequenceState?>(
                  stream: audioPlayer.sequenceStateStream,
                    builder:(context,snapshot){
                    final state=snapshot.data;
                    if(state?.sequence.isEmpty??true){
                      return const SizedBox();
                    }
                    final metaData=state!.currentSource!.tag as MediaItem;
                    return   NeuBox(
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child:
                            CachedNetworkImage(imageUrl: metaData.artUri.toString(), height: 400, width: 400, fit: BoxFit.cover,),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      metaData.title,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.grey.shade700,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      metaData.artist??"",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                      ),
                                    ),
                                  ],
                                ),
                                 InkWell(
                                   onTap: ()async{
                                     if(sp!.getStringList("like")!.contains(metaData.id.toString())){
                                       print("dislike");
                                       print( sp!.getStringList("like"));
                                       itemList= sp!.getStringList("like")!;
                                       itemList.remove(metaData.id);
                                        sp!.setStringList("like",itemList);
                                       print( sp!.getStringList("like"));

                                       final snackBar = SnackBar(
                                         content: const Text('Removed from Like List!'),
                                         backgroundColor: (Colors.black12),
                                         action: SnackBarAction(
                                           label: 'dismiss',
                                           onPressed: () {},
                                         ),
                                       );
                                       ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                     }else{
                                       print("like");
                                       print( sp!.getStringList("like"));
                                       print(metaData.id.toString());
                                       itemList= sp!.getStringList("like")!;
                                       itemList.add(metaData.id);
                                       sp!.setStringList("like",itemList);
                                       print(sp!.getStringList("like"));
                                       final snackBar = SnackBar(
                                         content: const Text('Add in like list!'),
                                         backgroundColor: (Colors.black12),
                                         action: SnackBarAction(
                                           label: 'dismiss',
                                           onPressed: () {
                                           },
                                         ),
                                       );
                                       ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                     }
                                   },
                                   child:
                                     Icon(
                                     Icons.favorite,
                                     color: sp!.getStringList("like")!.contains(metaData.id)? Colors.red:Colors.white,
                                     size: 32,
                                   ),
                                 ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }),

                const SizedBox(height: 30),

                StreamBuilder<PositionData>(
                    stream: PositionDataStream,
                    builder: (context,snapshot){
                      final positionData=snapshot.data;
                      return NeuBox(
                        child: ProgressBar(
                          progress: positionData?.position??Duration.zero,
                          total:  positionData?.duration??Duration.zero,
                          buffered:  positionData?.bufferPosition??Duration.zero,
                          onSeek: audioPlayer.seek,

                          barHeight: 8,
                          baseBarColor: Colors.grey[600],
                          bufferedBarColor: Colors.grey,
                          progressBarColor: Colors.green,
                          thumbColor: Colors.green,
                          timeLabelTextStyle: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                      },
                ),

              //  const SizedBox(height: 30),

                // start time, shuffle button, repeat button, end time
                /*Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:[
                    InkWell(onTap:(){},child: Icon(Icons.shuffle)),
                    InkWell(onTap:(){},child: Icon(Icons.repeat)),
                  ],
                ),*/

                const SizedBox(height: 30),

                SizedBox(
                  height: 80,
                  child: Row(
                    children: [
                      Expanded(
                        child: NeuBox(
                            child: IconButton(
                              iconSize: 32,
                              onPressed: audioPlayer.seekToPrevious,
                              icon: const Icon(Icons.skip_previous),
                            )),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        flex: 2,
                        child: Player(audioPlayer: audioPlayer,),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: NeuBox(
                            child: IconButton(
                              icon:const Icon(Icons.skip_next),
                              iconSize: 32,
                              onPressed: audioPlayer.seekToNext,
                            )),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class Player extends StatelessWidget {
  final AudioPlayer audioPlayer;
  const Player({Key? key, required this.audioPlayer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PlayerState>(
        stream: audioPlayer.playerStateStream,
        builder: (context,snaphot)
        {
          final playerState=snaphot.data;
          final processingState=playerState?.processingState;
          final player=playerState?.playing;
          if(!(player??false))
            {
              return InkWell(
                onTap: audioPlayer.play,
                child: const NeuBox(
                    child: Icon(
                      Icons.play_arrow,
                      size: 32,
                    )),
              );
            }else if(processingState!=ProcessingState.completed){
            return  InkWell(
              onTap: audioPlayer.pause,
              child: const NeuBox(
                  child: Icon(
                  Icons.pause,
                  size: 32,
              )),
            );
          }
          return const NeuBox(
              child: Icon(
                Icons.play_arrow,
                size: 32,
              ),);
        },
    );
  }
}
class likeButton extends StatelessWidget {
  SharedPreferences sp;
  likeButton({Key? key,required this.sp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      sp.getStringList('like')!.contains("1")?
      const Icon(
        Icons.favorite,
        color: Colors.red,
        size: 32,
      ):
      const Icon(
        Icons.favorite,
        color: Colors.white,
        size: 32,
      ),
    );
  }
}
