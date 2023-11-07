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
  List list = [0,1,2,3,4,5,6];
  int page1 = 1;
  List list1 = [0,1,2,3,4,5,6,0,1,2,3,4,5,6];

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
            const SizedBox(width: double.maxFinite,height: 30,),
            _example2(),
          ],
        ),
      )
    );
  }

  Widget _example1(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 5),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.0)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                alignment: Alignment.topLeft,
                child: Text("Example one NoScroll",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inverseSurface,
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 15,left: 20,right: 20,bottom: 40),
              child: FlutterStepIndicator(

                height: 20,
                disableAutoScroll: false,
                list: list,
                onChange: (i){},
                page: page,),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: (){
                  if(page < list.length){
                    setState(() {
                      page++;
                    });
                  }
                }, child: const Icon(Icons.add)),
                ElevatedButton(onPressed: (){
                  if(page > 0){
                    setState(() {
                      page--;
                    });
                  }
                }, child: const Icon(Icons.remove)),
              ],
            )
          ],
        ),
      ),
    );
  }
  Widget _example2(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 5),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.0)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                alignment: Alignment.topLeft,
                child: Text("Example two AutoScroller",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inverseSurface,
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 15,left: 20,right: 20,bottom: 40),
              child: FlutterStepIndicator(
                positiveColor: const Color(0xFF00B551),
                progressColor: const Color(0xFFEA9C00),
                negativeColor: const Color(0xFFD5D5D5),
                division: 4,
                durationCheckBulb: const Duration(milliseconds: 300),
                durationScroller: const Duration(milliseconds: 600),
                height: 20,
                // positiveCheck: Icon(Icons.access_time,size: 15,color: Colors.white,),
                disableAutoScroll: true,
                list: list1,
                onChange: (i){},
                page: page1,),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: (){
                  if(page1 < list1.length){
                    setState(() {
                      page1++;
                    });
                  }
                }, child: const Icon(Icons.add)),
                ElevatedButton(onPressed: (){
                  if(page1 > 0){
                    setState(() {
                      page1--;
                    });
                  }
                }, child: const Icon(Icons.remove)),
              ],
            )
          ],
        ),
      ),
    );
  }


}
