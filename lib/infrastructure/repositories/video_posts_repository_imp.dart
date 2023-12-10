import 'package:tocktik/domain/datasource/video_posts_datasource.dart';
import 'package:tocktik/domain/entities/video_post.dart';
import 'package:tocktik/domain/repositories/video_posts_repository.dart';

class VideoPostsRepositoryImp implements VideoPostRepository {
  
  late final VideoPostDatasource videosDatasource;

  VideoPostsRepositoryImp({
    required this.videosDatasource
    });

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    return videosDatasource.getTrendingVideosByPage(page);
  }
}
