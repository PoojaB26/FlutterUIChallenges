import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  TabController tabController;
  final imagePath = 'https://picsum.photos/200/300?image=';

  final loremIpsum = ' It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with deskt';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = new TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController.dispose();
  }
  @override
  Widget build(BuildContext context) {

    Widget _getFollowListItem(path, logo) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 75.0,
                  width: 75.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(37.5),
                    image: DecorationImage(
                        image: NetworkImage(path),
                        fit: BoxFit.cover
                    )

                  ),
                ),
                Positioned(
                  top: 50.0,
                  left: 50.0,
                  child: Container(
                    height: 25.0,
                    width: 25.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.5),

                    ),
                    child: logo,
                  ),
                )
              ],
            ),
            SizedBox(height: 10.0,),
            Container(
              height: 30.0,
              width: 75.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.brown[500],
              ),
              child: Text('Follow', style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.white,
                fontSize: 14.0
              ),),
            )
          ],
        ),
      );
    }

    final _followList = Container(
        width: double.infinity,
        height: 160.0,
        child: ListView(
          padding: EdgeInsets.all(10.0),
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            _getFollowListItem('https://picsum.photos/200/300?image=0', Icon(Icons.camera_alt)),
            _getFollowListItem('https://picsum.photos/200/300?image=1', Icon(Icons.keyboard)),
            _getFollowListItem('https://picsum.photos/200/300?image=2', Icon(Icons.directions_car)),
            _getFollowListItem('https://picsum.photos/200/300?image=3', Icon(Icons.wb_sunny)),
            _getFollowListItem('https://picsum.photos/200/300?image=4', Icon(Icons.backup))

          ],
        ));

    final _cardItem = Padding(
      padding: EdgeInsets.all(20.0),
      child: Material(
        borderRadius: BorderRadius.circular(10.0),
        elevation: 2.0,
        child: Container(
          height: 450.0,
          width: double.infinity,
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              _buildCardHeader(),
              SizedBox(height: 20.0,),
              Text(loremIpsum, style: TextStyle(fontFamily: 'Montserrat'),),
              SizedBox(height: 10.0,),
              _buildImageGrid(context),
              Row(
                children: <Widget>[
                  Chip(label: Text('#hashtag'),),
                  SizedBox(width: 5.0,),
                  Chip(label: Text('#hashtag'),)

                ],
              )

            ],
          ),
        ),
      ),
    );

    final _homeBody = ListView(
      children: <Widget>[
        _followList,
        _cardItem,
        _cardItem,
        _cardItem,

      ],
    );

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.camera_alt),
            color: Colors.grey,
            onPressed: () {},
          )
        ],
        title: Text(
          "Discovery",
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 20.0),
        ),
      ),
      bottomNavigationBar: Material(
        color: Colors.white,
        child: TabBar(
          controller: tabController,
          indicatorColor: Colors.transparent,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.airplanemode_active, color: Colors.black,),),
            Tab(icon: Icon(Icons.image, color: Colors.black,),),
            Tab(icon: Icon(Icons.directions_car, color: Colors.black,),),
            Tab(icon: Icon(Icons.forward, color: Colors.black,),)

          ],
        ),
      ),
      body: _homeBody,
    );
  }

  Container _buildImageGrid(BuildContext context) {
    return Container(
              height: 230.0,
              child: Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width/2.2,
                    height: 230.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(image: NetworkImage('${imagePath}1'), fit: BoxFit.cover)
                    ),
                  ),
                  SizedBox(width: 10.0,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width-250.0,
                        height: MediaQuery.of(context).size.height/5.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(image: NetworkImage('${imagePath}1'), fit: BoxFit.cover)
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width-250.0,
                        height: MediaQuery.of(context).size.height/5.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(image: NetworkImage('${imagePath}1'), fit: BoxFit.cover)
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
  }

  Row _buildCardHeader() {
    return Row(
              children: <Widget>[
                CircleAvatar(backgroundImage: NetworkImage(imagePath),),
                SizedBox(width: 10.0,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                        Text('Daisy', style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                        ),),
                        Text('34 mins ago', style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Montserrat'
                        ),),
                    ],
                  ),
                ),
                Icon(Icons.more_vert)
              ],
            );
  }
}
