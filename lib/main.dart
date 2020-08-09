import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:audioplayers/audio_cache.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'dart:ui';


void main() => runApp(
  GetMaterialApp(
    initialRoute: '/home',
    defaultTransition: Transition.native,
    getPages: [GetPage(name: '/home', page: () => FirstPage()),],
  ),);

class Controller extends GetxController {
  int team1 = 0;
  int team2 = 0;
  var firstlist = [];
  var secondlist = [];
  var thirdlist = [];
  String element = 'Click Next To Get A Word';
  String element2 = 'Click Next To Get A Word';
  String element3 = 'Click Next To Get A Word';

  final _formKey = GlobalKey<FormState>();

  getRandomElement<T>(List<T> firstlist) {
    final random = new Random();
    var i = random.nextInt(firstlist.length);
    return firstlist[i];
  }
  getRandomElement2<T>(List<T> secondlist) {
    final random = new Random();
    var i = random.nextInt(secondlist.length);
    return secondlist[i];
  }
  getRandomElement3<T>(List<T> thirdlist) {
    final random = new Random();
    var i = random.nextInt(thirdlist.length);
    return thirdlist[i];
  }


  @override
  void onInit() {
    super.onInit();
  }
}

class FirstPage extends StatelessWidget {
  final Controller c = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade200,
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      floatingActionButton: Container(
        width: 60,
        height: 60,
        child: FloatingActionButton(
          onPressed: (){
            Get.dialog(AlertDialog(
              insetPadding: EdgeInsets.all(50),
                contentPadding: EdgeInsets.all(0),
              titlePadding: EdgeInsets.only(bottom: 10, top: 5),
              backgroundColor: Colors.grey.shade300,
              title: Text('Instructions:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
              ),
              content: Image(
                image: AssetImage('images/howtoplay.png'),
              )
            )
            );
          },
          child: Icon(Icons.speaker_notes,
          size: 30,),
          backgroundColor: Colors.green,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent.shade700,
        centerTitle: true,
        title: Text('Word Association'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20,),
          Text('Add at least 8 words then pass it to your friend to do the same. '
              'When everyone is done adding words, click on "Finish" to start.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SafeArea(
            child: Form(
              key: c._formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    obscureText: true,
                    initialValue: null,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.add_box),
                      hintText: 'Add Word',
                      labelText: 'Word',
                    ),
                    onChanged: (text) {
                      // This optional block of code can be used to run
                      // code when the user saves the form.
                    },
                    validator: (text) {
                      if (text.isEmpty){return null;}
                      c.firstlist.add(text);
                      c.secondlist.add(text);
                      c.thirdlist.add(text);
                      return null;
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    initialValue: null,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.add_box),
                      hintText: 'Add Word',
                      labelText: 'Word',
                    ),
                    onChanged: (text) {
                      // This optional block of code can be used to run
                      // code when the user saves the form.
                    },
                    validator: (text) {
                      if (text.isEmpty){return null;}
                      c.firstlist.add(text);
                      c.secondlist.add(text);
                      c.thirdlist.add(text);
                      return null;
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    initialValue: null,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.add_box),
                      hintText: 'Add Word',
                      labelText: 'Word',
                    ),
                    onChanged: (text) {
                      // This optional block of code can be used to run
                      // code when the user saves the form.
                    },
                    validator: (text) {
                      if (text.isEmpty){return null;}
                      c.firstlist.add(text);
                      c.secondlist.add(text);
                      c.thirdlist.add(text);
                      return 'Your Words Have Been Added.';
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    initialValue: null,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.add_box),
                      hintText: 'Add Word',
                      labelText: 'Word',
                    ),
                    onChanged: (text) {
                      // This optional block of code can be used to run
                      // code when the user saves the form.
                    },
                    validator: (text) {
                      if (text.isEmpty){return 'Please add words';}
                      c.firstlist.add(text);
                      c.secondlist.add(text);
                      c.thirdlist.add(text);
                      return 'You can add more words by using the same TextFields';

                    },
                  ),
                  SizedBox(height: 20,),
                  CupertinoButton(
                    color: Colors.lightGreen,
                    child: Text('Add Words',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    onPressed: (){
                      if (c._formKey.currentState.validate()){
                      }
                    },
                  ),
                  SizedBox(height: 80,),
                  CupertinoButton(
                    color: Colors.blue,
                    child: Text('Finish', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    onPressed: () {if(c.firstlist.isNotEmpty){Get.off(Experiment());}

                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  double percentage; //value of the circular progress
  double newPercentage = 0.0;
  // AnimationController percentageAnimationController;

  Timer _timer;
  int _myTimerDuration = 30;
  int _myCurrentTime = 0;
  String timerText = 'Start';
  void resetTimer(){setState(() {
    _myCurrentTime = 0;
  });
  _myCurrentTime = 0;
  }
  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(
        oneSec,
            (Timer timer) => setState(() {
          if (_myCurrentTime >= _myTimerDuration) {
            final player = AudioCache();
            player.play('alarm1.wav');
            timer.cancel();
          } else {
            _myCurrentTime++;
          }
        }));
  }
  timerController(){
    if(_myCurrentTime == 0 ){startTimer();}
    else if(_myCurrentTime == 30){resetTimer();startTimer();}
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      percentage = 0.0; 
    });
  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            height: 110,
            width: 110,
            child: new CustomPaint(
              foregroundPainter: new MyPainter(
                  lineColor: Colors.greenAccent,
                  completeColor: Colors.redAccent,
                  completePercent: (_myTimerDuration/100)*_myCurrentTime*11,
                  width: 5.0),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: RaisedButton(
                    elevation: 2,
                    color: Colors.green,
                    splashColor: Colors.green,
                    shape: new CircleBorder(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("$_myCurrentTime",
                          style: TextStyle(color: Colors.white,fontSize: 40),),
                        Text(
                          timerText,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white,
                            fontSize: 18,),
                        ),
                      ],
                    ),
                    onPressed: () {
                      setState(() {
                        percentage += 15.0;
                        if (percentage > 100) {
                          percentage = 0.0;
                        }
                      });
                      timerController();
                      // percentageAnimationController.forward(from: 0.0);
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  Color lineColor;
  Color completeColor;
  double completePercent;
  double width;
  MyPainter(
      {this.lineColor, this.completeColor, this.completePercent, this.width});
  @override
  void paint(Canvas canvas, Size size) {
    Paint line = new Paint()
      ..color = lineColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    Paint complete = new Paint()
      ..color = completeColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    Offset center = new Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);

    //Start drawing in the canvas
    canvas.drawCircle(center, radius, line);

    double arcAngle = 2 * pi * (completePercent / 100);
    canvas.drawArc(new Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcAngle, false, complete);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class Experiment extends StatefulWidget {
  @override
  _Experiment createState() => _Experiment();
}

class _Experiment extends State<Experiment>{
  final Controller c = Get.put(Controller());
  String title = 'Round 1';
  String explain = 'Explain the word with as many words as you like without gestures';
  Future<void> _handleClickMe1() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Get Ready For Round 2!',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          content: Text('Round 2 is about to start!',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('Let\'s Go!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              onPressed: () {Navigator.of(context).pop();
              setState(() {
                c.element = 'Click Next To Get a Word';
                title = 'Round 2';
                explain = 'Explain the word using only one word (without gestures)';
              });
              },
            ),
          ],
        );
      },
    );
  }
  Future<void> _handleClickMe2() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Get Ready For Round 3!',
            style: TextStyle(fontSize: 18     ),
          ),
          content: Text('Round 3 is about to start!', style: TextStyle(fontSize: 18),),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('Let\'s Go!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  c.element = 'Click Next To Get a Word';
                  title = 'Round 3';
                  explain = 'Explain the word using only gestures';
                });
              },
            ),
          ],
        );
      },
    );
  }
  Future<void> _handleClickMe3() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('You Ran Out of Words',
            style: TextStyle(fontSize: 18     ),
          ),
          content: Text('Click on "Play Again" to Add more words.', style: TextStyle(fontSize: 18),),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('Play Again!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              onPressed: () {
                Get.to(FirstPage());
              },
            ),
          ],
        );
      },
    );
  }

  nextWord(){
    final player = AudioCache();
    player.play('paper1.wav');
    setState(() {
      if(c.firstlist.isNotEmpty){c.element = c.getRandomElement(c.firstlist);}
      if(c.firstlist.isEmpty && c.secondlist.isNotEmpty){c.element = c.getRandomElement2(c.secondlist);}
      if(c.firstlist.isEmpty && c.secondlist.isEmpty && c.thirdlist.isNotEmpty){c.element = c.getRandomElement3(c.thirdlist);}

    });
  }
  correct(){
    final player = AudioCache();
    player.play('correct1.wav');
    if(c.firstlist.length == 1){_handleClickMe1();}
    if(c.secondlist.length == 1){_handleClickMe2();}
    if(c.thirdlist.length == 1){_handleClickMe3();}
    if(c.thirdlist.isNotEmpty && c.secondlist.isEmpty && c.firstlist.isEmpty){
      c.thirdlist.remove(c.element);
    }
    if(c.firstlist.isEmpty && c.secondlist.isNotEmpty){
      c.secondlist.remove(c.element);
    }
    if(c.firstlist.isNotEmpty){
      c.firstlist.remove(c.element);
    }

    setState(() {
      if(c.firstlist.isNotEmpty){c.element = c.getRandomElement(c.firstlist);}
      if(c.firstlist.isEmpty && c.secondlist.isNotEmpty){c.element = c.getRandomElement2(c.secondlist);}
      if(c.firstlist.isEmpty && c.secondlist.isEmpty && c.thirdlist.isNotEmpty){c.element = c.getRandomElement3(c.thirdlist);}
      print (c.firstlist);
      print (c.secondlist);
      print (c.thirdlist);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade200,
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent.shade700,
        title: Center(child: Text(title)),
      ),
      body: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(explain,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      )
                  ),
                ),

              ),
              SizedBox(height: 10,),
              GetBuilder<Controller>(
                init: Controller(),
                builder: (c) => Home(),
              ),
              Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0,),
                    child: Column(
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.only(top: 55),
                            height: 150,
                            width: 380,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('images/crumpledpaper1.png'),
                                    fit: BoxFit.cover
                                )
                            ),
                            child: Text(c.element,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold),
                            )
                        ),
                        SizedBox(height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            CupertinoButton(color: Colors.redAccent.shade400,
                              child: Text('Next',
                                style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  color: Colors.white,),
                              ),
                              onPressed: () {
                                nextWord();
                              },
                            ),
                            CupertinoButton(
                              color: Colors.green,
                              child: Text('Correct!',
                                style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  color: Colors.white,),
                              ),
                              onPressed: () {
                                correct();
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 50,),
                        CupertinoButton(
                          color: Colors.blue,
                          child: Text('Play Again',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          onPressed: () {if(c.firstlist.isEmpty && c.secondlist.isEmpty && c.thirdlist.isEmpty){
                            Get.to(FirstPage());}

                          },
                        ),
                      ],
                    ),
                  )
              ),

            ],
          )

      ),
    );
  }
}








