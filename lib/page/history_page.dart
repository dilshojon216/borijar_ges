import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import '../model/data_model.dart';
import '../model/pump_data_model.dart';
import 'loading_widget.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
   List<DataModel> datamodels=[];
   List<PumpDataModel> pumpDataModelList=[];
   @override
   void initState(){
     super.initState();
     context.read<HomeCubit>().getLastDataPumpList();
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE7ECEF),
      appBar: AppBar(
        title: Text("Oxirigi  kunlik ma'lumotlar"),
      ),
      body: BlocListener<HomeCubit,HomeState>(
        listener: (context,state){
          if(state is HomeStateLoading){
            onLoading(context,"Loading...");
          }else if( state is ListAllDataState){
           // Navigator.pop(context);
            setState((){
              datamodels=state.dataModels;
            });
          }else if( state is ErrorHomeState){
            Navigator.pop(context);
            print(state.message);
          }else if(state is ListAllDataPumpState){
            setState((){
              pumpDataModelList=state.dataModels;
            });
          }
        },
        child: SingleChildScrollView(
          //scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: DataTable(
                horizontalMargin: 0,
                columns: [
                  DataColumn(
                    label: Text(
                     "Vaqti:",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                          color: Colors.blue
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "Suv tezligi\n (m/s):",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue
                      ),
                    ),
                  ),

                  DataColumn(
                    label: Text(
                      "Suv hajmi \n  (m3/s):",

                      style: GoogleFonts.poppins(

                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue
                      ),
                    ),
                  ),



                ],
                rows: List.generate(
                  pumpDataModelList.length,
                      (index) =>
                      recentUserDataRow(pumpDataModelList[index], context),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

   DataRow recentUserDataRow(PumpDataModel userInfo, BuildContext context) {
     return DataRow(
       cells: [
         DataCell(Center(child: Text(userInfo.time, style: GoogleFonts.poppins(
           fontSize: 14,
           fontWeight: FontWeight.w600,
         ),))),
         DataCell(Center(child: Text(num.parse(userInfo.sped).toStringAsFixed(3), style: GoogleFonts.poppins(
           fontSize: 14,
           fontWeight: FontWeight.w600,
         )))),

         DataCell(Center(child: Text(num.parse(userInfo.flowsped).toStringAsFixed(2), style: GoogleFonts.poppins(
           fontSize: 14,
           fontWeight: FontWeight.w600,
         )))),
       ],
     );
   }
}
