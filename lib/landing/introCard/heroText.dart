import 'package:flutter/material.dart';

class HeroText extends StatefulWidget {
  HeroText(
      {Key key,
      this.step1 = const [
        'Step 1:\n',
        'Let the recepient know who you are! Fill in your details below.'
      ],
      this.step2 = const [
        'Step 2:\n',
        'Find your cause by searching through submitted topics, or add a new one!'
      ],
      this.step3 = const [
        'Step 3:\n',
        'Tap on a card to open the email. Add your voice by hitting the “SEND” button.'
      ]})
      : super(key: key);

  final List step1;
  final List step2;
  final List step3;

  @override
  _HeroTextState createState() => _HeroTextState();
}

class _HeroTextState extends State<HeroText> {
  double opacity = 1;
  int opacityStep = 1;

  String stepTitle;
  String stepDescription;

  @override
  void initState() {
    super.initState();
    // initialize on first step
    stepTitle = widget.step1[0];
    stepDescription = widget.step1[1];
    _changeOpacity();
  }

  void _changeOpacity() {
    Future.delayed(Duration(seconds: 6), () {
      setState(() {
        switch (opacityStep) {
          case 1:
            {
              opacity = 0;
              Future.delayed(Duration(milliseconds: 1200), () {
                setState(() {
                  opacity = 1;
                  opacityStep = 2;
                  stepTitle = widget.step2[0];
                  stepDescription = widget.step2[1];
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
                  stepTitle = widget.step3[0];
                  stepDescription = widget.step3[1];
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
                  stepTitle = widget.step1[0];
                  stepDescription = widget.step1[1];
                });
              });
              continue recursion;
            }
          recursion:
          case 0:
            _changeOpacity();
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
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          letterSpacing: 0.5,
                        )),
                    TextSpan(
                        text: stepDescription,
                        style: TextStyle(
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                          letterSpacing: 0.4,
                        ))
                  ])))
    ]);
  }
}
