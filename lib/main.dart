import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

enum Genders { Male, Female }

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BMIPage(),
    );
  }
}

class BMIPage extends StatefulWidget {
  @override
  _BMIPageState createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  Genders selectedGender = Genders.Male;
  bool isDark = false;
  int sliderValue = 100;
  int weight = 35;
  int age = 15;
  double bmiResult = 0;

  double claculateBMI() {
    bmiResult = (weight / pow(sliderValue / 100, 2)).toDouble();
    return bmiResult;
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text(
        "OK",
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      contentPadding: EdgeInsets.only(top: 10.0),
      backgroundColor: (selectedGender == Genders.Male)
          ? Colors.indigoAccent
          : Colors.redAccent,
      title: Center(
        child: Text(
          "You BMI result",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "BMI  = ${claculateBMI().toStringAsFixed(2)}",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Gender  = ${selectedGender.name}",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Age  = ${age} Years",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Height  = ${sliderValue} Cm",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Weight  = ${weight} Kg",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (isDark) ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: (selectedGender == Genders.Female)
            ? Colors.redAccent
            : Colors.indigo[900],
        title: Text("BMI APP"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                // isDark == false ? isDark = true : isDark = false;
                isDark = !isDark;
                print("Is Theme Dark : ${isDark}");
              });
            },
            icon: (isDark)
                ? Icon(Icons.nightlight_round)
                : Icon(Icons.wb_sunny_outlined),
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(left: 5, right: 5, top: 3, bottom: 3),
        color: isDark ? Colors.black : Colors.white,
        child: Column(
          children: [
            // Gender Row
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Genders.Male;
                          print("Your Gendar is ${selectedGender.name} ");
                        });
                      },
                      child: Container(
                        margin: (selectedGender == Genders.Male)
                            ? EdgeInsets.all(15)
                            : EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: selectedGender == Genders.Male
                                ? Colors.indigo[900]
                                : Colors.blueAccent),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              FontAwesomeIcons.mars,
                              color: Colors.white,
                              size: 75,
                            ),
                            Text(
                              "Male",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Genders.Female;
                          print("Your Gendar is ${selectedGender.name} ");
                        });
                      },
                      child: Container(
                        margin: (selectedGender == Genders.Female)
                            ? EdgeInsets.all(15)
                            : EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: selectedGender == Genders.Female
                                ? Colors.redAccent
                                : Colors.blueAccent),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Icon(
                              FontAwesomeIcons.venus,
                              color: Colors.white,
                              size: 75,
                            ),
                            Text(
                              "Female",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            // Height Row
            Expanded(
              child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueAccent),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "HEIGHT",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.ideographic,
                      children: [
                        Text(
                          sliderValue.toString(),
                          style: TextStyle(
                              fontSize: 50,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5),
                        ),
                        Text(
                          "CM",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5),
                        ),
                      ],
                    ),
                    Slider(
                      value: sliderValue.toDouble(),
                      min: 100,
                      max: 220,
                      onChanged: (value) {
                        setState(() {
                          sliderValue = value.toInt();
                        });
                      },
                      activeColor: (selectedGender == Genders.Male)
                          ? Colors.indigo[900]
                          : Colors.red,
                      inactiveColor: Colors.white24,
                    )
                  ],
                ),
              ),
            ),
            //Weight and Age
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blueAccent),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "WEIGHT",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                weight.toString(),
                                style: TextStyle(
                                    fontSize: 50,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5),
                              ),
                              Text(
                                "Kg",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    (weight < 150) ? weight++ : weight;
                                    print("Your weight is: $weight");
                                  });
                                },
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundColor:
                                      (selectedGender == Genders.Male)
                                          ? Colors.indigo[900]
                                          : Colors.redAccent,
                                  child: Icon(
                                    FontAwesomeIcons.plus,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    (weight > 35) ? weight-- : weight;
                                    print("Your weight is: $weight");
                                  });
                                },
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundColor:
                                      (selectedGender == Genders.Male)
                                          ? Colors.indigo[900]
                                          : Colors.redAccent,
                                  child: Icon(
                                    FontAwesomeIcons.minus,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blueAccent),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "AGE",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5),
                          ),
                          Text(
                            age.toString(),
                            style: TextStyle(
                                fontSize: 50,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    (age < 100) ? age++ : age;
                                    print("Your Age is: $age");
                                  });
                                },
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundColor:
                                      (selectedGender == Genders.Male)
                                          ? Colors.indigo[900]
                                          : Colors.redAccent,
                                  child: Icon(
                                    FontAwesomeIcons.plus,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    (age > 15) ? age-- : age;
                                    print("Your age is: $age");
                                  });
                                },
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundColor:
                                      (selectedGender == Genders.Male)
                                          ? Colors.indigo[900]
                                          : Colors.redAccent,
                                  child: Icon(
                                    FontAwesomeIcons.minus,
                                    color: Colors.white,
                                  ),
                                ),
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
            // Calculate Button Container
            InkWell(
              onTap: () => showAlertDialog(context),
              child: Container(
                decoration: BoxDecoration(
                    color: (selectedGender == Genders.Female)
                        ? Colors.redAccent
                        : Colors.indigo[900],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                margin: EdgeInsets.all(10),
                height: 50,
                width: double.infinity,
                child: Center(
                  child: Text(
                    "Calculate",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
