import 'package:package_info_plus/package_info_plus.dart';

class AppUtils {
  static Future getAppDetails() async {
    final packageInfo = await PackageInfo.fromPlatform();
    
    // String version = packageInfo.version;
    return packageInfo;
  }
}
