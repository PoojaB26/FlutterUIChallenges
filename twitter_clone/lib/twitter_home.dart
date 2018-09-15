import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'search_screen.dart';
import 'notifications_screen.dart';
import 'messages_screen.dart';
import 'user_feed_screen.dart';

class TwitterHome extends StatefulWidget{
  @override
  TwitterHomeState createState() {
    return new TwitterHomeState();
  }
}

class TwitterHomeState extends State<TwitterHome> {

  var selectedPageIndex = 0;

  var pages = [
    UserFeedHome(),
    SearchHome(),
    NotificationsHome(),
    MessagesHome()
  ];

  @override
  Widget build(BuildContext context) {

    List<BottomNavigationBarItem> bottomList = new List<BottomNavigationBarItem>();

    bottomList.add(BottomNavigationBarItem(
        title: Text(""),
        icon: Icon(FontAwesomeIcons.home,
          color: selectedPageIndex == 0 ? Colors.blue : Colors.blueGrey,)
    ));
    bottomList.add(BottomNavigationBarItem(
        title: Text(""),
        icon: Icon(FontAwesomeIcons.search,
          color: selectedPageIndex == 1 ? Colors.blue : Colors.blueGrey,)
    ));
    bottomList.add(BottomNavigationBarItem(
        title: Text(""),
        icon: Icon(FontAwesomeIcons.bell,
          color: selectedPageIndex == 2 ? Colors.blue : Colors.blueGrey,)
    ));
    bottomList.add(BottomNavigationBarItem(
        title: Text(""),
        icon: Icon(FontAwesomeIcons.envelope,
          color: selectedPageIndex == 3 ? Colors.blue : Colors.blueGrey,)
    ));


    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: bottomList,
        onTap: (index) {
          setState(() {
            selectedPageIndex = index;
          });
        },
        currentIndex: selectedPageIndex,
      ),
      body: pages[selectedPageIndex],
    );
  }
}