import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

final playList=ConcatenatingAudioSource(children: [
  AudioSource.uri(
    Uri.parse('asset:///assets/audio/audio.mp3'),
    // 'assets/audio/audio.mp3',
    tag: MediaItem(
      id: '0',
      title: 'Song1',
      artist: "normal",
      //like:false,
      artUri: Uri.parse(
          'http://images.unsplash.com/photo-1433086966358-54859d0ed716'
      ),
    ),
  ),

  AudioSource.uri(
    Uri.parse('asset:///assets/audio/mi6.mp3'),
    tag: MediaItem(
      id: '1',
      title: 'Song2',
      artist: "mission imposible",
      artUri: Uri.parse('https://images.unsplash.com/photo-1533395427226-788cee25cc7b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGJ1cmclMjBkdWJhaXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=400&q=60'
      ),
    ),
  ),

  AudioSource.uri(
    Uri.parse('asset:///assets/audio/audio.mp3'),
    tag: MediaItem(
      id: '2',
      title: 'Song3',
      artist: "normal",
      artUri: Uri.parse('https://images.unsplash.com/photo-1566842937027-437d91739e89?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fHNvbmdzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=400&q=60'),
    ),
  ),

  AudioSource.uri(
    Uri.parse('asset:///assets/audio/mi6.mp3'),
    tag: MediaItem(
      id: '3',
      title: 'Song4',
      artist: "mission imposible",
      artUri: Uri.parse('https://images.unsplash.com/photo-1533395427226-788cee25cc7b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGJ1cmclMjBkdWJhaXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=400&q=60'),
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