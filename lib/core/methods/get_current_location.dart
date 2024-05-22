import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class GetCurrentLocation {
  Future<bool> checkPermission() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('Disabled Service');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return false;
    }
    return true;
  }

  Future<Position> getCurrentPosition() async {
    bool hasPermission = await checkPermission();
    if (hasPermission) {
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
    } else {
      return Future.error('Permission Denied');
    }
  }

  Future<String> getCurrentAddress() async {
    try {
      Position? position = await getCurrentPosition();
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        String address =
            '${place.locality},  ${place.administrativeArea},  ${place.country}';
        print(address);
        return address;
      } else {
        return 'Address not found';
      }
    } catch (e) {
      print("Error: $e");
      return 'Error getting address';
    }
  }
}
