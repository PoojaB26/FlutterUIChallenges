import 'package:flutter/material.dart';
import 'package:twitter_clone/tweet_mock_data.dart';
import 'package:twitter_clone/tweet_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/user_feed_list_item.dart';

class UserFeedHome extends StatefulWidget{
  @override
  UserFeedHomeState createState() {
    return new UserFeedHomeState();
  }
}

class UserFeedHomeState extends State<UserFeedHome> {

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Home", style: TextStyle(color: Colors.black),),
        leading: Icon(Icons.account_circle, color: Colors.grey, size: 35.0,),
      ),

      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, position) {
          TweetModel tweetmodel = TweetHelper.getTweet(position);
          return UserFeedListItem(tweetmodel);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(FontAwesomeIcons.featherAlt),
      ),
    );
  }
}