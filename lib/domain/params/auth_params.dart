import 'package:equatable/equatable.dart';

class AuthParams extends Equatable {
  final String phoneNumber;
  final String? otp;
  final String? fcmToken;

  const AuthParams({
    required this.phoneNumber,
    this.otp,
    this.fcmToken,
  });

  Map<String, dynamic> toMap() {
    if (otp != null) {
      return {"mobileNo": phoneNumber, "otp": otp, "fcmToken": fcmToken};
    } else {
      return {"mobileNo": phoneNumber};
    }
  }

  @override
  List<Object?> get props => [];
}
