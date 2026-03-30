
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livingspirit/domain/entities/app_error.dart';
import 'package:livingspirit/domain/entities/banner_entity.dart';
import 'package:livingspirit/domain/entities/category_entity.dart';
import 'package:livingspirit/domain/entities/product_entity.dart';
import 'package:livingspirit/domain/params/no_params.dart';
import 'package:livingspirit/domain/params/product_details_params.dart';
import 'package:livingspirit/domain/usecases/product_details_usecase.dart';
import 'package:livingspirit/domain/usecases/size_list_usecase.dart';
import 'package:livingspirit/utils/debug_utils.dart';

class CategorySelectionController extends ChangeNotifier {
  int selectedTab = 0;
  int selectedCategoryIndex = -1;
  String? selectedCategory;
  String? selectedCategoryName;

  CategoryListUseCase categoryListUseCase = Get.find();

  List<CategoryListEntity> categories = [];
  ProductDetailsUseCase productDetailsUseCase = Get.find();
  ProductEntity? productData;
  List<BannerEntity> productBanner = [];
  // ProductListScreenController productListScreenController = Get.find();

  // OptionEntity args = Get.arguments;
  AppError? appError;
  bool isLoading = true;
 makeLoading() {
    isLoading = true;
    notifyListeners();
  }

  makeNotLoading() {
    isLoading = false;
    notifyListeners();
  }

  bool isEnglishSelected = true;

  final TextEditingController barcodeController = TextEditingController();
  final FocusNode barcodeFocusNode = FocusNode();

  void handleBarcode(String barcode) {
    consoleLog("Scanned barcode: $barcode");

    // Example: search category / product
    // getProduct(barcode);

    // Clear field for next scan
    barcodeController.clear();

    // Keep focus for next scan
    barcodeFocusNode.requestFocus();
  }

  selectTab(int index) {
    selectedTab = index;
    notifyListeners();
  }

  selectCategory(int index) {
    selectedCategoryIndex = index;
    selectedCategory = categories[index].categoryId;
    selectedCategoryName = categories[index].categories;
    notifyListeners();
    consoleLog(selectedCategoryIndex);
  }

  changeTab(index) {
    selectedTab = index;
    notifyListeners();
  }

  getData() async {
    isLoading = true;
    final response = await categoryListUseCase(NoParams());
    response.fold(
      (l) {
        consoleLog("API ERROR TYPE: ${l.runtimeType}");
        consoleLog("API ERROR: $l");
        appError = l;
      },
      (r) {
        if (r.success == true && r.data != null) {
          categories = r.data;
        } else {
          consoleLog("API SUCCESS BUT EMPTY DATA");
        }
      },
    );
    isLoading = false;
    notifyListeners();
  }

  getProduct(barcode) async {
    appError = null;

    // final int? previousSelectedIndex = selectedCategoryIndex;

    final response = await productDetailsUseCase(
      ProductDetailsParams(id: barcode),
    );

    response.fold(
      (l) {
        appError = l;
      },
      (r) {
        if (r.success) {
          productData = r.data;

         

          // if (r.data.images360!.isNotEmpty) {
          //   image_360s = r.data.images360!.map((e) => e.url).toList();
          //   _preload360Images(image_360s);
          // }

          if (r.data.images!.isNotEmpty) {
            productBanner = r.data.images!;
          }

          // if (r.data.totalStock == "0") {
          //   productListScreenController.getData();
          // }
        }
      },
    );

    makeNotLoading();
  }
}