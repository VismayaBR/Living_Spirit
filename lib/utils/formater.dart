// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../presentation/core/auth_wrapper/auth_controller.dart';
import '../presentation/theme/theme.dart';

AuthController authController = Get.find();

durationToHms(Duration duration) {
  int totalHours = duration.inHours;
  int totalMinutes = duration.inMinutes;
  int totalSeconds = duration.inSeconds;

  int minutes = totalMinutes % 60;
  int seconds = totalSeconds % 60;

  return "${totalHours.toString().padLeft(2, "0")}:${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
}

durationToMs(Duration duration) {
  int totalMinutes = duration.inMinutes;
  int totalSeconds = duration.inSeconds;

  int minutes = totalMinutes % 60;
  int seconds = totalSeconds % 60;

  return "${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
}

obscurePhoneNumber(String phoneNumber) {
  return phoneNumber.replaceRange(0, 6, "******");
}

emailChecking(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

Future<void> launchSocialMediaAppIfInstalled(
  String url,
) async {
  try {
    bool launched =
        await launch(url, forceSafariVC: false); // Launch the app if installed!

    if (!launched) {
      launch(url); // Launch web view if app is not installed!
    }
  } catch (e) {
    launch(url); // Launch web view if app is not installed!
  }
}

showCalendar(BuildContext context, DateTime initialDate, DateTime firstDate,
        DateTime lastDate) async =>
    await showDatePicker(
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        context: context,
        initialDate: initialDate,
        firstDate: firstDate,
        lastDate: lastDate,
        builder: (context, child) {
          return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: primaryColor, // header background color
                  onPrimary: whiteColor, // header text color
                  onSurface: blackColor, // body text color
                ),
              ),
              child: child!);
        });


dateFormaterWithTime(DateTime dateTime) {
  return DateFormat("dd MMM yyyy | hh:mm:aa").format(dateTime);
}

extension StringExtension on String {
  String toCapitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

int timeBetween(DateTime from, DateTime to) {
  from = DateTime(from.year, from.month, from.day, from.hour, from.minute);
  to = DateTime(to.year, to.month, to.day, to.hour, to.minute);
  return (to.difference(from).inHours);
}

bool isTab() {
  final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
  return data.size.shortestSide < 600 ? false : true;
}