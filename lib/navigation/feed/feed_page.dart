import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:test_project/model/feed_response.dart';
import 'package:test_project/navigation/feed/stores/feed_store.dart';
import 'package:test_project/ui/custom_widgets.dart';

class NewsPage extends StatefulWidget {
  NewsPage();

  @override
  FeedState createState() => FeedState();
}

class FeedState extends State<NewsPage> {
  @override
  void initState() {
    super.initState();
    getFeedStore.getFeed();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (getFeedStore.isLoading) return CircularProgressIndicator();

        if (getFeedStore.error != "") return getErrorView();

        if (getFeedStore.response?.posts != null) {
          final List<Post> posts = getFeedStore.response!.posts!;
          return _buildListView(posts);
        }
        return CircularProgressIndicator();
      },
    );
  }

  Widget _buildListView(List<Post> _posts) {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemCount: _posts.length,
      itemBuilder: (context, item) => _buildPost(context, _posts[item].caption),
    );
  }

  Widget _buildPost(BuildContext context, String text) {
    return PostCard(text: text);
  }

  Widget getErrorView() {
    return Text("oh no");
  }
}
