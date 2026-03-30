

import 'package:livingspirit/data/core/api_constants.dart';
import 'package:livingspirit/data/models/brand_list_model.dart';
import 'package:livingspirit/data/models/product_details_model.dart';
import 'package:livingspirit/data/models/product_list_model.dart';
import 'package:livingspirit/data/models/category_list_model.dart';

import '../core/api_client.dart';

abstract class RemoteDataSource {
  Future<ProductListModel> productList(Map<String, dynamic> params);
  Future<BrandListModel> brandList(Map<String, dynamic> params);
  Future<ProductDetailsModel> productDetails(Map<String, dynamic> params);
  Future<CategoryListModel> categoryList(Map<String, dynamic> params);
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final ApiClient _apiClient;

  RemoteDataSourceImpl(this._apiClient);

  // @override
  // Future<ProductListModel> productList(Map<String, dynamic> params) async {
  //   final response = await _apiClient.get(
  //     params["brand_id"] != "0"
  //         ? '${ApiConstants.productList}?per_page=${params["per_page"]}&brand_id=${params["brand_id"]}&size=${params["size"]}&in_stock_only=true&search=${params["search"]}'
  //         : params["sortDirection"] != null
  //         ? '${ApiConstants.productList}?per_page=${params["per_page"]}&size=${params["size"]}&in_stock_only=true&search=${params["search"]}&sort_by=price&sort_direction=${params["sortDirection"]}'
  //         : "${ApiConstants.productList}?per_page=${params["per_page"]}&size=${params["size"]}&in_stock_only=true&search=${params["search"]}&sort_by=price${params["sortDirection"]!=null?'&sort_direction=${params["sortDirection"]}':''}",
  //     params: params,
  //   );
  //   return ProductListModel.fromJson(response);
  // }

  @override
  Future<ProductListModel> productList(Map<String, dynamic> params) async {
    String url =
        '${ApiConstants.productList}?per_page=${params["per_page"]}'
        // '&size=${params["size"]}'
        '&main_category_id=${params["main_category"]}'
        // '&in_stock_only=1'
        // '&branch_id=${params["branch_id"]}'
        '&search=${params["search"]}';

    if (params["brand_id"] != "0") {
      url += '&brand_id=${params["brand_id"]}';
    }

    url += '&sort_by=price';

    if (params["sortDirection"] != null) {
      url += '&sort_direction=${params["sortDirection"]}';
    }

    final response = await _apiClient.get(url, params: params);

    return ProductListModel.fromJson(response);
  }

  @override
  Future<BrandListModel> brandList(Map<String, dynamic> params) async {
    final response = await _apiClient.get(
      "${ApiConstants.brandList}?main_category_id=${params["main_category"]}",
      // ApiConstants.brandList,
      params: params,
    );
    return BrandListModel.fromJson(response);
  }

  @override
  Future<ProductDetailsModel> productDetails(
    Map<String, dynamic> params,
  ) async {
     String detailUrl =
        ApiConstants.productDetails;
        if (params["product"] != null) {
           detailUrl += '?id=${params["product"]}';
    }
     if (params["barcode"] != null) {
           detailUrl += '?barcode=${params["barcode"]}';
    }
    final response = await _apiClient.get(
      detailUrl,
      params: params,
    );
    return ProductDetailsModel.fromJson(response);
  }

  @override
  Future<CategoryListModel> categoryList(Map<String, dynamic> params) async {
    final response = await _apiClient.get(
      ApiConstants.categoryList,
      params: params,
    );
    return CategoryListModel.fromJson(response);
  }

  
}