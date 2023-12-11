import 'package:flutter/material.dart';
import 'package:tocktik/domain/entities/video_post.dart';
import 'package:tocktik/domain/repositories/video_posts_repository.dart';


class DiscoverProvider extends ChangeNotifier {
  final VideoPostRepository videosRepositoy;
  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({required this.videosRepositoy});

  Future<void> loadNextPage() async {
    // await Future.delayed(const Duration(seconds: 2));
    // final List<VideoPost> newvideos = videoPosts.map((video ) => LocalVideoModel.fromJson(video).toVideoPostEntity()).toList(); //video local

    final newVideos = await videosRepositoy.getTrendingVideosByPage(1);

    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
