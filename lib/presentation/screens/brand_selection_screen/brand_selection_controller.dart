
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livingspirit/domain/entities/app_error.dart';
import 'package:livingspirit/domain/entities/brand_entity.dart';
import 'package:livingspirit/domain/entities/type_entity.dart';
import 'package:livingspirit/domain/params/brand_list_params.dart';
import 'package:livingspirit/domain/usecases/brand_list_usecase.dart';
import 'package:livingspirit/utils/debug_utils.dart';

class BrandSelectionController extends ChangeNotifier {
  final ScrollController scrollController = ScrollController(
    debugLabel: "brand_grid_view",
  );

  final BrandListUseCase brandListUseCase = Get.find();

  TypeEntity args = Get.arguments;

  List<BrandEntity> brandList = [];
  int selectedBrandIndex = -2; // -2 = nothing selected

  AppError? appError;
  bool isLoading = true;

  void makeLoading() {
    isLoading = true;
    notifyListeners();
  }

  void makeNotLoading() {
    isLoading = false;
    notifyListeners();
  }

  Future<void> retry() async {
    makeLoading();
    await getData();
  }

  void selectBrand(int index) {
    selectedBrandIndex = index;
    notifyListeners();
  }

  void selectAllBrands() {
    selectedBrandIndex = -1;
    consoleLog('Selected Brand: All Brands');
    notifyListeners();
  }

  getData() async {
    final response = await brandListUseCase(BrandListParams(mainCategory: args.mainCategory));
    response.fold((l) => appError = l, (r) {
      if (r.success) {

        brandList = r.data;
      }
    });
    makeNotLoading();
  }

  // Pagination variables
  int offset = 1;
  bool isLoadingMore = false;
  bool moreItemsAvailable = true;

  void makeNoMoreItems() {
    moreItemsAvailable = false;
    notifyListeners();
  }

  void makeMoreItems() {
    moreItemsAvailable = true;
    notifyListeners();
  }

  void makeLoadingMore() {
    isLoadingMore = true;
    notifyListeners();
  }

  void makeNotLoadingMore() {
    isLoadingMore = false;
    notifyListeners();
  }

  loadMore() async {
    if (moreItemsAvailable && !isLoadingMore) {
      makeLoadingMore();
    }
  }
}