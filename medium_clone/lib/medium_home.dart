import 'package:flutter/material.dart';
import 'package:medium_clone/articles_mock_data.dart';
import 'package:medium_clone/articles_model.dart';

class MediumHome extends StatefulWidget{
  @override
  _MediumHomeState createState() {
    return new _MediumHomeState();
  }
}

class _MediumHomeState extends State<MediumHome> {
  NewsArticle newsArticle;
  @override
  Widget build(BuildContext context) {

    _categoryCol(NewsArticle newsArticle){
      return new Container(
        child: new Text(newsArticle.categoryTitle),
      );
    }

    _titleCol(NewsArticle newsArticle){
      return Padding(
        padding: const EdgeInsets.fromLTRB(0.0,12.0,0.0,12.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              flex:3,
              child: Text(newsArticle.title,
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                width: 80.0,
                height: 80.0,
                child: Image.network(
                    "https://upload.wikimedia.org/wikipedia/commons/4/43/Medium_format.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      );
    }

    _metaCol(NewsArticle newsArticle){
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(newsArticle.author, style: TextStyle(fontSize: 18.0),),
              Text("${newsArticle.date} . ${newsArticle.readTime}",
                style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black45),),

            ],
          ),
          Icon(Icons.bookmark_border),

        ],
      );
    }

    final _profileSection = new Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(32.0,64.0,32.0,16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(Icons.account_circle, size: 90.0,),
              SizedBox(height: 8.0,),
              Text("Pooja Bhaumik", style: TextStyle(fontSize: 20.0),),
              SizedBox(height: 8.0,),
              Text("See profile", style: TextStyle(color: Colors.black45),)
            ],
          ),
        ),
    );

    final _menuItems = new Container(
      color: Colors.black12,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40.0,16.0,40.0,40.0),

        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Home", style: TextStyle(fontSize: 18.0),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Home", style: TextStyle(fontSize: 18.0),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Audio", style: TextStyle(fontSize: 18.0),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Bookmarks", style: TextStyle(fontSize: 18.0),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Interests", style: TextStyle(fontSize: 18.0),),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Become a member", style: TextStyle(fontSize: 18.0, color: Colors.teal),),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("New Story", style: TextStyle(fontSize: 18.0),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Stats", style: TextStyle(fontSize: 18.0),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Drafts", style: TextStyle(fontSize: 18.0),),
            ),
          ],
        ),
      ),
    );


    final _drawerLayout = new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _profileSection,
        Expanded(child: _menuItems),
      ],
    );



    return new Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.black,
        actions: <Widget>[
          Padding(
              padding : new EdgeInsets.only(right: 20.0),
              child: Icon(Icons.notifications_none, color:Colors.grey[500] ,)
          ),
          Padding(
              padding: new EdgeInsets.only(right: 12.0),
              child: Icon(Icons.search, color: Colors.grey[500],))
        ],
      ),
      drawer: Drawer(
        child: _drawerLayout,
      ),
      body: ListView.builder(

          itemCount: NewsHelper.articleCount, //count of all articles in mock data
          itemBuilder: (context, position){
            //get articles from mock data one by one
            newsArticle = NewsHelper.getArticle(position);
            return Padding(
              padding: const EdgeInsets.fromLTRB(0.0,0.5,0.0,0.5),

              child: new Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _categoryCol(newsArticle),
                      _titleCol(newsArticle),
                      _metaCol(newsArticle),
                    ],
                  ),
                ),
              ),
            );

          }),
    );
  }
}