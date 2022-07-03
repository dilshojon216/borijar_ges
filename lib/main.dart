import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/home_cubit.dart';
import 'page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context)=>HomeCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Burjar GES',
        theme: ThemeData(
          // is not restarted.

          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}

