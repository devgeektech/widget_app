import 'package:flutter/material.dart';

import '../util/location.dart';

class StateContainer extends StatefulWidget {
  final Widget child;
  final Location location;

  StateContainer({@required this.child,this.location});

  static StateContainerState of(BuildContext context){
    return(context.inheritFromWidgetOfExactType(InheritedContainer) as InheritedContainer).data;
  }

  StateContainerState createState() => StateContainerState();
}

class StateContainerState extends State<StateContainer> {

    Location location;
    void updateEventInfo({position}){
      if(location==null){
        location=new Location(position:position);
        setState(() {
          location=location;
        });
      }
      else{
        setState(() {
         location.position=position ?? location.position;

        });
      }

    }

  @override
  Widget build(BuildContext context) {
    return InheritedContainer(
        data:this,
       child: widget.child,
    );
  }
}

class InheritedContainer extends InheritedWidget {
   final StateContainerState data;

  InheritedContainer({Key key,@required this.data, @required Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify( InheritedContainer oldWidget) {
    return true;
  }
}
