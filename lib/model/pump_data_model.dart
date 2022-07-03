import 'package:equatable/equatable.dart';

class PumpDataModel extends Equatable {
  final String id;
  final String sped;
  final String flowsped;
  final String time;

   PumpDataModel(
      {required this.id,
      required this.sped,
      required this.flowsped,
      required this.time});

  factory PumpDataModel.fromJson(Map<String, dynamic> json) {
    return PumpDataModel(
        id: json["id"].toString(),
        sped: json["sped"].toString(),
        flowsped: json["flowsped"].toString(),
        time: json["time"].toString());
  }

  @override
  List<Object?> get props => [id, sped, flowsped, time];
}
