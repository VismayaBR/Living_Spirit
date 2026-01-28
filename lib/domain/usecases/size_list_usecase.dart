import 'package:dartz/dartz.dart';
import 'package:livingspirit/data/models/category_list_model.dart';
import 'package:livingspirit/domain/entities/app_error.dart';
import 'package:livingspirit/domain/params/no_params.dart';
import 'package:livingspirit/domain/repository/data_repository.dart';
import 'package:livingspirit/domain/usecases/usecase.dart';

class CategoryListUseCase extends UseCase<CategoryListModel, NoParams> {
  final DataRepository _dataRepository;

  CategoryListUseCase(this._dataRepository);
  @override
  Future<Either<AppError, CategoryListModel>> call(NoParams params) async {
    Map<String, dynamic> newParams = {};
    return await _dataRepository.categoryList(newParams);
  }
}