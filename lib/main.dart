import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:page_transition/page_transition.dart';
import 'package:somedemo/demoMenu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>with TickerProviderStateMixin {
  AnimationController _controller;
  Tween<double> _tween = Tween(begin: 0.97, end: 1);

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(duration: const Duration(milliseconds: 3000), vsync: this);
    _controller.repeat(reverse: true);
    // _controller.
  }

  @override
  Widget build(BuildContext context) {
    var h=MediaQuery.of(context).size.height;
    var w=MediaQuery.of(context).size.width;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor:Color(0xFFf5f5f6),statusBarIconBrightness:Brightness.dark));
    final Shader linearGradient = LinearGradient(colors: <Color>[Colors.orangeAccent[700], Colors.purpleAccent[700]]).createShader(Rect.fromLTWH(0.0, 10.0, h*0.8, h*8));
    final Shader linearGradient2 = LinearGradient(colors: <Color>[Colors.orangeAccent[700], Colors.purpleAccent[700]]).createShader(Rect.fromLTWH(0.0, 10.0, h*0.6, h*8));
    final Shader linearGradient3 = LinearGradient(colors: <Color>[Colors.orangeAccent[700], Colors.purpleAccent[700]]).createShader(Rect.fromLTWH(0.0, 50.0, h*0.07, h*1));

    // var x=h*0.5;
    var parser = EmojiParser();

    return Scaffold(
      backgroundColor: Color(0xFFf5f5f6),
      body: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // SizedBox(height:h*0.02 ,),
              Image.asset('assets/bgLoad.png'),
            ],
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ScaleTransition(
                  scale: _tween.animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut)),
                  child: Container(
                    height: h*0.6 ,
                    width: w,
                    child: Stack(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(width: w*0.2,),
                            Text('Teka',style: TextStyle(fontFamily: 'bree',fontSize: 60,fontWeight: FontWeight.w600,foreground: Paint()..shader = linearGradient),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(width: w*0.3,),
                            Column(
                              children: <Widget>[
                                SizedBox(height: h*0.06,),
                                Text('Apa',style: TextStyle(fontFamily: 'bree',fontSize: 60,fontWeight: FontWeight.w600,foreground: Paint()..shader = linearGradient2),),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(width: w*0.36,),
                            Column(
                              children: <Widget>[
                                SizedBox(height: h*0.04,),
                                Text(parser.emojify('🕵️'),style: TextStyle(fontSize: 60, fontWeight: FontWeight.w600),),
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
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 Text("Cara bermain?",style: TextStyle(fontSize: 18,fontFamily: 'bree'),)
               ],
              ),
              SizedBox(height: h*0.05,),
              Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 ClipRRect(
                   borderRadius: BorderRadius.circular(10),
                   child: InkWell(
                     onTap: (){
                       Navigator.push(context, PageTransition(type: PageTransitionType.fade,duration: Duration(milliseconds: 700), child: DemoMenu()));
                     },
                     child: Container(
                       height: h*0.08,
                       width: w*0.75,
                       decoration: BoxDecoration(
                         gradient: LinearGradient(colors: [Colors.orange[800],Colors.orangeAccent[700],Colors.amber[700]]),
                       ),
                       child:Center(child: Text("Mula Bermain",style: TextStyle(fontSize: 18,fontFamily: 'bree',color: Colors.white),)),
                     ),
                   ),
                 ),
               ],
              ),
             SizedBox(height: h*0.05,),
            ],
          )
        ],
      ),
    );
  }
}
