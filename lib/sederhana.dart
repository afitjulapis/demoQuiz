import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:random_color/random_color.dart';
import 'package:somedemo/provider.dart';
import 'package:somedemo/scorepage.dart';

class Medium extends StatefulWidget {
  @override
  _MediumState createState() => _MediumState();
}

class _MediumState extends State<Medium> {
  
  int correctans;
  int totalAnswerd;
  int selectedIndex;
  int servicesIndex;
  int answeredquestions;
  PageController controller;
  
  

  void onPageChanged(int pagenum) {
    setState(() {
      selectedIndex = pagenum;
      // answeredquestions=(((pagenum+1)/a.length)*100).round();
      // print(answeredquestions);
    });
  }

   @override
  void initState() {
    onPageChanged(0);
    controller = PageController(initialPage: 0);
    correctans=0;
    totalAnswerd=0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var h=MediaQuery.of(context).size.height;
    var w=MediaQuery.of(context).size.width;
    var prov = Provider.of<Providing>(context);
    var progBar=(w*0.8)*(correctans/prov.soalanMedium.length);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor:Color(0xFFf5f5f6),
        body: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Opacity(
                  opacity: 0.5,
                  child: Image.asset('assets/bgMenu2.png')),
              ],
            ),
            Column(
              children: <Widget>[
                SizedBox(height: h*0.07,),
                InkWell(
                  onTap: (){
                    Navigator.pushNamedAndRemoveUntil(context, '/mainpage', (route)=>false);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(width: w*0.02,),
                      FaIcon(FontAwesomeIcons.home,color: Colors.blue,size: 16,),
                      SizedBox(width: w*0.01,),
                      Text('Menu',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color:Colors.blue)),
                    ],
                  ),
                ),
                SizedBox(height: h*0.02,),
                Text('Peratusan betul:',style:TextStyle(fontWeight: FontWeight.normal,fontSize: 16,color:Colors.grey[500])),
                SizedBox(height: h*0.01 ,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(width: w*0.1,),
                    Stack(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(500),
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 100),
                            height: h*0.06,
                            width: progBar,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [Colors.purple,Colors.pink])
                            ),
                            
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(500),
                          child: Container(
                            height: h*0.06,
                            width: w*.8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(500),
                              border: Border.all(color: Colors.grey[300],width: 3),
                            ),
                            
                          ),
                        ),
                        Container(
                          width: w*0.8,
                          height: h*0.06,
                          child: Center(
                            child: Stack(
                                children: <Widget>[
                                  Text(((correctans/prov.soalanMedium.length)*100).round().toString()+'%',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color:progBar>w*0.4? Colors.white:Colors.grey[800])),
                                  
                                ],
                              ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: h*0.05,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(500),
                  child: Container(
                    width: w*0.45,
                    height: h*0.08,
                    color: Colors.amber,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text('Soalan '+(selectedIndex+1).toString(),style:TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color:Colors.white)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text('daripada '+prov.soalanMedium.length.toString(),style:TextStyle(fontWeight: FontWeight.normal,fontSize: 16,color:Colors.white)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                

                Expanded(
                  child: PageView(
                    controller: controller,
                    children: addedAttendeesList(),
                    onPageChanged: onPageChanged,
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }


  addedAttendeesList() {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    
    var prov = Provider.of<Providing>(context);
    List<Widget> listwidget = [];
    

    for(int  i = 0; i < prov.soalanMedium.length; i++){
      if(prov.recordedAnswerMed.length<i+1){
          prov.recordedAnswerMed.add(99);
          print(prov.recordedAnswerMed);
      }
      listwidget.add(
        Container(
          color: Colors.transparent,
          height: h,
          width: w,
          child: Column(
            children: <Widget>[
              SizedBox(height: h*0.07,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(prov.soalanMedium[i]['question'],style:TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color:Colors.grey[600])),
                ],
              ),
              SizedBox(height: h*0.07,),

              //ANSWER NUMBER 0
              InkWell(
                onTap: (){

                 setState(() {
                    if(prov.recordedAnswerMed[i]==99){
                      prov.recordedAnswerMed[i]=0;
                      print(prov.recordedAnswerMed);
                      if(prov.soalanMedium[i]['answer']==prov.recordedAnswerMed[i]){
                        ++correctans;

                      }
                      ++totalAnswerd;
                    }
                  });
                },
                child: Stack(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(500),
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 100),
                        height: h*0.06,
                        width: w*0.8,
                        
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: h*0.1,
                        width: w*.8,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color:prov.recordedAnswerMed[i]==0? prov.recordedAnswerMed[i]==prov.soalanMedium[i]['answer']?Colors.green:Colors.red:Colors.grey[300],width: 3),
                        ),
                        
                      ),
                    ),
                    Container(
                      width: w*0.8,
                      height: h*0.1,
                      child: Center(
                        child: Stack(
                            children: <Widget>[
                              Text(prov.soalanMedium[i]['option'][0],style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color:Colors.red)),
                            ],
                          ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: h*0.02,),

              //ANSWER NUMBER 1
              InkWell(
                onTap: (){
                  setState(() {
                    if(prov.recordedAnswerMed[i]==99){
                      prov.recordedAnswerMed[i]=1;
                      print(prov.recordedAnswerMed);
                      if(prov.soalanMedium[i]['answer']==prov.recordedAnswerMed[i]){
                        ++correctans;

                      }
                      ++totalAnswerd;
                    }
                  });
                },
                child: Stack(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(500),
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 100),
                        height: h*0.06,
                        width: w*0.8,
                        
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: h*0.1,
                        width: w*.8,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color:prov.recordedAnswerMed[i]==1? prov.recordedAnswerMed[i]==prov.soalanMedium[i]['answer']?Colors.green:Colors.red:Colors.grey[300],width: 3),
                        ),
                        
                      ),
                    ),
                    Container(
                      width: w*0.8,
                      height: h*0.1,
                      child: Center(
                        child: Stack(
                            children: <Widget>[
                              Text(prov.soalanMedium[i]['option'][1],style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color:Colors.red)),
                            ],
                          ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: h*0.02,),

              //ANSWER NUMBER 2
              InkWell(
                onTap: (){
                  setState(() {
                    if(prov.recordedAnswerMed[i]==99){
                      prov.recordedAnswerMed[i]=2;
                      print(prov.recordedAnswerMed);
                      if(prov.soalanMedium[i]['answer']==prov.recordedAnswerMed[i]){
                        ++correctans;

                      }
                      ++totalAnswerd;
                    }
                  });
                },
                child: Stack(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(500),
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 100),
                        height: h*0.06,
                        width: w*0.8,
                        
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: h*0.1,
                        width: w*.8,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color:prov.recordedAnswerMed[i]==2? prov.recordedAnswerMed[i]==prov.soalanMedium[i]['answer']?Colors.green:Colors.red:Colors.grey[300],width: 3),
                        ),
                        
                      ),
                    ),
                    Container(
                      width: w*0.8,
                      height: h*0.1,
                      child: Center(
                        child:  Text(prov.soalanMedium[i]['option'][2],style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color:Colors.red)),
                           
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: h*0.04,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  i==0?Container():ClipRRect(
                    borderRadius: BorderRadius.circular(500),
                    child: InkWell(
                      onTap: (){
                        controller.previousPage(duration: Duration(milliseconds:200 ), curve: Curves.bounceIn);
                      },
                      child: Container(
                        width: w*0.3,
                        height: h*0.05,
                        color: Colors.lightBlue,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text('Kembali',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color:Colors.white)),
                              ],
                            ),
                            
                          ],
                        ),
                      ),
                    ),
                  ),
                  i==0||i+1==prov.soalanMedium.length?Container():SizedBox(width: w*0.2,),
                  
                  i+1==prov.soalanMedium.length?
                  totalAnswerd==prov.soalanMedium.length? Padding(
                    padding:  EdgeInsets.fromLTRB(w*0.1, 0, 0, 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(500),
                      child: InkWell(
                        onTap: (){
                          prov.scoreForMedium=((correctans/prov.soalanMedium.length)*100).round();
                          prov.iAmFrom='med';
                          
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Scorepage()));
                        },
                        child: Container(
                          width: w*0.3,
                          height: h*0.05,
                          color: Colors.lightGreenAccent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Text('Selesai ',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color:Colors.black)),
                                ],
                              ),
                              
                            ],
                          ),
                        ),
                      ),
                    ),
                  ):Container(): 
                  ClipRRect(
                    borderRadius: BorderRadius.circular(500),
                    child: InkWell(
                      onTap: (){
                        controller.nextPage(duration: Duration(milliseconds:200 ), curve: Curves.bounceIn);
                      },
                      child: Container(
                        width: w*0.3,
                        height: h*0.05,
                        color: Colors.lightBlue,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text('Seterusnya ',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color:Colors.white)),
                              ],
                            ),
                            
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),


              
            ],
          )
        )
      );
    }

    return listwidget;
  }
}