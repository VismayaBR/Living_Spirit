// ignore_for_file: unused_field

import '../core/api_client.dart';

abstract class AuthenticationRemoteDataSource {}

class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  final ApiClient _apiClient;
  AuthenticationRemoteDataSourceImpl(this._apiClient);
}
