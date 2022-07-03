import 'package:equatable/equatable.dart';


import '../model/data_model.dart';
import '../model/pump_data_model.dart';

abstract class HomeState extends Equatable{
  const HomeState();
  @override
  List<Object> get props => [];
}

class HomeStateInitial extends HomeState{}

class HomeStateLoading extends HomeState{}

class LastDataState extends HomeState{
  final DataModel dataModel;
  const LastDataState({required this.dataModel});
  @override
  List<Object> get props => [dataModel];
}
class ListAllDataState extends HomeState{
  final List<DataModel> dataModels;
 const ListAllDataState({required this.dataModels});

  @override
  List<Object> get props => [dataModels];
}

class LastDataPumpState extends HomeState{
  final PumpDataModel dataModel;
  const LastDataPumpState({required this.dataModel});
  @override
  List<Object> get props => [dataModel];
}
class ListAllDataPumpState extends HomeState{
  final List<PumpDataModel> dataModels;
  const ListAllDataPumpState({required this.dataModels});

  @override
  List<Object> get props => [dataModels];
}

class ErrorHomeState extends HomeState{
  final String message;
  const ErrorHomeState({required this.message});

}