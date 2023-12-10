

import 'package:tocktik/domain/datasource/video_posts_datasource.dart';
import 'package:tocktik/domain/entities/video_post.dart';
import 'package:tocktik/infrastructure/models/local_video_model.dart';
import 'package:tocktik/shared/data/local_video_posts.dart';

class LocalVideoDatasource implements VideoPostDatasource{
  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    await Future.delayed(const Duration(seconds: 2));
      final List<VideoPost> newvideos = videoPosts.map((video ) => LocalVideoModel.fromJson(video).toVideoPostEntity()).toList(); //video local


      return newvideos;
  }

}