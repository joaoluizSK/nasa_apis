import 'package:flutter/material.dart';
import 'package:nasa_apis/ui/dashboard.dart';

Future main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'APOD -  Astronomy Picture Of Day',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        backgroundColor: Colors.black,
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: const TextSpan(
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            children: <TextSpan>[TextSpan(text: '{ NASA APIs }')],
          ),
        ),
      ),
      body: const Center(
        child: DashboardWidget(),
      ),
    );
  }
}
