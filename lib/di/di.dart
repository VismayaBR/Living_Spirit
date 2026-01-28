import 'package:livingspirit/data/repository/data_repository_impl.dart';
import 'package:livingspirit/domain/usecases/brand_list_usecase.dart';
import 'package:livingspirit/domain/usecases/product_details_usecase.dart';
import 'package:livingspirit/domain/usecases/product_list_usecase.dart';
import 'package:livingspirit/domain/usecases/size_list_usecase.dart';
import 'package:livingspirit/presentation/screens/brand_selection_screen/brand_selection_controller.dart';
import 'package:livingspirit/presentation/screens/category_selection_screen/category_selection_controller.dart';
import 'package:livingspirit/presentation/screens/home_screen/home_screen_controller.dart';
import 'package:livingspirit/presentation/screens/product_details_screen/product_details_screen_controller.dart';
import 'package:livingspirit/presentation/screens/product_list_screen/product_list_screen_controller.dart';
import 'package:livingspirit/presentation/screens/splash_screen/splash_screen_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import '../data/core/api_client.dart';
import '../data/data_sources/auth_local_data_source.dart';
import '../data/data_sources/auth_remote_data_source.dart';
import '../data/data_sources/remote_data_source.dart';
import '../data/data_sources/user_preference_local_data_source.dart';
import '../data/repository/auth_repository_impl.dart';
import '../data/repository/user_preference_repository_impl.dart';
import '../domain/repository/auth_repository.dart';
import '../domain/repository/data_repository.dart';
import '../domain/repository/user_preference_repository.dart';
import '../presentation/core/auth_wrapper/auth_controller.dart';

class DependencyInjection {
  static init() {
    Get.lazyPut(() => ApiClient(Client()), fenix: true);
    Get.lazyPut<AuthenticationLocalDataSource>(
        () => AuthenticationLocalDataSourceImpl(),
        fenix: true);
    Get.lazyPut<DataRepository>(() => DataRepositoryImpl(Get.find()),
        fenix: true);
    Get.lazyPut<RemoteDataSource>(() => RemoteDataSourceImpl(Get.find()),
        fenix: true);
    Get.lazyPut<AuthenticationRemoteDataSource>(
        () => AuthenticationRemoteDataSourceImpl(Get.find()),
        fenix: true);
    Get.lazyPut<AuthenticationRepository>(
        () => AuthenticationRepositoryImpl(Get.find(), Get.find()),
        fenix: true);
    Get.lazyPut<UserPreferencesRepository>(
        () => UserPreferenceRepositoryImpl(Get.find()),
        fenix: true);
    Get.lazyPut<UserPreferenceLocalDataSource>(
        () => UserPreferenceLocalDataSourceImpl(),
        fenix: true);

    Get.lazyPut(() => AuthController(), fenix: true);
    Get.lazyPut(() => SplashScreenController(), fenix: true);
    Get.lazyPut(() => HomeScreenController(), fenix: true);
    Get.lazyPut(() => BrandSelectionController(), fenix: true);
    Get.lazyPut(() => CategorySelectionController(), fenix: true);
    Get.lazyPut(() => ProductListScreenController(), fenix: true);
    Get.lazyPut(() => ProductDetailsScreenController(), fenix: true);


    Get.lazyPut(() => ProductListUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => BrandListUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => ProductDetailsUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => CategoryListUseCase(Get.find()), fenix: true);

    
  }
}
