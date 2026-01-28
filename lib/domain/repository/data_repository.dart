import 'package:dartz/dartz.dart';
import 'package:livingspirit/data/models/brand_list_model.dart';
import 'package:livingspirit/data/models/product_details_model.dart';
import 'package:livingspirit/data/models/product_list_model.dart';
import 'package:livingspirit/data/models/category_list_model.dart';
import 'package:livingspirit/domain/entities/app_error.dart';

abstract class DataRepository {
  //Product List
  Future<Either<AppError, ProductListModel>> productList(
    Map<String, dynamic> params,
  );

  //Brand List
   Future<Either<AppError, BrandListModel>> brandList(
    Map<String, dynamic> params,
  );

 //Size List
   Future<Either<AppError, CategoryListModel>> categoryList(
    Map<String, dynamic> params,
  );

  //Product Details
   Future<Either<AppError, ProductDetailsModel>> productDetails(
    Map<String, dynamic> params,
  );


}
