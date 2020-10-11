import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'package:tekaapa/editMenu.dart';
import 'package:tekaapa/mudah.dart';
import 'package:tekaapa/provider.dart';
import 'package:tekaapa/sederhana.dart';
import 'package:tekaapa/sukar.dart';

import 'highScore.dart';

class DemoMenu extends StatefulWidget {
  @override
  _DemoMenuState createState() => _DemoMenuState();
}

class _DemoMenuState extends State<DemoMenu> with TickerProviderStateMixin {
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

    return WillPopScope(
      onWillPop: ()async=>false,
      child: Scaffold(
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(width: w*0.28,),
                                  Text('Teka',style: TextStyle(fontFamily: 'bree',fontSize: 40,fontWeight: FontWeight.w600,)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(width: w*0.34,),
                                  Column(
                                    children: <Widget>[
                                      SizedBox(height: h*0.045,),
                                      Text('Apa',style: TextStyle(fontFamily: 'bree',fontSize: 40,fontWeight: FontWeight.w600,),),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(width: w*0.2,),
                                  Column(
                                    children: <Widget>[
                                      SizedBox(height: h*0.028,),
                                      Text(parser.emojify('🕵️'),style: TextStyle(fontSize: 50, fontWeight: FontWeight.w600),),
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
                            prov.recordedAnswer=[];
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Mudah()));
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
                                            Text("Rekod tertinggi : "+prov.topScore[0].toString()+'%',style: TextStyle(fontSize: 16,fontFamily: 'bree',color: Colors.green[500]),),
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
                            prov.recordedAnswerMed=[];
                            prov.topScore[0]>50?Navigator.push(context, MaterialPageRoute(builder: (context) => Medium())):null;

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
                                            Text("Rekod tertinggi: "+prov.topScore[1].toString()+'%',style: TextStyle(fontSize: 16,fontFamily: 'bree',color: Colors.amber[600]),),
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
                                prov.topScore[0]>50?Container():Container(
                                  height: h*0.1,
                                  width: w*0.8,
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(sigmaX: 8, sigmaY: 5),
                                    child: Container(
                                      color: Colors.amber.withOpacity(0.2),
                                    ),
                                  ),
                                ),
                                prov.topScore[0]>50?Container():Container(
                                  height: h*0.1,
                                  width: w*0.8,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text("Capai 50% di Mudah",style: TextStyle(fontSize: 18,fontFamily: 'bree',color: Colors.grey[800]),),
                                      SizedBox(width: w*0.05,),
                                      FaIcon(FontAwesomeIcons.lock,color: Colors.grey[800],size: 30,),

                                      
                                    ],
                                  )
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
                            prov.recordedAnswerSusah=[];
                            prov.topScore[1]>50? Navigator.push(context, MaterialPageRoute(builder: (context) => Sukar())):null;
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
                                            Text("Rekod tertinggi: "+prov.topScore[2].toString()+'%',style: TextStyle(fontSize: 16,fontFamily: 'bree',color: Colors.white),),
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
                                        prov.topScore[1]>50?Container(): Container(
                                          height: h*0.1,
                                          width: w*0.8,
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 5),
                                            child: Container(
                                              color: Colors.red.withOpacity(0.2),
                                            ),
                                          ),
                                        ),
                                        prov.topScore[1]>50?Container():Container(
                                          height: h*0.1,
                                          width: w*0.8,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Text("Capai 50% di Sederhana",style: TextStyle(fontSize: 18,fontFamily: 'bree',color: Colors.grey[800]),),
                                              SizedBox(width: w*0.05,),
                                              FaIcon(FontAwesomeIcons.lock,color: Colors.grey[800],size: 30,),

                                              
                                            ],
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
                            Navigator.push(context, MaterialPageRoute(builder: (context) => HighScore()));
                          },
                          child: Container(
                            height: h*0.08,
                            width: h*0.08,
                            color: Colors.amber,
                            child: Center(child: FaIcon(FontAwesomeIcons.medal,color: Colors.grey[800],size: 30,)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: w*0.1,),
                    Material(
                      elevation: 8,
                      borderRadius: BorderRadius.circular(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => EditMenu()));
                          },
                          child: Container(
                            height: h*0.08,
                            width: h*0.08,
                            color: Colors.blue,
                            child: Center(child: FaIcon(FontAwesomeIcons.plus,color: Colors.white,size: 30,)),
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
      ),
    );
  }
}