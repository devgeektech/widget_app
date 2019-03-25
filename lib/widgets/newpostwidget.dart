import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:geolocator/geolocator.dart';
//import 'package:location/location.dart';
import 'dart:core';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NewPostWidget extends StatefulWidget {
  @override
  _myPostWidget createState() => _myPostWidget();
}

class _myPostWidget extends State<NewPostWidget> {
  List<String> linkList = new List();
  int count = 0;
  TextEditingController locationController = TextEditingController();
  TextEditingController postController = TextEditingController();
  TextEditingController linkController = TextEditingController();
  String link="http://";
//Map<String,double> currentLocation=new Map();
 // var currentLocation = LocationData;

  StreamSubscription<Map<String,double>> locationSubscription;
//Location location=new Location();
String error;
  @override
  void initState() {

    super.initState();
    locationController.text = "";

    //getCurrentLocation();


 /*   currentLocation['latitude'] = 0.0;
    currentLocation['longitude'] = 0.0;*/
    //initPlateformState();
  }
   /* locationSubscription=location.onLocationChanged().listen((Map<String,double> result){

      setState(() {
        currentLocation=result;
      });

    }) as StreamSubscription<Map<String, double>>;
        }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("New Post"),
        actions: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 5),
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/banner.jpg"))),
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.only(
                    bottom: 2,
                  ),
                  child: Text("Jhon Doe "),
                ))
              ],
            ),
          ),
        ],
      ),
      body: GestureDetector(
          onTap: () {

            FocusScope.of(context).requestFocus(new FocusNode());
          },

        child: Stack(
        children: <Widget>[
          ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: TextFormField(
                  enabled: false,
                  controller: locationController,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          icon: Icon(Icons.location_searching),
                          onPressed: () {
                            debugPrint('222');
                          }),
                      labelText: "Sec. 17 chandigarh India",
                      hintText: ' Address',
                      errorStyle:
                          TextStyle(color: Colors.yellowAccent, fontSize: 15.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: TextFormField(
                  maxLines: 4,
                  controller: postController,
                  decoration: InputDecoration(
                      labelText: "Post Content",
                      hintText: " Eg. my New car",
                      errorStyle:
                          TextStyle(color: Colors.yellowAccent, fontSize: 15.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: TextFormField(
                  controller: linkController,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          icon: Icon(Icons.navigate_next, size: 40),
                          onPressed: () {
                            setState(() {
                              if (linkController.text.isNotEmpty) {
                                linkList.add(link + linkController.text);
                                linkController.text="";
                              }else{
                                Fluttertoast.showToast(
                                    msg: "Please add Post Content.",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIos: 1,
                                    backgroundColor: Colors.black87,
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                );
                              }
                            });
                          }),
                      labelText: "Third Field",
                      hintText: ' www.java.com',
                      errorStyle:
                          TextStyle(color: Colors.yellowAccent, fontSize: 15.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ListView.builder(
                    padding: EdgeInsets.all(0),
                    itemCount: linkList.length,
                    itemBuilder: (BuildContext context, int position) {
                      return InkWell(

                        onTap: ()=>  launchURL(linkList[position]),
                        child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Text(
                                      linkList[position],
                                      style: TextStyle(
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    IconButton(
                                        icon: Icon(Icons.delete),
                                        onPressed: () {
                                          setState(() {
                                            linkList.remove(linkList[position]);
                                          });
                                        })
                                  ],
                                ),
                              ],
                            )),
                      );
                    }),
                height: 150,
                margin: EdgeInsets.all(5),
              )
            ],
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: InkWell(
                onTap: (){
if(postController.text=="") {

  Fluttertoast.showToast(
      msg: "Please add Post Content.",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 1,
      backgroundColor: Colors.black87,
      textColor: Colors.white,
      fontSize: 16.0
  );

}else{
  postContent();
}

                },
                child: Container(
                    color: Colors.blue,
                    child: SizedBox(
                      width: 300.0,
                      height: 60.0,
                      child: new RaisedButton(
                        child: new Text(
                          'Post',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )),
              )
    )
        ],
        ) ),
    );
  }

   getCurrentLocation() async {
    //   List<PermissionName> permissionNames = await Permission.requestPermissions([PermissionName.Location]);

    //  Position position = await Geolocator().getLastKnownPosition(desiredAccuracy: LocationAccuracy.low);

  //  print("-----------------$position");
  }

  launchURL(String url) async {


    print(url);
    if (await canLaunch(url)) {
    await launch(url);
    } else {
    throw 'Could not launch $url';
    }
  }

  void postContent() {

    // code for post te content

    Fluttertoast.showToast(
        msg: " Content Post. ",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.black87,
        textColor: Colors.white,
        fontSize: 16.0
    );

  }
/*
  void initPlateformState() async {


    try {
      currentLocation = (await location.getLocation) as Type;
      print("----------------------------$currentLocation");

    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        error = 'Permission denied';
      }
      currentLocation = null;
    }

  *//*  Map<String,double> my_location;
    try{
      my_location=await location.getLocation as Map<String, double> ;
    }on PlatformException catch( e){
      if(e.code=='PERMISSION_DENIED')
        error ='permission denied';
      else if(e.code=='PERMISSION_DENIED_NEVER_ASK')
        error='permission denied - ask for the permission';
      my_location=null;
    }

setState(() {
currentLocation=my_location;
print("----------------------------$currentLocation");
});*//*


  }*/

}


