import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';


class CheckPermission {

  var geolocationStatus;

   Future<Position> getLocation() async{

        geolocationStatus = await Geolocator().getCurrentPosition();



      return geolocationStatus;

  }

}