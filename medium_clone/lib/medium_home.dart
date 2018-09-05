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

   final _metaCol = new Container();




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
      drawer: Drawer(),
      body: ListView.builder(

          itemCount: NewsHelper.articleCount, //count of all articles in mock data
          itemBuilder: (context, position){
            //get articles from mock data one by one
            newsArticle = NewsHelper.getArticle(position);
            return new Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _categoryCol(newsArticle),
                  _titleCol(newsArticle),
                  _metaCol,
                ],
              ),
            );

          }),
    );
  }
}