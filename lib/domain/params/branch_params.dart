import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class BranchParams extends Equatable {
  String? id;

  BranchParams({this.id});

  Map<String, dynamic> toMap() {
    return {"product": id};
  }

  @override
  List<Object?> get props => [];
}
