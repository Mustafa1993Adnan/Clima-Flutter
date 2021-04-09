import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../services/location.dart';
import '../services/networking.dart';
import 'location_screen.dart';

const apiKey = '58a0bb3155a2056df8e5562117e31b81';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  var cityName;
  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    NetworkHelper networkHelper = NetworkHelper(
        url:
            'https://api.openweathermap.org/data/2.5/onecall?lat=$latitude&lon=$longitude&exclude=current&appid=$apiKey');
    var weatherData = await networkHelper.getData();
    cityName = weatherData['timezone'];
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen();
    }));
    print(cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SpinKitThreeBounce(
        color: Colors.cyan,
        size: 60,
      ),
    ));
  }
}
