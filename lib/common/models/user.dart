class UserData {
  String? id;
  String? firebaseId;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? role;
  String? status;
  List<dynamic>? storesUsers;
  Address? address;
  bool? isEmailVerified;
  bool? isPhoneVerified;
  bool? adminChatNotification;
  bool? chatNotification;
  bool? tederaNotification;
  bool? orderNotification;
  UserData({
    this.id,
    this.firebaseId,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.status,
    this.storesUsers,
    this.address,
    this.adminChatNotification,
    this.orderNotification,
    this.tederaNotification,
    this.chatNotification,
    this.isEmailVerified,
    this.isPhoneVerified,
  });

  UserData.fromJson(dynamic json) {
    id = json['id'];
    firebaseId = json['firebaseId'];
    // userId = json['UserId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
    role = json['role'];
    status = json['status'];
    isPhoneVerified = json['isPhoneVerified'];
    isEmailVerified = json['isEmailVerified'];
    address =
        json['address'] == null ? null : Address.fromJson(json['address'][0]);
    adminChatNotification = json['adminChatNotification'];
    chatNotification = json['chatNotification'];
    tederaNotification = json['tederaNotification'];
    orderNotification = json['orderNotification'];
    // storesUsers = json['StoreUsers'] == null
    //     ? []
    //     : List<dynamic>.from(json['StoreUsers'])
    //     .map((item) => StoreUsers.fromJson(item))
    //     .toList();
  }
}

class Address {
  String? address;
  String? country;
  double? latitude;
  double? longitude;
  bool? isDefault;

  Address({
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.isDefault,
  });

  Address.fromJson(dynamic json) {
    // address = "";
    address =
        "${json["Street"]} ${json["Number"]}, ${json["Zip"]}, ${json["City"]}";
    country = ", ${json["Country"]}";
    latitude = double.tryParse(json["Lat"].toString());
    longitude = double.tryParse(json["Lng"].toString());
    isDefault = json["isDefault"] ?? false;
  }
}
