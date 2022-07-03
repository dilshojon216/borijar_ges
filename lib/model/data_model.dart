import 'package:equatable/equatable.dart';

class DataModel extends Equatable{
  final String id;
  final String data;
  final String time;

  const DataModel({required this.id, required this.data, required this.time});

  factory DataModel.fromJson(Map<String, dynamic> json){
    return DataModel(id: json["id"].toString(), data: json["data"], time: json["time"]);
  }
  @override
  List<Object?> get props => [id,data,time];

}