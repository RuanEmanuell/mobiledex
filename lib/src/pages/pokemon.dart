import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import "package:flutter/services.dart";
import "dart:convert";
import "package:http/http.dart" as http;
import "../partials/customdrawer.dart";
import "../pages/list.dart";


class PokemonScreen extends StatelessWidget{

  PokemonScreen({this.name="", this.id="", this.img="", this.type0="", 
  this.type1="", this.height="", this.weight="", this.typecolor="", this.typecolor2=""});

  var typecolor;
  var typecolor2;
  final String name;
  final String id;
  final String img;
  final String type0;
  final String type1;
  final String height;
  final String weight;
  

  @override
  Widget build(BuildContext context){

  //Defining the status bar height, device width and device height
  final double statusBarHeight=MediaQuery.of(context).viewPadding.top;
  final double deviceWidth=MediaQuery.of(context).size.width;
  final double deviceHeight=MediaQuery.of(context).size.height;

  return Scaffold(
    body:Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children:[
      Container(
          margin:EdgeInsets.only(
            bottom:50
          ),
          padding:EdgeInsets.only(
            top:50
          ),
          decoration:BoxDecoration(
              color:typecolor,
              borderRadius:BorderRadius.only(
                bottomLeft:Radius.circular(20),
                bottomRight:Radius.circular(20),
              )
              ),
        child:Column(
        children:[
      Center(
      child:Column(
        children:[


          Container(
            margin:EdgeInsets.only(
              bottom:30
            ),
            child:Image.network(img, scale:0.7),
            width:deviceWidth,
            height:250
          ),
        ]
      )
      )
      ]
      )
      ),
        

          Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
          Text(name, style:TextStyle(
          fontSize:35,
          fontWeight:FontWeight.bold
             )
            ),
          Container(width: 5),
          Text("#${id}", style:TextStyle(
            fontSize:35,
          ))
           ]
          ),

        Container(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[

                 Text(type0, style:TextStyle(
                  color:typecolor,
                  fontSize:27
                )),

                type1.length>0?Text("/", style:TextStyle(
                  fontSize:27
                )):Text(""),

                Text(type1, style:TextStyle(
                  color:typecolor2,
                    fontSize:27
                ))
                
            ]
          ),
          
          Container(height: 40),

          Divider(
            thickness: 1,
          ),

          Container(height: 40),

       
          Container(
          margin:EdgeInsets.only(
            top:20,
            left:25),
          child:Row(
            children:[
              Container(
                margin:EdgeInsets.only(
                  right:30,
                  left:20
                ),
                child:Text("Height: ${height}", style:TextStyle(fontSize: 20))
              ),

              Container(
                child:Text("Weight: ${weight}", style:TextStyle(fontSize: 20))
              ),
          
          
        ]
      ),
      
    ),
    Container(height: 50),

    
    Container(
      decoration:BoxDecoration(
        shape:BoxShape.circle,
        border:Border.all(color:typecolor, width:4),
      ),
       child:Center(
            child:IconButton(
            icon:Icon(Icons.close, size:32, color:typecolor),
            onPressed:(){
              Navigator.pop(context);
            }
          )
          )
          )
    ]
    )
  );
  }
}