import 'package:equatable/equatable.dart';

class PaginationParams extends Equatable {
  final int? page;
  final int limit;

  const PaginationParams({this.page, this.limit = 10});

  Map<String, dynamic> toMap() {
    if (page != null) {
      return {
        "options": {"page": page, "limit": limit},
      };
    } else {
      return {};
    }
  }

  @override
  List<Object?> get props => [];
}
