import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:livingspirit/data/models/brand_list_model.dart';
import 'package:livingspirit/data/models/product_details_model.dart';
import 'package:livingspirit/data/models/product_list_model.dart';
import 'package:livingspirit/data/models/category_list_model.dart';
import 'package:livingspirit/domain/entities/app_error.dart';
import '../../domain/repository/data_repository.dart';
import '../data_sources/remote_data_source.dart';

class DataRepositoryImpl extends DataRepository {
  final RemoteDataSource _remoteDataSource;

  DataRepositoryImpl(this._remoteDataSource);


   @override
  Future<Either<AppError, ProductListModel>> productList(
    Map<String, dynamic> params,
  ) async {
    try {
      final response = await _remoteDataSource.productList(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

 @override
  Future<Either<AppError, BrandListModel>> brandList(
    Map<String, dynamic> params,
  ) async {
    try {
      final response = await _remoteDataSource.brandList(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, ProductDetailsModel>> productDetails(Map<String, dynamic> params) async {
    try {
      final response = await _remoteDataSource.productDetails(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, CategoryListModel>> categoryList(Map<String, dynamic> params) async {
  try {
      final response = await _remoteDataSource.categoryList(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  
}