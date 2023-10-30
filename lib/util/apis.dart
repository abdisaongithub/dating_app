import 'credentials.dart';

class APIs {
  static final baseMedia = 'https://${Credentials.baseUrl}';
  static const login = 'user/login';
  static const logout = 'user/logout';
  static const slider = 'slider/all';
  static const signup = 'user/register';
  static const registerPhone = 'phone/register';

  static const changePhone = 'user/phone/change';
  static const verifyChangePhone = 'user/phone/change/verify';

  static const resetPasswordUsingPhone = 'user/password/resetByPhone/sendcode';
  static const resetPasswordVerifyCode =
      'user/password/resetByPhone/verifycode';
  static const resetPasswordUsingEmail = 'user/password/resetByEmail/sendcode';

  static const cart = 'user/cart/product/add';
  static const getCart = 'user/cart';
  static const getOrders = 'order';
  static const fcmToken = 'user/fcm-token';
  static const getStores = 'store/all';
  static const checkout = 'cart/checkout';
  static const categories = 'category/all';
  static const getCategories = 'category/by-parent-id/62d8508affdcca49214ecb33';

  static const makeFavorite = 'store/make-favorite';
  static const removeFavorite = 'store/remove-favorite';
  static const getNotifications = 'notification';
  static const notificationsCount = 'notification/count';
  static const getProfile = 'user/info';
  static const rating = 'rating';
  static const ratingStore = 'rating/store';

  static const verifyPhone = 'user/email/verifycode';

  static const sendVerificationCodeForEmail = 'user/email/sendcode';
  static const verifyEmailByCode = 'user/email/verifycode';

  static const verifyResetPasswordEmailCode =
      'user/password/resetByEmail/verifycode';

  static const sendVerificationCodeBeforeRegistration = 'email/sendcode';
  static const verifyCodeBeforeRegistration = 'email/verifycode';

  static const chatRooms = 'user/chat';
  static const changePwd = 'user/password/change';
  static const changeEmail = 'auth/change-email';
  static const deleteAccount = 'user/delete';
  static const changeTederaNotification = 'user/tedera-notification';
  static const changeChatNotification = 'user/chat-notification';
  static const changeOrderNotification = 'user/order-notification';
  static const changeOrderStatusToCancel = 'order/update-order-status';

  static String chatDetails(String id) => 'chat/load/$id';

  static String restRating(String id) => 'rating/$id';

  static String updatePassword(String userId) => 'auth/update-password/$userId';
  static String updateProfile = 'user/update';

  static String userAddress(String userId) => 'user/$userId/address';

  static String markAsRead(String notiId) =>
      'notification/mark-as-read/$notiId';

  static String updateDefaultAddress(String userId, String addressId) =>
      'user/$userId/address/$addressId/update-default';

  static String deleteAddress(String userId, String addressId) =>
      'user/$userId/address/$addressId';

  static String forgotPassword(String email) =>
      "auth/reset-and-send-password/$email";

  static String getItems(String storeId) => 'store/product/$storeId';

  static String getCoupon(String coupon) => "coupon/verify/$coupon";

  static String favoriteStores(String userId) => "store/$userId/favorites";

  static String favoriteStoresIds(String userId) =>
      "store/$userId/favorites/all";
}
