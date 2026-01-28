import 'package:dartz/dartz.dart';
import 'package:livingspirit/data/models/brand_list_model.dart';
import 'package:livingspirit/domain/entities/app_error.dart';
import 'package:livingspirit/domain/params/brand_list_params.dart';
import 'package:livingspirit/domain/repository/data_repository.dart';
import 'package:livingspirit/domain/usecases/usecase.dart';

class BrandListUseCase extends UseCase<BrandListModel, BrandListParams> {
  final DataRepository _dataRepository;

  BrandListUseCase(this._dataRepository);
  @override
  Future<Either<AppError, BrandListModel>> call(
    BrandListParams params,
  ) async {
    Map<String, dynamic> newParams = {};
    newParams.addAll(params.toMap());

    return await _dataRepository.brandList(newParams);
  }
}
