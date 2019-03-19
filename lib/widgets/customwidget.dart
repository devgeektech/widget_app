import 'package:flutter/material.dart';
import './customwidget.dart';
import './textwidget.dart';
import './newpostwidget.dart';

class CustomWidget extends StatefulWidget {
  @override
  _MyCustomWidget createState() => _MyCustomWidget();
}

class _MyCustomWidget extends State<CustomWidget> {
  List<String> list = [
    "kjdfkghdf",
    "fjdsbfhdjsfgh",
    "fdsgjfhgf",
    "frgfuyyufrg",
    "dsgfyrgf",
    "hfuyrgryugffg"
  ];
  List<String> list2 = [
    "kjdfkghdf",
    "fjdsbfhdjsfgh",
    "fdsgjfhgf",
    "frgfuyyufrg",
    "dsgfyrgf",
    "fdf",
    "dfbdsjhfjds",
    "fjdfhd",
    "fdfhsd",
    "dfjdjhfd"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Widget 1"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.navigate_next),
            iconSize: 48,
            color: Colors.white,
            onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> NewPostWidget())),
          )
        ],


      ),
        body:Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black38,
              )),
          height: MediaQuery
              .of(context)
              .size
              .height * 55 / 100,
        ),
        Container(
          padding: EdgeInsets.only(right: 5),
          decoration: BoxDecoration(border: Border.all(color: Colors.black38)),
          margin: EdgeInsets.all(5),
          height: MediaQuery
              .of(context)
              .size
              .height * 8 / 100,
          child: ListView.builder(
              itemCount: list.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return TextWidget(
                  onclick: () => onClickFun(index, list[index]),
                  textDetail: list[index],
                  txtColor: Colors.lightBlue,
                  borderColor: Colors.green,
                  index: index,
                );
              }),
        ),
        Expanded(
            child: Container(
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38)),
              child: ListView(
                children: <Widget>[
                  Wrap(
                      spacing: 0,
                      children: getDetail()
                  )
                ],
              ),
            )),
      ],
    ), );
  }


  List<Widget> getDetail() {
    List<Widget> arr = [];
    for (var i = 0; i < list2.length; i++) {
      arr.add(TextWidget(
        onclick: () => onClickFun(i, list2[i]),
        textDetail: list2[i],
        txtColor: Colors.lightBlue,
        borderColor: Colors.green,
        index: i,
      )
      );
    }
    return arr;
  }

  onClickFun(index, data){

    debugPrint("index is $index  "+ "data is $data");

  }

}