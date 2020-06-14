import 'package:flutter/material.dart';

class HeroText extends StatefulWidget {
  @override
  _HeroTextState createState() => _HeroTextState();
}

class _HeroTextState extends State<HeroText> {
  double opacity1 = 1;
  double opacity2 = 0;
  double opacity3 = 0;
  int opacityStep = 1;
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
              opacity1 = 0;
              Future.delayed(Duration(milliseconds: 1200), () {
                setState(() {
                  opacity2 = 1;
                  opacityStep = 2;
                });
              });
              continue recursion;
            }
          case 2:
            {
              opacity2 = 0;
              Future.delayed(Duration(milliseconds: 1200), () {
                setState(() {
                  opacity3 = 1;
                  opacityStep = 3;
                });
              });
              continue recursion;
            }
          case 3:
            {
              opacity3 = 0;
              Future.delayed(Duration(milliseconds: 1200), () {
                setState(() {
                  opacity1 = 1;
                  opacityStep = 1;
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
        opacity: opacity1,
        duration: Duration(milliseconds: 1500),
        curve: Curves.easeOutCirc,
        child: RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                      text: 'Step 1:\n',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          letterSpacing: 0.5)),
                  TextSpan(
                      text:
                          'Let the recepient know who you are! Fill in your details below.',
                      style: TextStyle(
                          fontSize: 11,
                          fontStyle: FontStyle.italic,
                          letterSpacing: 0.4))
                ])),
      ),
      AnimatedOpacity(
        opacity: opacity2,
        duration: Duration(milliseconds: 1500),
        curve: Curves.easeOutCirc,
        child: RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                      text: 'Step 2:\n',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          letterSpacing: 0.5)),
                  TextSpan(
                      text:
                          'Find your cause by searching through submitted topics, or add a new one!',
                      style: TextStyle(
                          fontSize: 11,
                          fontStyle: FontStyle.italic,
                          letterSpacing: 0.4))
                ])),
      ),
      AnimatedOpacity(
          opacity: opacity3,
          duration: Duration(milliseconds: 1500),
          curve: Curves.easeOutCirc,
          child: RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Step 3:\n',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            letterSpacing: 0.5)),
                    TextSpan(
                        text:
                            'Tap on a card to open the email. Add your voice by hitting the “SEND” button.',
                        style: TextStyle(
                            fontSize: 11,
                            fontStyle: FontStyle.italic,
                            letterSpacing: 0.4))
                  ]))),
    ]);
  }
}
