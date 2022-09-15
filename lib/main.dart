import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import "package:flutter/services.dart";
import "dart:convert";
import 'dart:async';
import "package:http/http.dart" as http;
import "src/pages/home.dart";
import "src/pages/list.dart";
import "src/pages/pokemon.dart";
import "src/pages/search.dart";
import "src/pages/favorite.dart";

void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      initialRoute:"/preload",
      routes:{
        "/home":(context)=>HomeScreen(),
        "/list":(context)=>ListScreen(),
        "/pokemon":(context)=>PokemonScreen(),
        "/favorite":(context)=>FavoriteScreen(),
        "search":(context)=>SearchScreen(),
        "preload":(context)=>PreloadScreen()
      }
    );
  }
}