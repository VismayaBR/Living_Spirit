

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:livingspirit/domain/entities/app_error.dart';
import 'package:livingspirit/domain/entities/product_entity.dart';
import 'package:livingspirit/domain/params/product_list_args.dart';
import 'package:livingspirit/domain/params/product_list_params.dart';
import 'package:livingspirit/domain/usecases/product_list_usecase.dart';
import 'package:livingspirit/utils/debug_utils.dart';

class ProductListScreenController extends ChangeNotifier {
  ProductListUseCase productListUseCase = Get.find();

  TextEditingController searchController = TextEditingController();

  ProductListArgs args = Get.arguments;

  AppError? appError;

  List<ProductEntity> products = [];
  bool isLoading = true;
  bool? morePage = false;
  int? currentPage = 1;

  String? sortOrder;

  makeLoading() {
    isLoading = true;
    notifyListeners();
  }

  makeNotLoading() {
    isLoading = false;
    notifyListeners();
  }

  getData() async {
    appError = null;
    currentPage = 1;
    moreItemsAvailable = true;
    isLoading = true;
    final response = await productListUseCase(
      ProductListParams(
        brandId: args.brandId,
        // size: args.size,
        mainCategory: args.mainCategory,
        page: currentPage,
        search: searchController.text,
        sortDirection: sortOrder,
      ),
    );
    response.fold(
      (l) {
        appError = l;
      },
      (r) {
        if (r.success) {
          products = r.data.data;
          morePage = r.data.pagination.hasMorePages;
          currentPage = r.data.pagination.currentPage;
        }
      },
    );
    isLoading = false;
    notifyListeners();
    makeNotLoading();
  }

  bool isLoadingMore = false;
  bool moreItemsAvailable = true;
  makeNoMoreItems() {
    moreItemsAvailable = false;
    notifyListeners();
  }

  makeMoreItems() {
    moreItemsAvailable = true;
    notifyListeners();
  }

  makeLoadingMore() {
    isLoadingMore = true;
    notifyListeners();
  }

  makeNotLoadingMore() {
    isLoadingMore = false;
    notifyListeners();
  }

  Future<void> loadMore() async {
    if (moreItemsAvailable && !isLoadingMore) {
      makeLoadingMore();
      currentPage = (currentPage ?? 1) + 1;

      final response = await productListUseCase(
        ProductListParams(brandId: args.brandId, page: currentPage),
      );

      response.fold((l) => appError = l, (r) {
        if (r.success) {
          products.addAll(r.data.data);
          morePage = r.data.pagination.hasMorePages;
          if (!morePage!) makeNoMoreItems();
        }
      });

      makeNotLoadingMore();
    }
  }

  sortingOrder(value) {
    sortOrder = value;
    notifyListeners();
    consoleLog(value);
    getData();
  }
}