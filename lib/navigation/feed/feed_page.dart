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
          return _buildCustomScrollView(posts);
        }
        return CircularProgressIndicator();
      },
    );
  }

  Widget _buildCustomScrollView(List<Post> _posts) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => Padding(
              padding: EdgeInsets.all(16.0),
              child: PostCard(text: _posts[index].caption),
            ),
            childCount: _posts.length,
          ),
        ),
      ],
    );
  }

  Widget getErrorView() {
    return Text("oh no");
  }
}
