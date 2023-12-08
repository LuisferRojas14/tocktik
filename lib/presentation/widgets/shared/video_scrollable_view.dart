import 'package:flutter/material.dart';
import 'package:tocktik/domain/entities/video_post.dart';
import 'package:tocktik/presentation/widgets/shared/video_buttons.dart';
import 'package:tocktik/presentation/widgets/video/fullscreen_player.dart';

class VideoScrollableview extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableview({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final VideoPost videoPost= videos[index];
        return Stack(
          children: [
            // video player + gradiente
            SizedBox.expand(
            child: FullScreenPlayer(
              caption: videoPost.caption,
              videoUrl: videoPost.videoUrl
            )
           ),
            //botones
             Positioned(
              bottom: 20,
              right: 20,
              child: VideoButtons(video: videoPost)),
          ],
        );
      },
    );
  }
}
