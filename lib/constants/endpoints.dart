import '../util/credentials.dart';

final serverUrl = 'https://${Credentials.baseUrl}';

class AuthEndpoint {
  static String base = '$serverUrl/v1/user';
  static String registerPhone = '$serverUrl/phone/register';

  static String changeEmail = '$base/email/change';
  static String verifyChangeEmail = '$base/email/change/verifycode';

  static String sendVerificationCodeUsingEmail = '$base/email/sendcode';

  static String sendResetPasswordEmail = '$base/password/resetByEmail/sendcode';
  static String verifyResetCodeEmail = '$base/password/resetByEmail/verifycode';

  static String verifyCodeSentByEmail = '$base/email/verifycode';
  static String verifyPhone = '$base/verify-phone';

  static final String updatePassword = '$base/update-password';

  static final changePasswordUsingPhone = '$base/password/resetByPhone/change';
  static final changePasswordUsingEmail = '$base/password/resetByEmail/change';

  static final String refreshToken = '$serverUrl/v1/user/refreshToken';
}

class CategoryEndpoint {
  // static const String categoryIdRestaurant = '62d8508affdcca49214ecb33';
  // static String base = '$serverUrl/category/by-parent-id/$categoryIdRestaurant';

  // static String storeCategories(String type) => '$base?Type=$type';
  static String storeCategories = '$serverUrl/v1/category/all';
}

class NotificationEndpoint {
  static String base = '$serverUrl/notification';
  static String getCount = '$base/count';
  static String markAsRead = '$base/mark-as-read';
}

class OrderEndpoint {
  static String base = '$serverUrl/order';

  static String getUserActiveOrders(String userId) => '$base?CustomerId=$userId&IsOpen=true';
}

class SliderEndpoint {
  static String base = '$serverUrl/v1/slider/all';
}

class StoreEndpoint {
  static String base = '$serverUrl/v1/store';
  static String storesWithFilter = '$base/all';
  static String userFavorites = '$base/user/favorites';
  static String makeFavorite = '$base/make-favorite';
  static String removeFavorite = '$base/remove-favorite';
}

class UserEndpoint {
  static String base = '$serverUrl/v1/user';

  static String userAddress = '$base/address';

  static String userAddressByAddressId(String addressId) => '$base/address/$addressId';

  static String updateUserDefaultAddress(String userId, String addressId) =>
      '$base/$userId/address/$addressId/update-default';
}

class UserNotificationEndpoint {
  static final String base = '$serverUrl/user';
  static final String orderNotification = '$base/order-notification';
  static final String tederaNotification = '$base/tedera-notification';
  static final String chatNotification = '$base/chat-notification';
}
