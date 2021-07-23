import 'package:flutter/material.dart';
import 'package:test_project/web_service/test_api.dart' as api;
import 'package:test_project/model/feed_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Feed();
  }
}

class Feed extends StatefulWidget {
  Feed({Key? key}) : super(key: key);

  @override
  FeedState createState() => FeedState();
}

class FeedState extends State<Feed> {
  late Future<FeedResponse> _futureFeed;
  late String? _token;
  @override
  void initState() {
    super.initState();
    getFeed().whenComplete(() {
      setState(() {
        _futureFeed = api.getFeed(_token!);
      });
    });
  }

  Future<void> getFeed() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('token');
  }

  List<Post> _posts = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FeedResponse>(
      future: _futureFeed,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          _posts = snapshot.data!.posts!;
          return ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: _posts.length,
              itemBuilder: (context, item) => _buildPost(context, item));
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
  }

  Widget _buildPost(BuildContext context, int item) {
    return Container(
        color: Colors.white,
        child: Card(
          elevation: 2.0,
          child: Column(children: <Widget>[
            ListTile(
              leading: FlutterLogo(),
              title: Text('Firstname Lastname'),
            ),
            ListTile(
              title: Text(_posts[item].caption),
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Icons.favorite,
                      color: Color.fromRGBO(209, 65, 79, 1),
                      size: 24.0,
                      semanticLabel: 'Like',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: Text(
                      '88',
                      style: TextStyle(
                        color: Color.fromRGBO(209, 65, 79, 1),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Icons.chat_bubble_outlined,
                      color: Color.fromRGBO(206, 208, 213, 1),
                      size: 24.0,
                      semanticLabel: 'Comments',
                    ),
                  ),
                  Text(
                    '12',
                    style: TextStyle(
                      color: Color.fromRGBO(206, 208, 213, 1),
                    ),
                  )
                ],
              ),
            ),
          ]),
        )
    );
  }
}


