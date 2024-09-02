import 'package:url_launcher/url_launcher.dart';

class MapUtils {
  MapUtils._();

  static Future<void> openMap(
    double latitude,
    double longitude,
  ) async {
    String gMapUrl =
        "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude";

    if (await canLaunchUrl(Uri.parse(gMapUrl))) {
      await launchUrl(Uri.parse(gMapUrl));
    } else {
      throw 'Gmap not found';
    }
  }
}
