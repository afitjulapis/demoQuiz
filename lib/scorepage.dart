import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'package:somedemo/demoMenu.dart';
import 'package:somedemo/highScore.dart';
import 'package:somedemo/mudah.dart';
import 'package:somedemo/provider.dart';
import 'package:somedemo/sederhana.dart';
import 'package:somedemo/sukar.dart';

class Scorepage extends StatefulWidget {
  @override
  _ScorepageState createState() => _ScorepageState();
}

class _ScorepageState extends State<Scorepage> with TickerProviderStateMixin {
  AnimationController _controller;
  Tween<double> _tween = Tween(begin: 0.9, end: 1);
  Tween<double> tuin = Tween(begin: 1, end: 1);
  var nama;

  

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
      onWillPop: () async => false,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Permainan Tamat !",style: TextStyle(fontSize: 22,fontFamily: 'bree',color: Colors.grey[800]),),
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
                          },
                          child: Container(
                            height: h*0.35,
                            width: w*0.8,
                            color: Colors.white,
                            child: Stack(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Stack(
                                      children: <Widget>[
                                        Opacity(
                                          opacity: 0.2,
                                          child: Image.asset('assets/button1.png',fit: BoxFit.fitHeight,)
                                          ),
                                        
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        // SizedBox(height: h*0.02,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(prov.iAmFrom=='ez'?"Aras Mudah":prov.iAmFrom=='med'?"Aras Sederhana":"Aras Sukar",style: TextStyle(fontSize: 22,fontFamily: 'bree',color: Colors.grey[800]),),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(prov.iAmFrom=='ez'?"Rekod tertinggi : "+prov.topScore[0].toString()+'%':prov.iAmFrom=='med'?"Rekod tertinggi : "+prov.topScore[1].toString()+'%':"Rekod tertinggi : "+prov.topScore[2].toString()+'%',style: TextStyle(fontSize: 16,fontFamily: 'bree',color: Colors.green[500]),),
                                          ],
                                        ),
                                        SizedBox(height: h*0.02,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text("Markah Anda",style: TextStyle(fontSize: 22,fontFamily: 'bree',color: Colors.grey[800]),),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(prov.iAmFrom=='ez'?"Peratusan betul : "+prov.scoreForMudah.toString()+'%':prov.iAmFrom=='med'?"Rekod tertinggi : "+prov.scoreForMedium.toString()+'%':"Rekod tertinggi : "+prov.scoreForSusah.toString()+'%',style: TextStyle(fontSize: 16,fontFamily: 'bree',color: Colors.green[500]),),
                                          ],
                                        ),
                                        SizedBox(height: h*0.1),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Material(
                                              elevation: 5,
                                              borderRadius: BorderRadius.circular(100),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(10),
                                                child: InkWell(
                                                  onTap: (){
                                                    showDialog<void>(
                                                      context: context,
                                                      barrierDismissible: false, // user must tap button!
                                                      builder: (BuildContext context) {
                                                        return Material(
                                                          color: Colors.transparent,
                                                          child: Stack(
                                                            children: <Widget>[
                                                              
                                                              Container(
                                                                height: h,
                                                                width: w,
                                                                child: BackdropFilter(
                                                                  filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                                                                  child: Container(
                                                                    color: Colors.white.withOpacity(0.1),
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                child: Column(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: <Widget>[
                                                                    Row(
                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                      children: <Widget>[
                                                                        ClipRRect(
                                                                          borderRadius: BorderRadius.circular(10),
                                                                          child: Container(
                                                                            width: w*0.8,
                                                                            height: h*0.3,
                                                                            color: Colors.white,
                                                                            child: Column(
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: <Widget>[
                                                                                Text("Simpan Markah Anda",style: TextStyle(fontSize: 22,fontFamily: 'bree',color: Colors.grey[800]),),
                                                                                SizedBox(height: h*0.04,),
                                                                                Container(
                                                                                  width: w*.6,
                                                                                  decoration: BoxDecoration(
                                                                                    border: Border.all(color:Colors.blue,width: 3),borderRadius: BorderRadius.circular(500)
                                                                                  ),
                                                                                  child: Padding(
                                                                                      padding: const EdgeInsets.fromLTRB(20,0,20,0),
                                                                                      child: TextFormField(
                                                                                      decoration: InputDecoration(hintText: 'Sila isikan nama',hintStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color:Colors.grey[500])),
                                                                                      onChanged: (String text){
                                                                                        setState(() {
                                                                                          nama=text;
                                                                                        });
                                                                                      },
                                                                                      textAlign: TextAlign.center,
                                                                                      ),
                                                                                    ),
                                                                                ),
                                                                                SizedBox(height: h*0.02,),
                                                                                ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(10),
                                                                                  child: InkWell(
                                                                                    onTap: (){
                                                                                      if(prov.iAmFrom=='ez'){
                                                                                        print('went ez');
                                                                                        prov.scoreList.add([nama,prov.scoreForMudah]);
                                                                                        prov.setSCoreList(json.encode(prov.scoreList));
                                                                                        Navigator.pop(context);
                                                                                      }else if(prov.iAmFrom=='med'){
                                                                                        prov.scoreList.add([nama,prov.scoreForMedium]);
                                                                                        prov.setSCoreListMED(json.encode(prov.scoreListMedum));
                                                                                        Navigator.pop(context);

                                                                                      }else if(prov.iAmFrom=='hard'){
                                                                                        prov.scoreList.add([nama,prov.scoreForSusah]);
                                                                                        prov.setSCoreListHARD(json.encode(prov.scoreListHard));
                                                                                        Navigator.pop(context);

                                                                                      }
                                                                                    },
                                                                                    child: Container(
                                                                                      height: h*0.06,
                                                                                      width: w*0.3,
                                                                                      color: Colors.blue,
                                                                                      child: Center(child: Text("Simpan",style: TextStyle(fontSize: 18,fontFamily: 'bree',color: Colors.white),)),
                                                                                    ),
                                                                                  ),
                                                                                )
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Container(
                                                    height: h*0.06,
                                                    width: w*0.3,
                                                    color: Colors.green,
                                                    child: Center(child: Text('Simpan Rekod',style: TextStyle(fontSize: 16,fontFamily: 'bree',color: Colors.white),),),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: w*0.05,),
                                            Material(
                                              elevation: 5,
                                              borderRadius: BorderRadius.circular(100),
                                              child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(10),
                                                  child: InkWell(
                                                    onTap: (){
                                                      if(prov.iAmFrom=='ez'){
                                                        prov.recordedAnswer=[];
                                                        Navigator.push(context, MaterialPageRoute(builder: (context) => Mudah()));
                                                      }else if(prov.iAmFrom=='med'){
                                                        prov.recordedAnswerMed=[];
                                                        Navigator.push(context, MaterialPageRoute(builder: (context) => Medium()));
                                                      }else{
                                                        if(prov.iAmFrom=='hard'){
                                                        prov.recordedAnswerSusah=[];
                                                        Navigator.push(context, MaterialPageRoute(builder: (context) => Sukar()));
                                                      }
                                                      }
                                                      
                                                    },
                                                    child: Container(
                                                      height: h*0.06,
                                                      width: w*0.3,
                                                      color: Colors.red,
                                                      child: Center(child: Text('Cuba Lagi',style: TextStyle(fontSize: 16,fontFamily: 'bree',color: Colors.white),),),
                                                    ),
                                                  ),
                                                ),
                                              
                                            )
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
                
                SizedBox(height: h*0.05,),
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
                      elevation: 5,
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: (){
                          if(prov.iAmFrom=='ez'){
                            print('ez');
                            if(prov.topScore[0]<prov.scoreForMudah){
                              prov.topScore[0]=prov.scoreForMudah;
                              prov.setTopSCore(json.encode(prov.topScore));
                            }
                          }else if(prov.iAmFrom=='med'){
                            print('med');
                            if(prov.topScore[1]<prov.scoreForMedium){
                              prov.topScore[1]=prov.scoreForMedium;
                              prov.setTopSCore(json.encode(prov.topScore));
                            }
                          }else{
                            print('susah');
                            if(prov.topScore[2]<prov.scoreForSusah){
                              prov.topScore[2]=prov.scoreForSusah;
                              prov.setTopSCore(json.encode(prov.topScore));
                            }
                          }
                          Navigator.pushNamedAndRemoveUntil(context, '/mainpage', (route)=>false);

                          
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: h*0.08,
                            width: h*0.08,
                            color: Colors.blue,
                            child: Center(child: FaIcon(FontAwesomeIcons.home,color: Colors.grey[800],size: 30,)),
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