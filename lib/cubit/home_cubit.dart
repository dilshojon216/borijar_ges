import 'package:flutter_bloc/flutter_bloc.dart';


import '../api/api_clinet.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final ApiClient _apiClient = ApiClient();

  HomeCubit() : super(HomeStateInitial());

  void getLastData() async {
    emit(HomeStateLoading());
    try {
      final data=await _apiClient.getLastData();
      emit(LastDataState(dataModel: data));

    } catch (e) {
      emit(ErrorHomeState(message: e.toString()));
    }
  }

  void getLastDataList()async{
    emit(HomeStateLoading());
    try {
      final data=await _apiClient.getLastListData();
      emit(ListAllDataState(dataModels: data));
    } catch (e) {
      emit(ErrorHomeState(message: e.toString()));
    }
  }

  void getLastDataPump()async{
    emit(HomeStateLoading());
    try {
      final data=await _apiClient.getLastPumpData();
      emit(LastDataPumpState(dataModel: data));

    } catch (e) {
      emit(ErrorHomeState(message: e.toString()));
    }
  }

  void getLastDataPumpList()async{
    emit(HomeStateLoading());
    try {
      final data=await _apiClient.getLastPumpListData();
      emit(ListAllDataPumpState(dataModels: data));
    } catch (e) {
      emit(ErrorHomeState(message: e.toString()));
    }
  }
}
