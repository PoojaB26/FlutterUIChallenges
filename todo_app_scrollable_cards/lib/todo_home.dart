import 'package:flutter/material.dart';

import 'card_item_model.dart';
class TodoHome extends StatefulWidget{
  @override
  TodoHomeState createState() {
    return new TodoHomeState();
  }
}

class TodoHomeState extends State<TodoHome> {

  var appColors = [Color.fromRGBO(231, 129, 109, 1.0),Color.fromRGBO(99, 138, 223, 1.0),Color.fromRGBO(111, 194, 173, 1.0)];
  var cardsList = [CardItemModel("Personal", Icons.account_circle, 9, 0.83),CardItemModel("Work", Icons.work, 12, 0.24),CardItemModel("Home", Icons.home, 7, 0.32)];

  @override
  Widget build(BuildContext context) {


   final  _profileSection = new Container(
     width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            //Row(),
            Padding(
              padding: const EdgeInsets.all(4.0),
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
      ),
    );

   getIcons(position) {
     return Padding(
       padding: const EdgeInsets.all(8.0),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: <Widget>[
           Icon(Icons.title, color: appColors[position],),
           Icon(Icons.more_vert, color: Colors.grey,),
         ],
       ),
     );
   }

   getCardBody(position){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Text("${cardsList[position].tasksRemaining} Tasks", style: TextStyle(color: Colors.grey),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Text("${cardsList[position].cardTitle}", style: TextStyle(fontSize: 28.0),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: LinearProgressIndicator(
              value: cardsList[position].taskCompletion,
            ),
          )
        ],
      ),
    );
   }


   _todoCards(){
     return Column(
       children: <Widget>[
         Container(
           height: 300.0,
           child: ListView.builder(
             physics: NeverScrollableScrollPhysics(),
                itemCount: 3,
               controller: ScrollController(),
               scrollDirection: Axis.horizontal,
               itemBuilder: (context, position){
                  return GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Container(
                          width: 250.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              getIcons(position),
                              getCardBody(position),
                            ],
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)
                        ),
                      ),
                    ),
                  );
                  }
               ),
         ),
       ],
     );
   }

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
            Expanded(child: _todoCards()),
          ],
        ),
      ),

    );
  }
}