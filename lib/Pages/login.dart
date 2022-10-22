import 'package:flutter/material.dart';
import 'package:flutter_day_night_mode/Pages/sun.dart';
import 'package:flutter_day_night_mode/Widgets/tabs.dart';
import '../Components/text_fields.dart';
import 'land.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isFullSun = false;
  bool isDayMood = true;
  Duration duration = Duration(seconds: 1);

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        isFullSun = true;
      });
    });
  }

  void changeMood(int activeTabNum) {
    if (activeTabNum == 0) {
      setState(() {
        isDayMood = true;
      });
      Future.delayed(Duration(milliseconds: 100), () {
        setState(() {
          isFullSun = true;
        });
      });
    } else {
      setState(() {
        isFullSun = false;
      });
      Future.delayed(Duration(milliseconds: 100), () {
        setState(() {
          isDayMood = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Color> lightBgColors = [
      Color(0xFF8C2480),
      Color(0xFFCE587D),
      Color(0xFFFF9485),
      if (isFullSun) Color(0xFFFF9D80),
    ];
    var darkBgColors = [
      Color(0xFF0D1441),
      Color(0xFF283584),
      Color(0xFF376AB2),
    ];
    return Scaffold(
      body: SafeArea(
        child: AnimatedContainer(
          duration: duration,
          curve: Curves.easeInOut,
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: isDayMood ? lightBgColors : darkBgColors,
            ),
          ),
          child: Stack(
            children: [
              Sun(duration: duration, isFullSun: isFullSun),
              Land(
                duration: duration,
                isFullSun: true,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Tabs(
                      press: (value) {
                        changeMood(value);
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(children: [
                      Text(
                        isDayMood ? 'Good Morning' : 'Good Night',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ]),
                    SizedBox(
                      height: 10,
                    ),
                    Row(children: const [
                      Text(
                        'Welcome to the world of flutter',
                        style: TextStyle(color: Colors.white),
                      ),
                    ]),
                    SizedBox(
                      height: 30,
                    ),
                    RoundedTextFields(
                        hintText: 'Email',
                        initialValue: 'flutterboy17@gmail.com'),
                    SizedBox(
                      height: 15,
                    ),
                    RoundedTextFields(
                      hintText: 'Password',
                      initialValue: '1@3....X5!o',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


