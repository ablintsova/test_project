import 'package:test_project/res/app_strings.dart';

class FeedResponse {
  List<Post>? posts;
  String error;

  FeedResponse({
    this.posts,
    this.error = ""
  });
}

class Post {
  String caption;

  Post({
    required this.caption
  });

  Post.fromJson(Map<String, dynamic> json)
      : caption = json['caption'] == null ? AppStrings.null_caption : json['caption'];
}
