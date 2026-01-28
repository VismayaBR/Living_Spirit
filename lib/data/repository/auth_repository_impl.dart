// ignore_for_file: unused_field

import 'package:get/get.dart';
import '../../domain/repository/auth_repository.dart';
import '../../presentation/core/auth_wrapper/auth_controller.dart';
import '../data_sources/auth_local_data_source.dart';
import '../data_sources/auth_remote_data_source.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDataSource _authenticationRemoteDataSource;
  final AuthenticationLocalDataSource _authenticationLocalDataSource;

  AuthenticationRepositoryImpl(this._authenticationRemoteDataSource,
      this._authenticationLocalDataSource);

  AuthController authController = Get.find();
}
