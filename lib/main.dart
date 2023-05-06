import 'package:bloc_example/bloc/bloc_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final blocTest = BlocTest();

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: 300,
              color: Colors.indigo,
              child: Center(
                child: StreamBuilder<String>(
                  initialData: 'intial',
                  stream: blocTest.dataStream,
                  builder: (context, snapshot) {
                    return Text(
                      snapshot.data!,
                      style: TextStyle(fontSize: 34, color: Colors.green),
                    );
                  }
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                blocTest.dataSink.add('click button');
              },
              child: const Text('click me'),
            )
          ],
        ),
      ),
    );
  }
}
