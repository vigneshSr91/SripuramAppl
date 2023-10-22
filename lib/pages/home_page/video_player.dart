import 'package:flutter/material.dart';

import '../../models/videos_list.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatefulWidget {

  const VideoPlayerScreen({super.key, required this.videoItem});
  final VideoItem videoItem;
  
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
  

}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late YoutubePlayerController _controller;
  late bool _isPlayerReady;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isPlayerReady = false;
    _controller = YoutubePlayerController(
                      initialVideoId: widget.videoItem.video.resourceId.videoId,
                      flags: const YoutubePlayerFlags(
                        mute: false,
                        autoPlay: true,

                      ),
                      )..addListener(_listener);
    
  }

  void _listener(){

  }

  @override
  void deactivate(){
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.videoItem.video.title),
      ),
      body: Container(
        child: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  
                  onReady: (){
                    _isPlayerReady = true;
                  },),
      ),
    );
}

}