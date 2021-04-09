import 'package:geolocator/geolocator.dart';

class Location {
  //Location({this.longitude,this.latitude});
  double longitude;
  double latitude;
  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      longitude = position.longitude;
      latitude = position.latitude;
    } catch (e) {
      print(e);
    }
  }
}
