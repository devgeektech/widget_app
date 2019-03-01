import 'package:flutter/material.dart';

const textStyle =
    TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);

class TileWidget extends StatelessWidget {
  final String imageUrl;
  final Function onClick;
  final String distance;
  final String viewCount;
  final String title;
  final bool isNetworkImage;

  TileWidget(
      {Key key,
      @required this.isNetworkImage,
      @required this.title,
      @required this.imageUrl,
      @required this.onClick,
      @required this.distance,
      @required this.viewCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onClick,
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        // color: Colors.grey,
        height: 300,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: isNetworkImage ? NetworkImage(imageUrl) : AssetImage(imageUrl),
          fit: BoxFit.cover,
        )),
        child: Stack(
          children: <Widget>[
            Positioned(
                left: 0,
                right: 0,
                top: 0,
                bottom: 0,
                child: Opacity(
                  opacity: 0.5,
                  child: Container(
                    color: Colors.black,
                  ),
                )),
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Opacity(
                  opacity: 0.7,
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 10, left: 20, right: 20, bottom: 10),
                    color: Colors.black,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            title,
                            textAlign: TextAlign.start,
                            style: textStyle,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Icon(Icons.remove_red_eye,
                                      color: Colors.white, size: 25),
                                ),
                                Text(
                                  viewCount,
                                  style: textStyle,
                                )
                              ]),
                              Row(children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Icon(Icons.room,
                                      color: Colors.white, size: 25),
                                ),
                                Text(
                                  distance,
                                  style: textStyle,
                                )
                              ])
                            ],
                          )
                        ]),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
