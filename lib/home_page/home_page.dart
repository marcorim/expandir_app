import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

const Duration _kExpand = const Duration(milliseconds: 200);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required String title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: ListTile(
                title: const Text('Clique aqui para expandir'),
                trailing: AnimatedRotation(
                  duration: const Duration(milliseconds: 1),
                  turns: _isExpanded ? 0.5 : 0.0,
                  child: const Icon(
                    Icons.expand_more,
                  ),
                ),
              ),
            ),
            ClipRect(
              child: AnimatedAlign(
                heightFactor: _isExpanded ? 1.2 : 0.0,
                alignment: Alignment.topLeft,
                duration: const Duration(milliseconds: 1),
                child: const Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting \n"
                    "industry. Lorem Ipsum has been the industry's standard dummy \n"
                    'text ever since the 1500s, when an unknown printer took a galley',
                    textAlign: TextAlign.justify,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
