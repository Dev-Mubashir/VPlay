import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:vplay/BottomNavBar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // These are the controllers for the video player and the initialization future.
  late VideoPlayerController _videoPlayerController;
  late Future<void> _videoPlayerFuture;

  @override
  void initState() {
    super.initState();
    // Initialize the video player controller with a video from the assets.
    _videoPlayerController = VideoPlayerController.asset(
      'assets/videos/graphics.mp4',
    );
    // Store the Future provided by the initialize method.
    // This will be used later in the FutureBuilder.
    _videoPlayerFuture = _videoPlayerController.initialize();
  }

  @override
  void dispose() {
    // disposing of controllers to free up resources.
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child: Text(
            "VPlay Video Player",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ),
      body: FutureBuilder(
        // Using the stored Future for the FutureBuilder.
        future: _videoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the video.
            final chewieController = ChewieController(
              videoPlayerController: _videoPlayerController,
              autoPlay: true,
              looping: true,
            );

            return AspectRatio(
              aspectRatio: _videoPlayerController.value.aspectRatio,
              child: Chewie(
                controller: chewieController,
              ),
            );
          } else {
            // If the Future is not complete, display a loading spinner.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      // Display the bottom navigation bar.
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
