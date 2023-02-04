import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

final playList=ConcatenatingAudioSource(children: [
  AudioSource.uri(
    Uri.parse('asset:///assets/audio/allah.mp3'),
    // 'assets/audio/audio.mp3',
    tag: MediaItem(
        id: '0',
        title: 'ASMA UL HUSNA',
        artist: "AL-KURAN",
        artUri:Uri.parse("https://firebasestorage.googleapis.com/v0/b/fir-withandroid-109ab.appspot.com/o/allah.png?alt=media&token=a52dd643-6dec-4009-b088-067052b2b440")
    ),
  ),
  AudioSource.uri(
    Uri.parse('asset:///assets/audio/yaseen.mp3'),
    // 'assets/audio/audio.mp3',
    tag: MediaItem(
      id: '1',
      title: 'SURAH YASEEN',
      artist: "AL-KURAN",
      artUri:Uri.parse("https://firebasestorage.googleapis.com/v0/b/fir-withandroid-109ab.appspot.com/o/1yaseen.png?alt=media&token=c4485a10-ff29-4f97-9c1a-34b008d6adbd")
    ),
  ),

  AudioSource.uri(
    Uri.parse('asset:///assets/audio/rahman.mp3'),
    tag: MediaItem(
      id: '2',
      title: 'SURAH RAHMAN',
      artist: "AL-KURAN",
      artUri: Uri.parse("https://firebasestorage.googleapis.com/v0/b/fir-withandroid-109ab.appspot.com/o/1rahman.png?alt=media&token=86630a9f-1df6-477a-80e8-b83b983695bd")
    ),
  ),

  AudioSource.uri(
    Uri.parse('asset:///assets/audio/waqia.mp3'),
    tag: MediaItem(
      id: '3',
      title: 'SURAH WAQIA',
      artist: "AL-KURAN",
      artUri: Uri.parse("https://firebasestorage.googleapis.com/v0/b/fir-withandroid-109ab.appspot.com/o/1wakia.png?alt=media&token=742fd855-4433-479a-83d0-7373927f888e")
    ),
  ),

  AudioSource.uri(
    Uri.parse('asset:///assets/audio/mulk.mp3'),
    tag: MediaItem(
      id: '4',
      title: 'SURAH MULK',
      artist: "AL-KURAN",
      artUri: Uri.parse("https://firebasestorage.googleapis.com/v0/b/fir-withandroid-109ab.appspot.com/o/1mulk.png?alt=media&token=0fc07033-336c-4b8e-8efa-52d1c5fb71fa")
    ),
  ),

  AudioSource.uri(
    Uri.parse('asset:///assets/audio/kahaf.mp3'),
    tag: MediaItem(
      id: '5',
      title: 'SURAH KAHAF',
      artist: "AL-KURAN",
      artUri: Uri.parse("https://firebasestorage.googleapis.com/v0/b/fir-withandroid-109ab.appspot.com/o/1kahaf.png?alt=media&token=ccc745a5-12a0-4a8c-bbc6-a9d2dfc27702")
    ),
  ),

  AudioSource.uri(
    Uri.parse('asset:///assets/audio/muhammad.mp3'),
    // 'assets/audio/audio.mp3',
    tag: MediaItem(
        id: '6',
        title: 'ASMA UL NABI',
        artist: "AL-KURAN",
        artUri:Uri.parse("https://firebasestorage.googleapis.com/v0/b/fir-withandroid-109ab.appspot.com/o/muhammad.png?alt=media&token=c3cc0428-6b2a-4004-90ca-8b4cee69aeac")
    ),
  ),

]);

class PositionData{
  final Duration position;
  final Duration bufferPosition;
  final Duration duration;
  const PositionData({required this.position,
    required this.bufferPosition,
    required this.duration});
}