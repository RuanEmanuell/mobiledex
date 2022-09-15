import 'package:flutter/material.dart';


Widget CustomDrawer({
  BuildContext? pageContext
}){
  return Drawer(
    child:ListView(
      children:[
       Container(
        color:Color.fromARGB(255, 209, 32, 19),
        child:DrawerHeader(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Text("MobileDex", style:TextStyle(color: Colors.white, fontSize:15)),
             Text("v1.0.0", style:TextStyle(color: Color.fromARGB(171, 255, 255, 255), fontSize:12))
            ]
          )
        ),
       ),
       ListTile(
        leading:Icon(Icons.home),
        title:Text("Home"),
        onTap:(){
          Navigator.pushNamed(pageContext!, "/home");
        }
       ),
       ListTile(
        leading:Icon(Icons.list),
        title:Text("View Pokemon List"),
        onTap:(){
          Navigator.pushNamed(pageContext!, "/list");
        }
       )
      ]
    )
  );
}