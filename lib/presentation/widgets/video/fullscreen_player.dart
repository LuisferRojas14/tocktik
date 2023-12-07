import 'package:flutter/material.dart';
import 'package:tocktik/presentation/widgets/video/video_background.dart';
import 'package:video_player/video_player.dart';

class FullscreenPlayer extends StatefulWidget {
  final String videoUrl;
  final String caption;
  const FullscreenPlayer(
      {super.key, required this.videoUrl, required this.caption});

  @override
  State<FullscreenPlayer> createState() => _FullscreenPlayerState();
}

class _FullscreenPlayerState extends State<FullscreenPlayer> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset(widget.videoUrl)
      ..setVolume(0) // sirve para quitar el sonido
      ..setLooping(true) // sirve para que se repita el video
      ..play(); // sirve para que el video se reproduzca
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
              child: CircularProgressIndicator(
                  strokeWidth:
                      2)); // esto es un loading mientras se carga el video, es como una pantalla de carga
        }
        return GestureDetector(
          onTap: () {
            if (controller.value.isPlaying) {
              controller.pause();
              return;
            }
              controller.play();
          },
          child: AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: Stack(
                children: [
                  VideoPlayer(controller), // esto es el video

                  //Gradient
                  VideoBackground(
                    stops: const [0.8, 1.0],
                  ),

                  //texto
                  Positioned(
                    bottom: 50,
                    left: 20,
                    child: _videoCaption(caption: widget.caption),
                  )
                ],
              )),
        );
      },
    );
  }
}

// ignore: camel_case_types
class _videoCaption extends StatelessWidget {
  final String caption;
  const _videoCaption({required this.caption});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return SizedBox(
      width: size.width * 0.6,
      child: Text(caption, maxLines: 2, style: titleStyle),
    );
  }
}
