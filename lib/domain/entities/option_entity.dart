import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class OptionEntity extends Equatable {
  final String? optionId;
  final String? optionName;
  bool isSelected;

  OptionEntity(
      { this.optionId,
       this.optionName,
      this.isSelected = false});

  @override
  List<Object?> get props => [];
}

class SelectedOptionsArgs extends Equatable {
  final OptionEntity? optionEntity;
  final Function(OptionEntity) selectedOptions;
  final String? route;
  final String? countryId;

  const SelectedOptionsArgs(
      {required this.optionEntity,
      required this.selectedOptions,
      this.route,
      this.countryId});

  @override
  List<Object?> get props => [];
}
