import 'package:equatable/equatable.dart';

class OnBoardEntity extends Equatable {
  final bool isIntro;

  const OnBoardEntity({required this.isIntro});

  factory OnBoardEntity.fromJson(Map<String, dynamic> introJson) {
    return OnBoardEntity(isIntro: introJson["isIntro"]);
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> introJson = {};
    introJson.addAll({
      "isIntro": isIntro,
    });
    return introJson;
  }

  @override
  List<Object?> get props => [isIntro];
}
