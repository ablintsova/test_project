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
    this.caption = ""
  });

  Post.fromJson(Map<String, dynamic> json)
      : caption = json['caption'] == null ? "the caption was null" : json['caption'];
}
