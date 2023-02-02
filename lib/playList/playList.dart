import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player/modal/modal.dart';
import 'package:music_player/weidgets/neuBox.dart';
import 'package:music_player/songScreen/songScreen.dart';

class playListScreen extends StatefulWidget {
  const playListScreen({Key? key}) : super(key: key);

  @override
  _playListScreenState createState() => _playListScreenState();
}

class _playListScreenState extends State<playListScreen> {

  AudioPlayer audioPlayer=AudioPlayer();

  @override
  void initState() {
    super.initState();
    initializer();
  }
  Future<void>initializer()async{
    await audioPlayer.setAudioSource(playList);
  }
  @override
  void dispose() {
    super.dispose();
    audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: NeuBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("M U S I C A L     E R A",style: TextStyle(
                    fontSize: 18,fontStyle: FontStyle.italic),
                ),
                Icon(Icons.search),
              ],
        )),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: playList.length,
              itemBuilder: (context,index){
                return StreamBuilder<SequenceState?>(
                    stream: audioPlayer.sequenceStateStream,
                    builder:(context,snapshot){
                      final state=snapshot.data;
                      if(state?.sequence.isEmpty??true){
                        return const SizedBox(child: Text("Loading"),);
                      }
                      final metaData=state!.sequence[index].tag;
                      return listTileSong(
                        ontab:(){
                          audioPlayer.dispose();
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SongPage(indexnumber: index,)));
                        },
                        title: metaData.title,
                        singer: metaData.artist??"",
                        image: metaData.artUri.toString(),
                      );
                    });
              }),
          ),
        ],
      ),
    );
  }
}

class listTileSong extends StatelessWidget {
  String image;
  String singer;
  String title;
  final VoidCallback ontab;

  listTileSong({Key? key,required this.title,required this.image,required this.singer,required this.ontab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontab,

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: NeuBox(
          child: Row(
            children: [
              Container(
                height: 80,
                width: 80,
                padding: const EdgeInsets.all(4),
               // decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(50)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox.fromSize(
                    size: const Size.fromRadius(20),
                    child: CachedNetworkImage(imageUrl: image.toString(),fit:BoxFit.cover ,),
                  ),
                ),
              ),

              const SizedBox(width: 10,),
              Column(
                children: [
                  Text(title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                  fontSize: 18),),
                  const SizedBox(height: 5,),
                  Text(singer,
                    style: const TextStyle(
                      color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),),
                ],
              ),
            ]
          ),
        ),
      ),
    );
  }
}


