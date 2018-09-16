import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'tweet_model.dart';
class UserFeedListItem extends StatelessWidget{
  final TweetModel tweet;
  UserFeedListItem(this.tweet);

  _tweetMeta(TweetModel tweet) {
    return Container(
      child: RichText(
        text: TextSpan(
            children: [
              TextSpan(text: tweet.username,
                style: TextStyle(fontWeight: FontWeight.w600,
                    fontSize: 18.0,
                    color: Colors.black),),
              TextSpan(text: " " + tweet.twitterHandle,
                  style: TextStyle(fontSize: 16.0, color: Colors.grey)),
              TextSpan(text: " ${tweet.time}",
                  style: TextStyle(fontSize: 16.0, color: Colors.grey))
            ]
        ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  getTweetInfoBody(TweetModel tweet){
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: _tweetMeta(tweet),
            flex: 5,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child: Icon(Icons.expand_more, color: Colors.grey,),
            ),flex: 1,
          ),
        ],
      ),
    );
  }

  getTweetBodyRow(TweetModel tweet){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(tweet.tweet, style: TextStyle(fontSize: 18.0),),
    );
  }
  getIconsRow(TweetModel tweet){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Icon(FontAwesomeIcons.comment, color: Colors.grey,),
          Icon(FontAwesomeIcons.retweet, color: Colors.grey,),
          Icon(FontAwesomeIcons.heart, color: Colors.grey,),
          Icon(FontAwesomeIcons.shareAlt, color: Colors.grey,),
        ],
      ),
    );
  }

  getTweetBody(TweetModel tweet){
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          getTweetInfoBody(tweet),
          getTweetBodyRow(tweet),
          getIconsRow(tweet)
        ],
      ),
    );
  }

  getUserIcon(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Icon(Icons.account_circle, size: 60.0, color: Colors.grey,),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              getUserIcon(),
              getTweetBody(tweet)
            ],
          ),
        ),
        Divider(),
      ],
    );
  }

}