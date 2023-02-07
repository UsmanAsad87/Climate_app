import 'package:geolocator/geolocator.dart';


class Location{
  double latitute;
  double longitude;

  void getCurrentLocation() async {
    try{
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitute=position.latitude;
      longitude=position.longitude;
    }
    catch(e){
      print(e);
    }
  }
}