
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'test task ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
      ),
      home: const MyHomePage(title: 'test task use text'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.green,
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.red,
          child: Center(

            child: TextField(
              decoration: InputDecoration(
                labelText: 'enTER NAEME ',
                hintText: 'enter email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),

              ),
            ),
          ),
        ),
      ),
    );
  }
}
