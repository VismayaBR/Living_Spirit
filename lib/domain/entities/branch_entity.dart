import 'package:equatable/equatable.dart';

class BranchEntity extends Equatable {
  final String branchId;
  final String branchName;
  final String? branchCode;
  final String? branchLocation;
  final String? phone;

  const BranchEntity({
    required this.branchId,
    required this.branchName,
    this.branchCode,
    this.branchLocation,
    this.phone,
  });

  @override
  List<Object> get props => [];
}
