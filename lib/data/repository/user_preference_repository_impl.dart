import 'package:dartz/dartz.dart';
import 'dart:ui';

import '../../domain/entities/app_error.dart';
import '../../domain/repository/user_preference_repository.dart';
import '../data_sources/user_preference_local_data_source.dart';

class UserPreferenceRepositoryImpl extends UserPreferencesRepository {
  final UserPreferenceLocalDataSource _userPreferenceLocalDataSource;

  UserPreferenceRepositoryImpl(this._userPreferenceLocalDataSource);

  @override
  Future<Either<AppError, Unit>> changeLocale(Locale locale) async {
    try {
      await _userPreferenceLocalDataSource.changeLocale(locale);
      return const Right(unit);
    } catch (e) {
      return Left(AppError(AppErrorType.database));
    }
  }
}
