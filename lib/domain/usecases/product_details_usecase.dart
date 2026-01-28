import 'package:dartz/dartz.dart';
import 'package:livingspirit/data/models/product_details_model.dart';
import 'package:livingspirit/domain/entities/app_error.dart';
import 'package:livingspirit/domain/params/product_details_params.dart';
import 'package:livingspirit/domain/repository/data_repository.dart';
import 'package:livingspirit/domain/usecases/usecase.dart';

class ProductDetailsUseCase extends UseCase<ProductDetailsModel, ProductDetailsParams> {
  final DataRepository _dataRepository;

  ProductDetailsUseCase(this._dataRepository);
  @override
  Future<Either<AppError, ProductDetailsModel>> call(ProductDetailsParams params) async {
    Map<String, dynamic> newParams = {};
    newParams.addAll(params.toMap());
    return await _dataRepository.productDetails(newParams);
  }
}