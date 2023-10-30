class TextUtils {
  static String prettyFormatDistance(double distanceInMetres) {
    if (distanceInMetres < 1000) {
      return "${distanceInMetres.floor()} m";
    } else {
      final distanceInKm = distanceInMetres / 1000;
      return "${distanceInKm.toStringAsFixed(2)} Km";
    }
  }
}
