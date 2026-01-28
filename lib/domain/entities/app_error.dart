import '../../common/constants.dart';
import '../../utils/snackbar_utils.dart';

class AppError {
  final AppErrorType appErrorType;
  AppError(this.appErrorType);

  handleError() {
    showMessage(errorMessage());
  }

  String errorMessage() {
    switch (appErrorType) {
      case AppErrorType.api:
        return apiError;
      case AppErrorType.network:
        return networkError;
      case AppErrorType.database:
        return databaseError;
      case AppErrorType.unauthorised:
        return unauthorisedError;
      case AppErrorType.sessionDenied:
        return sessionDeniedError;
      case AppErrorType.unexpected:
        return sessionDeniedError;
    }
  }
}

enum AppErrorType {
  api,
  network,
  database,
  unauthorised,
  sessionDenied,
  unexpected
}
