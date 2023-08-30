import 'package:flutter/material.dart';
import 'package:unical/averageCalculator.dart';
import 'package:unical/minFinal.dart';
import 'package:unical/projectBody.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.blueGrey,)
      
      .copyWith(appBarTheme: AppBarTheme(centerTitle: true, elevation: 0, backgroundColor:Colors.transparent)),
      initialRoute: '/',
      routes:{
        '/':(context) => ProjejtBody(),
        AverageFinal.routname:(context) => AverageFinal(),
        MinFinal.routname:(context) => MinFinal()

      } ,
    
    );
  }
}