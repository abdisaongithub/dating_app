import 'dart:async';

import 'package:universal_html/html.dart';

class LatLng {
  external LatLng(
    num? lat,
    num? lng, [
    bool? noWrap, // ignore: unused_element
  ]);
}

class InfoWindow {
  external InfoWindow(
      //   [
      //   InfoWindowOptions? opts, // ignore: unused_element
      // ]
      );
  set content(Object? /*String?|Node?*/ content) => content;
  external void close();

  external void open([
    Object? /*GMap?|StreetViewPanorama?*/ map,
    Object? anchor,
  ]);
}

class Marker {
  external Marker([
    MarkerOptions? opts, // ignore: unused_element
  ]);
  Stream get onClick {
    StreamController? sc; // ignore: close_sinks

    return sc!.stream;
  }

  Stream get onMouseover {
    StreamController? sc; // ignore: close_sinks

    return sc!.stream;
  }
}

class MarkerOptions {
  external factory MarkerOptions();

  external Point? get anchorPoint;

  external set anchorPoint(Point? value);

  external Animation? get animation;

  external set animation(Animation? value);

  external bool? get clickable;

  external set clickable(bool? value);

  external bool? get crossOnDrag;

  external set crossOnDrag(bool? value);

  external String? get cursor;

  external set cursor(String? value);

  external bool? get draggable;

  external set draggable(bool? value);

  external Object? /*String?|Icon?|GSymbol?*/ get icon;

  external set icon(Object? /*String?|Icon?|GSymbol?*/ value);

  external Object? /*String?|MarkerLabel?*/ get label;

  external set label(Object? /*String?|MarkerLabel?*/ value);

  external Object? /*GMap?|StreetViewPanorama?*/ get map;

  external set map(Object? /*GMap?|StreetViewPanorama?*/ value);

  external num? get opacity;

  external set opacity(num? value);

  external bool? get optimized;

  external set optimized(bool? value);

  external LatLng? get position;

  external set position(LatLng? value);

  external String? get title;

  external set title(String? value);

  external bool? get visible;

  external set visible(bool? value);

  external num? get zIndex;

  external set zIndex(num? value);
}

class GMap {
  external GMap(
    Element? mapDiv, [
    MapOptions? opts, // ignore: unused_element
  ]);
}

class MapOptions {
  external factory MapOptions();

  external String? get backgroundColor;

  external set backgroundColor(String? value);

  external LatLng? get center;

  external set center(LatLng? value);

  external bool? get clickableIcons;

  external set clickableIcons(bool? value);

  external num? get controlSize;

  external set controlSize(num? value);

  external bool? get disableDefaultUI;

  external set disableDefaultUI(bool? value);

  external bool? get disableDoubleClickZoom;

  external set disableDoubleClickZoom(bool? value);

  external bool? get draggable;

  external set draggable(bool? value);

  external String? get draggableCursor;

  external set draggableCursor(String? value);

  external String? get draggingCursor;

  external set draggingCursor(String? value);

  external bool? get fullscreenControl;

  external set fullscreenControl(bool? value);

  external String? get gestureHandling;

  external set gestureHandling(String? value);

  external num? get heading;

  external set heading(num? value);

  external bool? get keyboardShortcuts;

  external set keyboardShortcuts(bool? value);

  external bool? get mapTypeControl;

  external set mapTypeControl(bool? value);

  external Object? /*MapTypeId?|String?*/ get mapTypeId;

  external set mapTypeId(Object? /*MapTypeId?|String?*/ value);

  external num? get maxZoom;

  external set maxZoom(num? value);

  external num? get minZoom;

  external set minZoom(num? value);

  external bool? get noClear;

  external set noClear(bool? value);

  external bool? get panControl;

  external set panControl(bool? value);

  external bool? get rotateControl;

  external set rotateControl(bool? value);

  external bool? get scaleControl;

  external set scaleControl(bool? value);

  external bool? get scrollwheel;

  external set scrollwheel(bool? value);

  external bool? get streetViewControl;

  external set streetViewControl(bool? value);

  external num? get tilt;

  external set tilt(num? value);

  external num? get zoom;

  external set zoom(num? value);

  external bool? get zoomControl;

  external set zoomControl(bool? value);
}
