import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String name;
  final String? sessionId;
  final String? userId;
  final String? email;
  final String? countryCode;
  final String? phoneNumber;
  final String? profileImage;
  final String? userName;
  final String? fssaiNumber;
  final String? companyName;
  final String? customerAddress;
  final String? fssaiCertificate;

  const UserEntity({
    required this.name,
    this.sessionId,
    this.userId,
    this.email,
    this.countryCode,
    this.phoneNumber,
    this.profileImage,
    this.userName,
    this.fssaiNumber,
    this.companyName,
    this.customerAddress,
    this.fssaiCertificate
  });

  factory UserEntity.fromJson(Map<String, dynamic> userJson) {
    return UserEntity(
      name: userJson["customer_name"],
      sessionId: userJson["session_value"],
      userId: userJson["customer_id"],
      email: userJson["customer_email"],
      countryCode: userJson["country_code"],
      phoneNumber: userJson["phone_number"],
      profileImage: userJson["profile_image"],
      userName: userJson["user_name"],
    );
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> userJson = {};
    userJson.addAll({
      "customer_name": name,
      "session_value": sessionId,
      "customer_id": userId,
      "customer_email": email,
      "country_code": countryCode,
      "phone_number": phoneNumber,
      "profile_image": profileImage,
      "user_name": userName,
    });
    return userJson;
  }

  @override
  List<Object?> get props => [name, userId];
}
