import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart';
// ignore: implementation_imports
import "package:http/src/multipart_file.dart" as multipart;
// ignore: implementation_imports
import 'package:http/src/response.dart' as res;
// ignore: depend_on_referenced_packages
import 'package:http_parser/http_parser.dart';

import 'package:livingspirit/l10n/app_localizations.dart';
import '../../presentation/core/auth_wrapper/auth_controller.dart';
import '../../presentation/route/route_constants.dart';
import '../../utils/debug_utils.dart';
import '../../utils/snackbar_utils.dart';
import '../data_sources/auth_local_data_source.dart';
import 'api_constants.dart';

class ApiClient {
  final Client _client;

  ApiClient(this._client);

  AuthenticationLocalDataSource authenticationLocalDataSource = Get.find();

  dynamic get(String path, {Map<dynamic, dynamic>? params}) async {
    consoleLog(getPath(path));
    consoleLog(jsonEncode(params));
    AuthController authController = Get.find();

    final response = await _client.get(
      getPath(path),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': authController.user != null
            ? 'Bearer ${authController.user!.sessionId}'
            : "",
      },
    );
    consoleLog(response.body);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 401) {
      authenticationLocalDataSource.deleteUser();
      Get.until((route) => Get.currentRoute == RouteList.initial);
      showMessage(AppLocalizations.of(Get.context!)!.please_login_to_continue);
    } else if (response.statusCode == 404) {
      // Get.toNamed(
      //   RouteList.errorScreen,
      //   arguments: ErrorEntity(
      //     imageUrl: "assets/page_not_found.png",
      //     title: AppLocalizations.of(Get.context!).page_not_found,
      //     description: AppLocalizations.of(Get.context!).page_not_found_des,
      //   ),
      // );
    } else if (response.statusCode == 500) {
      // Get.toNamed(
      //   RouteList.errorScreen,
      //   arguments: ErrorEntity(
      //     imageUrl: "assets/internal_server_error.png",
      //     title: AppLocalizations.of(Get.context!).internal_server_error,
      //     description: AppLocalizations.of(Get.context!).server_error_des,
      //   ),
      // );
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  dynamic post(String path, Map<dynamic, dynamic> params) async {
    consoleLog(getPath(path));
    consoleLog(jsonEncode(params));
    AuthController authController = Get.find();
    final response = await _client.post(
      getPath(path),
      body: jsonEncode(params),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': authController.user != null
            ? 'Bearer ${authController.user!.sessionId}'
            : "",
      },
    );
    consoleLog(response.body);

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      return responseJson;
    } else if (response.statusCode == 401) {
      authenticationLocalDataSource.deleteUser();
      Get.until((route) => Get.currentRoute == RouteList.initial);
      showMessage(AppLocalizations.of(Get.context!)!.please_login_to_continue);
    } else if (response.statusCode == 404) {
      // Get.toNamed(
      //   RouteList.errorScreen,
      //   arguments: ErrorEntity(
      //     imageUrl: "assets/page_not_found.png",
      //     title: AppLocalizations.of(Get.context!).page_not_found,
      //     description: AppLocalizations.of(Get.context!).page_not_found_des,
      //   ),
      // );
    } else if (response.statusCode == 500) {
      // Get.toNamed(
      //   RouteList.errorScreen,
      //   arguments: ErrorEntity(
      //     imageUrl: "assets/internal_server_error.png",
      //     title: AppLocalizations.of(Get.context!).internal_server_error,
      //     description: AppLocalizations.of(Get.context!).server_error_des,
      //   ),
      // );
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  dynamic postWithoutStatus(String path, Map<dynamic, dynamic> params) async {
    consoleLog(getPath(path));
    consoleLog(jsonEncode(params));
    AuthController authController = Get.find();
    final response = await _client.post(
      getPath(path),
      body: jsonEncode(params),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': authController.user != null
            ? 'Bearer ${authController.user!.sessionId}'
            : "",
      },
    );
    consoleLog(response.body);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 401) {
      authenticationLocalDataSource.deleteUser();
      Get.until((route) => Get.currentRoute == RouteList.initial);
      showMessage(AppLocalizations.of(Get.context!)!.please_login_to_continue);
    } else if (response.statusCode == 404) {
      // Get.toNamed(
      //   RouteList.errorScreen,
      //   arguments: ErrorEntity(
      //     imageUrl: "assets/page_not_found.png",
      //     title: AppLocalizations.of(Get.context!).page_not_found,
      //     description: AppLocalizations.of(Get.context!).page_not_found_des,
      //   ),
      // );
    } else if (response.statusCode == 500) {
      // Get.toNamed(
      //   RouteList.errorScreen,
      //   arguments: ErrorEntity(
      //     imageUrl: "assets/internal_server_error.png",
      //     title: AppLocalizations.of(Get.context!).internal_server_error,
      //     description: AppLocalizations.of(Get.context!).server_error_des,
      //   ),
      // );
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  dynamic formData({
    required Map<String, dynamic> data,
    Map<String, File>? images,
    Map<String, File>? images2,
    Map<String, File>? images3,
    required String path,
  }) async {
    consoleLog(ApiConstants.baseUrl + path);
    consoleLog(data);
    AuthController authController = Get.find();
    var request = MultipartRequest(
      "POST",
      Uri.parse(ApiConstants.baseUrl + path),
    );
    request.headers.addAll({
      'Authorization': authController.user != null
          ? 'Bearer ${authController.user!.sessionId}'
          : "",
    });

    data.forEach((key, value) {
      if (value is List) {
        for (var element in value) {
          final index = value.indexOf(element);
          final fieldString = "$key[$index]";
          request.fields[fieldString] = element.toString();
        }
      } else {
        request.fields[key] = value.toString();
      }
    });

    images!.forEach((key, value) async {
      var multipartFile = await multipart.MultipartFile.fromPath(
        key,
        value.path,
        contentType: MediaType("image", "jpeg"),
      );
      request.files.add(multipartFile);
    });

    if (images2 != null) {
      images2.forEach((key, value) async {
        var multipartFile = await multipart.MultipartFile.fromPath(
          key,
          value.path,
          contentType: MediaType("image", "jpeg"),
        );
        request.files.add(multipartFile);
      });
    }

    if (images3 != null) {
      images3.forEach((key, value) async {
        var multipartFile = await multipart.MultipartFile.fromPath(
          key,
          value.path,
          contentType: MediaType("image", "jpeg"),
        );
        request.files.add(multipartFile);
      });
    }

    final response = await request.send();
    var httpResponse = await res.Response.fromStream(response);
    final jsonresposne = json.decode(httpResponse.body);
    consoleLog(jsonresposne);
    return jsonresposne;
  }

  dynamic formDataMultiple({
    required Map<String, dynamic> data,
    List<File>? images,
    required String path,
  }) async {
    consoleLog(ApiConstants.baseUrl + path);
    consoleLog(data);
    AuthController authController = Get.find();
    var request = MultipartRequest(
      "POST",
      Uri.parse(ApiConstants.baseUrl + path),
    );
    request.headers.addAll({
      'Authorization': authController.user != null
          ? 'Bearer ${authController.user!.sessionId}'
          : "",
    });

    data.forEach((key, value) {
      if (value is List) {
        for (var element in value) {
          final index = value.indexOf(element);
          final fieldString = "$key[$index]";
          request.fields[fieldString] = element.toString();
        }
      } else {
        request.fields[key] = value.toString();
      }
    });

    if (images != null && images.isNotEmpty) {
      // ignore: avoid_function_literals_in_foreach_calls
      images.forEach((image) async {
        var multipartFile = await multipart.MultipartFile.fromPath(
          "files",
          image.path,
          contentType: MediaType("image", "jpeg"),
        );
        request.files.add(multipartFile);
      });
    }

    // request.files.add(multipartFile);
    final response = await request.send();
    var httpResponse = await res.Response.fromStream(response);
    final jsonresposne = json.decode(httpResponse.body);
    consoleLog(jsonresposne);
    return jsonresposne;
  }

  Uri getPath(String path, {Map<dynamic, dynamic>? params}) {
    return Uri.parse('${ApiConstants.baseUrl}$path');
  }
}
