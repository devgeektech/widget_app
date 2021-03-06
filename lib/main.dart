import 'package:flutter/material.dart';
import './widgets/tileWidget.dart';
import './widgets/customwidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Widget App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(
        icon: Icon(Icons.navigate_next),
              iconSize: 48,
              color: Colors.white,
              onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> CustomWidget())),
            )
          ],
        ),
        body:

      Center(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              TileWidget(
                  isNetworkImage: false,
                  title: "Suits, Cast, Eccentric, Person",
                  imageUrl: "assets/banner.jpg",
                  onClick: () => debugPrint("tapped"),
                  viewCount: "12",
                  distance: "5.6 km"),
              TileWidget(
                  isNetworkImage: false,
                  title: "Suits, Cast, Eccentric, Person",
                  imageUrl: "assets/banner.jpg",
                  onClick: () => debugPrint("tapped"),
                  viewCount: "3",
                  distance: "2.99 km"),
              TileWidget(
                  isNetworkImage: true,
                  title: "Suits, Cast, Eccentric, Person",
                  imageUrl:
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBuLi1V-2N83AyAGL40ofCn5E5h35S3vPcV9oq9VdLpxruFQGRig",
                  onClick: () => debugPrint("tapped"),
                  viewCount: "6",
                  distance: "1.29 km"),
              TileWidget(
                  isNetworkImage: true,
                  title: "Suits, Cast, Eccentric, Person",
                  imageUrl:
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBuLi1V-2N83AyAGL40ofCn5E5h35S3vPcV9oq9VdLpxruFQGRig",
                  onClick: () => debugPrint("tapped"),
                  viewCount: "32",
                  distance: "11.5 km")
            ],
          ),
        ));
  }
}
