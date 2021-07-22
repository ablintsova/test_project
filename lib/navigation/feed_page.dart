import 'package:flutter/material.dart';

class FeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Feed();
  }
}

class Feed extends StatefulWidget {
  @override
  FeedState createState() => FeedState();
}

class FeedState extends State<Feed> {
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: 5,
        itemBuilder: (context, item) => _buildPost(context, item));
  }

  Widget _buildFeed() {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: 5,
        itemBuilder: (context, item) => _buildPost(context, item));
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
              title: Text('post content'),
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


