import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livingspirit/domain/entities/app_error.dart';
import 'package:livingspirit/domain/entities/category_entity.dart';
import 'package:livingspirit/domain/params/no_params.dart';
import 'package:livingspirit/domain/usecases/size_list_usecase.dart';
import 'package:livingspirit/utils/debug_utils.dart';

class CategorySelectionController extends ChangeNotifier {
  int selectedTab = 0;
  int selectedCategoryIndex = -1;
  String? selectedCategory;

  CategoryListUseCase categoryListUseCase = Get.find();

  List<CategoryListEntity> categories = [];

  // OptionEntity args = Get.arguments;
  AppError? appError;
  bool isLoading = true;

  bool isEnglishSelected = true;

  selectTab(int index) {
    selectedTab = index;
    notifyListeners();
  }

  selectCategory(int index) {
    selectedCategoryIndex = index;
    selectedCategory = categories[index].categories;
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
}
