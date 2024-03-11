//Currently working on it

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Reel {
  final String title;
  final String videoUrl;

  Reel({required this.title, required this.videoUrl});
}

class Reels extends StatelessWidget {
  final List<Reel> reels = [
    Reel(title: 'Reel 1', videoUrl: 'assets/videos/muscle.mp4'),
    Reel(title: 'Reel 2', videoUrl: 'assets/videos/muscle.mp4'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reels'),
      ),
      body: ReelsList(reels: reels),
    );
  }
}

class ReelsList extends StatelessWidget {
  final List<Reel> reels;

  ReelsList({Key? key, required this.reels}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: reels.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(reels[index].title),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    VideoPlayerScreen(videoUrl: reels[index].videoUrl),
              ),
            );
          },
        );
      },
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;

  VideoPlayerScreen({required this.videoUrl});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
      ),
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
