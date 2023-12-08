import 'package:flutter/material.dart';
import 'package:tocktik/domain/entities/video_post.dart';
import 'package:tocktik/infrastructure/models/local_video_model.dart';
import 'package:tocktik/shared/data/local_video_posts.dart';

class DiscoverProvider extends ChangeNotifier {

  //Todo 1: Create a list of VideoPost and name it videos 
  bool initialLoading = true;
  List<VideoPost> videos = [];

Future<void> loadNextPage() async {
    // await Future.delayed(const Duration(seconds: 2));
  final List<VideoPost> newvideos = videoPosts.map((video ) => LocalVideoModel.fromJson(video).toVideoPostEntity()).toList();


  videos.addAll(newvideos);
  initialLoading = false;
    notifyListeners();
  }
}
