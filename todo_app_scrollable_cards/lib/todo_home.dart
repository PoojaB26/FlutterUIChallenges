import 'package:flutter/material.dart';

class TodoHome extends StatefulWidget{
  @override
  TodoHomeState createState() {
    return new TodoHomeState();
  }
}

class TodoHomeState extends State<TodoHome> {

  var appColors = [Color.fromRGBO(231, 129, 109, 1.0),Color.fromRGBO(99, 138, 223, 1.0),Color.fromRGBO(111, 194, 173, 1.0)];

  @override
  Widget build(BuildContext context) {


   final  _profileSection = new Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(Icons.account_circle, size: 45.0, color: Colors.white,),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0,16.0,0.0,12.0),
            child: Text("Hello, Jane.", style: TextStyle(fontSize: 30.0, color: Colors.white, fontWeight: FontWeight.w400),),
          ),
          Text("Looks like feel good.", style: TextStyle(color: Colors.white),),
          Text("You have 3 tasks to do today.", style: TextStyle(color: Colors.white,),),
        ],
      ),
    );

    return new Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text("TODO", style: TextStyle(fontSize: 16.0,),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Icon(Icons.search)
          )
        ],
        elevation: 0.0,
      ),
      drawer: Drawer(),
      body: new Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _profileSection,
            //_todoCards(),
          ],
        ),
      ),

    );
  }
}