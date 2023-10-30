import 'dart:ui' as ui;

import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsUtil {
  static const assetPath = 'assets/images/map-marker-72px.png';
  static const noPoiStylePath = 'assets/txt/map_no_poi.txt';

  static late BitmapDescriptor customIcon;
  static late String noPoiStyle;

  static Future<void> initialize(int pinWidth) async {
    customIcon = await getBitmapDescriptorFromAssetBytes(assetPath, pinWidth);
    noPoiStyle = await rootBundle.loadString(noPoiStylePath);
  }

  static Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  static Future<BitmapDescriptor> getBitmapDescriptorFromAssetBytes(
      String path, int width) async {
    final Uint8List imageData = await getBytesFromAsset(path, width);
    return BitmapDescriptor.fromBytes(imageData);
  }
}
