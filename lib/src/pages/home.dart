import 'package:flutter/material.dart';
import "../partials/customdrawer.dart";

class HomeScreen extends StatelessWidget{

  final GlobalKey<ScaffoldState>_scaffoldKey=GlobalKey();

  @override
  Widget build(BuildContext context){
  return Scaffold(
    key:_scaffoldKey,
    appBar:AppBar(
      backgroundColor:Color.fromARGB(255, 209, 32, 19),
      title:Text("Welcome to MobileDex!"),
      leading:IconButton(
        icon:Icon(Icons.menu),
        onPressed:()=>_scaffoldKey.currentState?.openDrawer()
      )
    ),
    drawer:CustomDrawer(
      pageContext:context
    ),
    body:Center(
      child:Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
      Image.asset("lib/assets/mobiledex.png", width:250),
      Text("v1.0.0", style:TextStyle(
        fontSize:20
      )),
      Container(height: 30),


      ElevatedButton(
        child:Text("View Pokemon List"),
        style:ElevatedButton.styleFrom(
          primary:Color.fromARGB(255, 209, 32, 19),
        ),
        onPressed:(){
          Navigator.pushNamed(context, "/list");
        }
      )
    

        
      ]
      )
      ),
  );
  }
}