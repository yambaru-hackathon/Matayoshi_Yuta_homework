import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'timer',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'timer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _second = 0;
  Timer? _timer;
  bool _isRanning = false;

  @override
  void initState() {
    
    super.initState();

    
  }

  @override
  Widget build(BuildContext context) {

    //int second = _millisecond % 10;

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar.
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${(_second ~/ 6000).toString().padLeft(2, '0')}:${(_second ~/ 100 % 60).toString().padLeft(2, '0')}.${(_second % 100).toString().padLeft(2, '0')}',
              style: const TextStyle(
                fontSize: 80,
              ),
            ),

            ElevatedButton(
              onPressed: (){
                toggletimer();
              },
               child: Text(
                _isRanning ? 'ストップ' : 'スタート',
                style: TextStyle(
                  color: _isRanning ? Colors.red : Colors.green,
                  fontWeight: FontWeight.bold,
                ),
                ),
            ),
            ElevatedButton(
              onPressed: (){
                resettimer();
              },
               child: const Text(
                'リセット',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
                ),
            )
          ],
        ),
      ),
    );
  }

  void toggletimer(){
    if (_isRanning){
      _timer?.cancel();
    } else {
      _timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      setState(() {
        //millisecond * 10
        _second++;
      });
     });
    }

    setState(() {
      _isRanning = !_isRanning;
    });
    
  }

  void resettimer(){
    _timer?.cancel();
    setState(() {
      _second = 0;
      _isRanning = false;
    });
  }

}
