import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'package:somedemo/editMudah.dart';
import 'package:somedemo/mudah.dart';
import 'package:somedemo/provider.dart';
import 'package:somedemo/sederhana.dart';
import 'package:somedemo/sukar.dart';

import 'highScore.dart';

class EditMenu extends StatefulWidget {
  @override
  _EditMenuState createState() => _EditMenuState();
}

class _EditMenuState extends State<EditMenu> with TickerProviderStateMixin {
  AnimationController _controller;
  Tween<double> _tween = Tween(begin: 0.9, end: 1);
  Tween<double> tuin = Tween(begin: 1, end: 1);

  

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(duration: const Duration(milliseconds: 1000), vsync: this);
    _controller.repeat(reverse: true);
    // _controller.
  }
  @override
  void dispose(){
    _controller.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var h=MediaQuery.of(context).size.height;
    var w=MediaQuery.of(context).size.width;
    var prov = Provider.of<Providing>(context);

    var parser = EmojiParser();

    return Scaffold(
      backgroundColor:Color(0xFFf5f5f6),
      body:Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/bgMenu2.png'),
            ],
          ),
          
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    ScaleTransition(
                      scale: tuin.animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut)),
                      child: Container(
                        height: h*0.12,
                        width: w,
                        child: Stack(
                          children: <Widget>[
                            
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    SizedBox(height: h*0.045,),
                                    Text('Ubah Soalan',style: TextStyle(fontFamily: 'bree',fontSize: 40,fontWeight: FontWeight.w600,),),
                                  ],
                                ),
                              ],
                            ),
                            
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: h*0.03,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: (){
                          prov.editFrom='ez';
                          Navigator.push(context, MaterialPageRoute(builder: (context) => EditMudah()));
                        },
                        child: Container(
                          height: h*0.1,
                          width: w*0.8,
                          color: Colors.white,
                          child: Stack(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  SizedBox(width: w*0.05,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                          Text("Mudah",style: TextStyle(fontSize: 22,fontFamily: 'bree',color: Colors.grey[800]),),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                          Text('Ubah soalan Mudah',style: TextStyle(fontSize: 16,fontFamily: 'bree',color: Colors.green[500]),),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Stack(
                                    children: <Widget>[
                                      Opacity(
                                        opacity: 0.3,
                                        child: Image.asset('assets/button1.png')),
                                      RotationTransition(
                                        turns: _tween.animate(_controller),
                                        child: ShapeOfView(
                                          elevation: 0,
                                          child: Container(
                                            color: Colors.green[400],
                                            height: h*0.1,
                                            width: h*0.05,
                                          ),
                                          shape: StarShape(
                                            noOfPoints: 5
                                          ),
                                        ) 
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          )

                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: h*0.03,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: (){
                          prov.editFrom='med';
                          Navigator.push(context, MaterialPageRoute(builder: (context) => EditMudah()));

                        },
                        child: Container(
                          height: h*0.1,
                          width: w*0.8,
                          color: Colors.white,
                          child: Stack(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  SizedBox(width: w*0.05,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                          Text("Sederhana",style: TextStyle(fontSize: 22,fontFamily: 'bree',color: Colors.grey[800]),),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                          Text('Ubah soalan Sederhana',style: TextStyle(fontSize: 16,fontFamily: 'bree',color: Colors.amber[600]),),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Stack(
                                    children: <Widget>[
                                      Opacity(
                                        opacity: 0.3,
                                        child: Image.asset('assets/button2.png')),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: <Widget>[
                                          SizedBox(width: w*0.04,),
                                          RotationTransition(
                                            turns: _tween.animate(_controller),
                                            child: ShapeOfView(
                                              elevation: 0,
                                              child: Container(
                                                color: Colors.amber,
                                                height: h*0.1,
                                                width: h*0.06,
                                              ),
                                              shape: StarShape(
                                                noOfPoints: 5
                                              ),
                                            ) 
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: <Widget>[
                                          SizedBox(width: w*0.0,),
                                          RotationTransition(
                                            turns: _tween.animate(_controller),
                                            child: ShapeOfView(
                                              elevation: 0,
                                              child: Container(
                                                color: Colors.amber,
                                                height: h*0.05,
                                                width: h*0.03,
                                              ),
                                              shape: StarShape(
                                                noOfPoints: 5
                                              ),
                                            ) 
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          )
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: h*0.03,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: (){
                          prov.editFrom='hard';
                          Navigator.push(context, MaterialPageRoute(builder: (context) => EditMudah()));
                        },
                        child: Container(
                          height: h*0.1,
                          width: w*0.8,
                          color: Colors.red,
                          child: Stack(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  SizedBox(width: w*0.05,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                          Text("Sukar",style: TextStyle(fontSize: 22,fontFamily: 'bree',color: Colors.white),),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                          Text('Ubah soalan Sukar',style: TextStyle(fontSize: 16,fontFamily: 'bree',color: Colors.white),),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Stack(
                                    children: <Widget>[
                                      
                                      
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: <Widget>[
                                          // SizedBox(width: w*0.06,),
                                          RotationTransition(
                                            turns: _tween.animate(_controller),
                                            child: ShapeOfView(
                                              elevation: 0,
                                              child: Container(
                                                color: Colors.white,
                                                height: h*0.1,
                                                width: h*0.08,
                                              ),
                                              shape: StarShape(
                                                noOfPoints: 4
                                              ),
                                            ) 
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: <Widget>[
                                          SizedBox(width: w*0.1,),
                                          RotationTransition(
                                            turns: _tween.animate(_controller),
                                            child: ShapeOfView(
                                              child: Container(
                                                color: Colors.amber,
                                                height: h*0.1,
                                                width: h*0.04,
                                              ),
                                              shape: StarShape(
                                                noOfPoints: 5
                                              ),
                                            ) 
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: <Widget>[
                                          SizedBox(width: w*0.0,),
                                          RotationTransition(
                                            turns: _tween.animate(_controller),
                                            child: ShapeOfView(
                                              child: Container(
                                                color: Colors.amber,
                                                height: h*0.05,
                                                width: h*0.04,
                                              ),
                                              shape: StarShape(
                                                noOfPoints: 5
                                              ),
                                            ) 
                                          ),
                                        ],
                                      ),
                                      
                                    ],
                                  ),
                                ],
                              )
                            ],
                          )
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: h*0.05,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Material(
                    elevation: 8,
                    borderRadius: BorderRadius.circular(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: h*0.08,
                          width: h*0.08,
                          color: Colors.amber,
                          child: Center(child: FaIcon(FontAwesomeIcons.arrowLeft,color: Colors.grey[800],size: 30,)),
                        ),
                      ),
                    ),
                  ),
                  
                ],
              )
            ],
          ),
        ],
      ) ,
    );
  }
}