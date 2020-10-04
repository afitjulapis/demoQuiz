import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:somedemo/provider.dart';
import 'package:somedemo/scorepage.dart';

class Sukar extends StatefulWidget {
  @override
  _SukarState createState() => _SukarState();
}

class _SukarState extends State<Sukar> {
  
  int correctans;
  int totalAnswerd;
  int selectedIndex;
  int servicesIndex;
  int answeredquestions;
  List<String> reportAnswer=List<String>();
  PageController controller;
  FocusNode focus;
  
  

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
    var progBar=(w*0.8)*(correctans/prov.soalanSukar.length);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor:Color(0xFFf5f5f6),
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Opacity(
                    opacity: 0.5,
                    child: Image.asset('assets/bgMenu2.png')),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Container(
                height: h,
                child: Column(
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
                    SizedBox(height: h*0.08,),
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
                                      Text(((correctans/prov.soalanSukar.length)*100).round().toString()+'%',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color:progBar>w*0.4? Colors.white:Colors.grey[800])),
                                      
                                    ],
                                  ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: h*0.08,),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(500),
                      child: Container(
                        width: w*0.45,
                        height: h*0.08,
                        color: Colors.red,
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
                                Text('daripada '+prov.soalanSukar.length.toString(),style:TextStyle(fontWeight: FontWeight.normal,fontSize: 16,color:Colors.white)),
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
              ),
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
    

    for(int  i = 0; i < prov.soalanSukar.length; i++){
      if(prov.recordedAnswerSusah.length<i+1){
          prov.recordedAnswerSusah.add('');
          reportAnswer.add('x');
          print(prov.recordedAnswerSusah);
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
                  Text(prov.soalanSukar[i]['question'],style:TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color:Colors.grey[600])),
                ],
              ),
              SizedBox(height: h*0.05,),
              Text(reportAnswer[i]=='x'? '':reportAnswer[i]=='f'? 'Salah':"BETUL !",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color:reportAnswer[i]=='x'? Colors.purple:reportAnswer[i]=='f'? Colors.red:Colors.green)),
              SizedBox(height: h*0.02,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: w*.8,
                    decoration: BoxDecoration(
                      border: Border.all(color:reportAnswer[i]=='x'? Colors.purple:reportAnswer[i]=='f'? Colors.red:Colors.green,width: 3),borderRadius: BorderRadius.circular(500)
                    ),
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(20,0,20,0),
                        child: TextFormField(
                          focusNode: focus,
                        decoration: InputDecoration(hintText: 'Isi Jawapan Disini',hintStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color:Colors.grey[500])),
                        onChanged: (String text){
                          prov.recordedAnswerSusah[i]=text;
                          setState(() {
                            if(text==''){
                              reportAnswer[i]='x';
                            }else if(prov.soalanSukar[i]['answer']==text){
                              reportAnswer[i]='t';
                            }else{
                              reportAnswer[i]='f';

                            }
                          });
                          print(prov.recordedAnswerSusah);
                        },
                        textAlign: TextAlign.center,
                        ),
                      ),
                  ),
                ],
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
                  i==0||i+1==prov.soalanSukar.length?Container():SizedBox(width: w*0.2,),
                  
                  i+1==prov.soalanSukar.length? Padding(
                    padding:  EdgeInsets.fromLTRB(w*0.1, 0, 0, 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(500),
                      child: InkWell(
                        onTap: (){
                          prov.scoreForSusah=((correctans/prov.soalanSukar.length)*100).round();
                          prov.iAmFrom='hard';
                          if(prov.soalanSukar[i]['answer']==prov.recordedAnswerSusah[i]){
                            print('a');
                            ++correctans;
                            ++totalAnswerd;
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Scorepage()));
                          }else if(prov.recordedAnswerSusah[i].length>0){
                            ++totalAnswerd;
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Scorepage()));

                        }
                          
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
                  ): 
                  ClipRRect(
                    borderRadius: BorderRadius.circular(500),
                    child: InkWell(
                      onTap: (){
                        if(prov.soalanSukar[i]['answer']==prov.recordedAnswerSusah[i]){
                          ++correctans;
                          ++totalAnswerd;
                        }else if(prov.recordedAnswerSusah[i].length>0){
                          ++totalAnswerd;
                        }
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