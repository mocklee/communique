import 'package:flutter/material.dart';

class HeroText extends StatefulWidget {
  @override
  _HeroTextState createState() => _HeroTextState();
}

class _HeroTextState extends State<HeroText> {
  double opacity = 1;
  int opacityStep = 1;

  // initialize on first step
  String stepTitle = 'Step 1:\n';
  String stepDescription =
      'Let the recepient know who you are! Fill in your details below.';
  List step1 = [
    'Step 1:\n',
    'Let the recepient know who you are! Fill in your details below.'
  ];
  List step2 = [
    'Step 2:\n',
    'Find your cause by searching through submitted topics, or add a new one!'
  ];
  List step3 = [
    'Step 3:\n',
    'Tap on a card to open the email. Add your voice by hitting the “SEND” button.'
  ];

  @override
  void initState() {
    super.initState();
    changeOpacity();
  }

  void changeOpacity() {
    Future.delayed(Duration(seconds: 8), () {
      setState(() {
        switch (opacityStep) {
          case 1:
            {
              opacity = 0;
              Future.delayed(Duration(milliseconds: 1500), () {
                setState(() {
                  opacity = 1;
                  opacityStep = 2;
                  stepTitle = step2[0];
                  stepDescription = step2[1];
                });
              });
              continue recursion;
            }
          case 2:
            {
              opacity = 0;
              Future.delayed(Duration(milliseconds: 1200), () {
                setState(() {
                  opacity = 1;
                  opacityStep = 3;
                  stepTitle = step3[0];
                  stepDescription = step3[1];
                });
              });
              continue recursion;
            }
          case 3:
            {
              opacity = 0;
              Future.delayed(Duration(milliseconds: 1200), () {
                setState(() {
                  opacity = 1;
                  opacityStep = 1;
                  stepTitle = step1[0];
                  stepDescription = step1[1];
                });
              });
              continue recursion;
            }
          recursion:
          case 0:
            changeOpacity();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      AnimatedOpacity(
        opacity: opacity,
        duration: Duration(milliseconds: 1500),
        curve: Curves.easeOutCirc,
        child: RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                      text: stepTitle,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          letterSpacing: 0.5)),
                  TextSpan(
                      text: stepDescription,
                      style: TextStyle(
                          fontSize: 11,
                          fontStyle: FontStyle.italic,
                          letterSpacing: 0.4))
                ])),
      ),
    ]);
  }
}
