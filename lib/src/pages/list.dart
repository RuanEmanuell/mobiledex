import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import "package:flutter/services.dart";
import "dart:convert";
import 'dart:async';
import "package:http/http.dart" as http;
import "../partials/customdrawer.dart";
import "../stores/appdata.dart";
import "../pages/pokemon.dart";

//This is the pokemon list screen

//MOBX
final pokemonData=PokemonData();


class ListScreen extends StatefulWidget{
  @override
  _ListScreen createState()=>_ListScreen();

  
}


class _ListScreen extends State<ListScreen>{


  bool loading=true;
  
  final GlobalKey<ScaffoldState>_scaffoldKey=GlobalKey();


  //Fetching data from the Pokemon Go API
  Future requestData() async{
  final response=await http.get(Uri.parse("https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json"));

  if(response.statusCode==200){
    pokemonData.data = json.decode(response.body);

    Future.delayed(Duration(seconds: 3),(){
    setState(() {
      loading=false;
    });
    });

  }else{
    loading=false;
  }
}

  void initState(){
    super.initState();

    requestData();
  }

  @override

  Widget build(BuildContext context){
  
  return Scaffold(
    key:_scaffoldKey,
    appBar:AppBar(
      backgroundColor:Color.fromARGB(255, 209, 32, 19),
      title:Text("Pokemon List"),
      leading:IconButton(
        icon:Icon(Icons.menu),
        onPressed:()=>_scaffoldKey.currentState?.openDrawer()
      )
    ),
    drawer:CustomDrawer(
      pageContext:context
    ),
    body:loading == true ? Center(child: CircularProgressIndicator(color:Colors.red)) : Observer(
      builder:(_)=>GridView.count(
        crossAxisCount:2,
        children:List.generate(pokemonData.data["pokemon"].length, (index){

          

          var type=pokemonData.data["pokemon"][index]["type"][0];
          var type2=pokemonData.data["pokemon"][index]["type"].length > 1 ? pokemonData.data["pokemon"][index]["type"][1]:"";
          var typecolor;
          var typecolor2;

          //Defining the background color for each pokemon based on their types
          type == "Grass" ? typecolor=Colors.green:"";
          type == "Fire" ? typecolor=Colors.red:"";
          type == "Water" ? typecolor=Colors.blue:"";
          type == "Bug" ? typecolor=Colors.lime:"";
          type == "Normal" ? typecolor=Color.fromARGB(255, 163, 163, 163):"";
          type == "Poison" ? typecolor=Colors.purple:"";
          type == "Electric" ? typecolor=Color.fromARGB(255, 245, 228, 0):"";
          type == "Ground" ? typecolor=Color.fromARGB(255, 187, 170, 13):"";
          type == "Fighting" ? typecolor=Colors.brown:"";
          type == "Steel" ? typecolor=Color.fromARGB(255, 126, 126, 126):"";
          type == "Ice" ? typecolor=Color.fromARGB(255, 110, 202, 255):"";
          type == "Rock" ? typecolor=Color.fromARGB(255, 128, 116, 9):"";
          type == "Ghost" ? typecolor=Color.fromARGB(221, 43, 0, 124):"";
          type == "Dragon" ? typecolor=Color.fromARGB(255, 99, 43, 255):"";
          type == "Psychic" ? typecolor=Color.fromARGB(255, 255, 43, 131):"";
          type == "Flying" ? typecolor=Color.fromARGB(255, 124, 164, 197):"";


          type2 == "Grass" ? typecolor2=Colors.green:"";
          type2 == "Fire" ? typecolor2=Colors.red:"";
          type2 == "Water" ? typecolor2=Colors.blue:"";
          type2 == "Bug" ? typecolor2=Colors.lime:"";
          type2 == "Normal" ? typecolor2=Color.fromARGB(255, 163, 163, 163):"";
          type2 == "Poison" ? typecolor2=Colors.purple:"";
          type2 == "Electric" ? typecolor2=Color.fromARGB(255, 245, 228, 0):"";
          type2 == "Ground" ? typecolor2=Color.fromARGB(255, 187, 170, 13):"";
          type2 == "Fighting" ? typecolor2=Colors.brown:"";
          type2 == "Steel" ? typecolor2=Color.fromARGB(255, 126, 126, 126):"";
          type2 == "Ice" ? typecolor2=Color.fromARGB(255, 110, 202, 255):"";
          type2 == "Rock" ? typecolor2=Color.fromARGB(255, 128, 116, 9):"";
          type2 == "Ghost" ? typecolor2=Color.fromARGB(221, 43, 0, 124):"";
          type2 == "Dragon" ? typecolor2=Color.fromARGB(255, 99, 43, 255):"";
          type2 == "Psychic" ? typecolor2=Color.fromARGB(255, 255, 43, 131):"";
          type2 == "Flying" ? typecolor2=Color.fromARGB(255, 124, 164, 197):"";

          //Passing arguments to the pokemon screen(when you select one)
          return InkWell(
          onTap:(){
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder:(context)=>PokemonScreen(
                name:pokemonData.data["pokemon"][index]["name"],
                id:pokemonData.data["pokemon"][index]["num"],
                img:pokemonData.data["pokemon"][index]["img"],
                type0:pokemonData.data["pokemon"][index]["type"][0],
                type1:pokemonData.data["pokemon"][index]["type"].length > 1 ? pokemonData.data["pokemon"][index]["type"][1] : "",
                height:pokemonData.data["pokemon"][index]["height"],
                weight:pokemonData.data["pokemon"][index]["weight"],
                typecolor:typecolor,
                typecolor2:typecolor2
                )),
            );
          },
          child:Container(
              margin:EdgeInsets.only(
                top:5,
                right:8,
                bottom:5,
                left:8
              ),
              decoration:BoxDecoration(
                borderRadius:BorderRadius.circular(20),
                color:typecolor
              ),
              child:Column(
              children:[
                Container(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Text(pokemonData.data["pokemon"][index]["name"], style:TextStyle(
                    color: Colors.white, fontSize:17)),
                      Icon(Icons.info)
                  ]
                ),
              Image.network(pokemonData.data["pokemon"][index]["img"]),
              Text(("#${pokemonData.data["pokemon"][index]["num"]}"), style:TextStyle(color:Colors.white)),
               ]
              )
           )
          );

         }
        )
       )
      )
    );
  }
}