import 'package:flutter/material.dart';


class TextWidget extends StatelessWidget{
  final String textDetail;
  final Color txtColor;
  final Color borderColor;
  final Function onclick;
  final int index;

  const TextWidget({Key key, this.textDetail, this.txtColor, this.borderColor, this.onclick, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  InkWell(
        onTap:onclick,
      child: Container(
        padding: EdgeInsets.only(top: 10,bottom: 10,right: 20,left: 20),
        margin: EdgeInsets.only(top: 5,bottom: 5,left: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          shape: BoxShape.rectangle,
          border: new Border.all(color: borderColor,width: 2),
        ),

        //,
        child: Text(textDetail,
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: 16,
            color: txtColor
          ),



        )
    ) );;
  }

}