import 'dart:async';

class BlocTest {
  final streamController = StreamController<String>();

  Sink<String> get dataSink => streamController.sink;
  Stream<String> get dataStream => streamController.stream;
}