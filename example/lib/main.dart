import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_stepindicator/flutter_stepindicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int page = 1;
  int counter = 4;
  List list = [0,1,2,3,4,5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("PuzzleTak - Flutter_stepIndicator"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _example1(),
            ],
          ),
        ));
  }

  Widget _example1() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
            color:
                Theme.of(context).colorScheme.inversePrimary.withOpacity(0.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                alignment: Alignment.topLeft,
                child: Text(
                  "Automatically scroller",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inverseSurface,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                )),
            SizedBox(
              width: double.maxFinite,
              height: 30,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: FlutterStepIndicator(
                  height: 28,
                  paddingLine: const EdgeInsets.symmetric(horizontal: 0),
                  positiveColor: const Color(0xFF00B551),
                  progressColor: const Color(0xFFEA9C00),
                  negativeColor: const Color(0xFFD5D5D5),
                  padding: const EdgeInsets.all(4),
                  list: list,division: counter,
                  onChange: (i) {},
                  page: page,
                  onClickItem: (p0) {
                    setState(() {
                      page = p0;
                    });
                  },
                ),
              ),
            ),
            widgetOption(title: "update step ($page)", callAdd: () {
              if (page < list.length) {
                setState(() {
                  page++;
                });
              }
            }, callRemove: () {
              if (page > 0) {
                setState(() {
                  page--;
                });
              }
            }),
            widgetOption(title: "add item in list (${list.length})", callAdd: () {
              setState(() {
                list.add(Random().nextInt(100));
              });
            }, callRemove: () {
              setState(() {
                list.removeAt(list.length - 1);
              });
            }),
            widgetOption(title: "counter show (${counter - 1})", callAdd: () {
              setState(() {
                counter++;
              });
            }, callRemove: () {
              setState(() {
                counter--;
              });
            })

          ],
        ),
      ),
    );
  }

  Widget widgetOption({required String title,required VoidCallback callAdd,required VoidCallback callRemove}){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
        decoration: BoxDecoration(
          color: Colors.blueGrey.withOpacity(0.03),
          borderRadius: BorderRadius.circular(15)
        ),
        child: Column(
          children: [
            Container(width: double.maxFinite,height: 30,
              alignment: Alignment.center,
              child: Text(title,style: const TextStyle(fontWeight: FontWeight.bold),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: callAdd,
                    child: const Icon(Icons.add)),
                ElevatedButton(
                    onPressed: callRemove,
                    child: const Icon(Icons.remove)),
              ],
            )
          ],
        ),
      ),
    );
  }

}
