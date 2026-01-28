import 'package:dartz/dartz.dart';
import 'package:livingspirit/data/models/product_list_model.dart';
import 'package:livingspirit/domain/entities/app_error.dart';
import 'package:livingspirit/domain/params/product_list_params.dart';
import 'package:livingspirit/domain/repository/data_repository.dart';
import 'package:livingspirit/domain/usecases/usecase.dart';

class ProductListUseCase extends UseCase<ProductListModel, ProductListParams> {
  final DataRepository _dataRepository;

  ProductListUseCase(this._dataRepository);
  @override
  Future<Either<AppError, ProductListModel>> call(ProductListParams params) async {
    Map<String, dynamic> newParams = {};
    newParams.addAll(params.toMap());


    return await _dataRepository.productList(newParams);
  }
}