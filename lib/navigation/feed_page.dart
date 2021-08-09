import 'package:flutter/material.dart';
import 'package:test_project/model/feed_response.dart';
import 'package:test_project/res/app_colors.dart';
import 'package:test_project/res/app_strings.dart';
import 'package:test_project/web_service/test_api.dart' as api;

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


  @override
  void initState() {
    super.initState();
    // _futureFeed = getFeed();
  }

  // Future<FeedResponse> getFeed() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // String? token = prefs.getString('token');
    // return api.getFeed(token!);
  // }

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
              leading: _buildRoundIcon(),
              title: Text(
                AppStrings.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
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
                      color: AppColors.red,
                      size: 24.0,
                      semanticLabel: 'Like',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: Text(
                      '88',
                      style: TextStyle(
                        color: AppColors.red,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Icons.chat_bubble_outlined,
                      color: AppColors.grey,
                      size: 24.0,
                      semanticLabel: 'Comments',
                    ),
                  ),
                  Text(
                    '12',
                    style: TextStyle(
                      color: AppColors.grey,
                    ),
                  )
                ],
              ),
            ),
          ]),
        )
    );
  }

  Widget _buildRoundIcon() {
    return Container(
      child: Ink(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.red.shade400,
              Colors.purple.shade300,
            ],
          ),
        ),
        child: Container(
          constraints: const BoxConstraints.tightFor(
              width: 38.0, height: 38.0),
          alignment: Alignment.center,
          child: Image(
              image: AssetImage('assets/images/photo.png'),
              width: 35.0,
              height: 35.0),
        ),
      ),
    );
  }
}
