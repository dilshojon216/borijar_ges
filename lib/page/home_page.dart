import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';


import 'package:shared_preferences/shared_preferences.dart';

import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import '../model/data_model.dart';
import '../model/pump_data_model.dart';
import 'history_page.dart';




class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  SharedPreferences? prefs;
  @override
  void initState(){
    super.initState();
    context.read<HomeCubit>().getLastDataPump();
  }
  DataModel? model;
  PumpDataModel? pumpDataModel;



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffE7ECEF),
      appBar: AppBar(
        title: const Text('Burjar GES'),

      ),
      body: BlocListener<HomeCubit,HomeState>(
         listener: (context,state){
           if(state is HomeStateLoading){

           }else if( state is LastDataState){
             setState((){
               model=state.dataModel;
             });
           }else if( state is ErrorHomeState){
             print(state.message);
           }else if(state is LastDataPumpState){
             setState((){
               pumpDataModel=state.dataModel;
             });
           }
         },
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Card(
                elevation: 3,

                child: Container(
                  width: size.width * 0.9,
                  height: 420,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text("Kuzatuv nuqtasi-1", style: GoogleFonts.poppins(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                        ),),
                      ),

                      Column(children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text("Suv tezligi:", style: GoogleFonts.poppins(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                              color: Colors.green
                          ),),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(pumpDataModel==null?"":num.parse(pumpDataModel!.sped.toString()).toStringAsFixed(2)+" m/s", style: GoogleFonts.poppins(
                              fontSize: 35,
                              fontWeight: FontWeight.w600,
                              color: Colors.green
                            ),),
                          ),
                        ),
                      ],),
                      Column(children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text("Suv hajmi:", style: GoogleFonts.poppins(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                              color: Colors.blueAccent
                          ),),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(pumpDataModel==null?"": num.parse(pumpDataModel!.flowsped.toString()).toStringAsFixed(2)+" m3/s", style: GoogleFonts.poppins(
                              fontSize: 35,
                              fontWeight: FontWeight.w600,
                                color: Colors.blueAccent
                            ),),
                          ),
                        ),
                      ],),

                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text( pumpDataModel==null ? "Ma'lumot yaqin 30 mintda keladi." :"O'lchash vaqti: ${pumpDataModel!.time}", style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),),
                        ),
                      ),
                      Center(
                        child: Row(
                         crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10,right: 20),
                              child: IconButton(onPressed: (){
                                context.read<HomeCubit>().getLastDataPump();
                              }, icon: Icon(Icons.refresh,color: Colors.blue,size: 50,)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: IconButton(onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const HistoryPage()),
                                );
                              }, icon: Icon(Icons.history,color: Colors.blue,size: 50,)),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


}
