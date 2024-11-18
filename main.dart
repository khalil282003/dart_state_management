import 'dart:async';

class Counter {
  int _count = 0;
  final _controller = StreamController<int>();

  Stream<int> get stream => _controller.stream;

  void increment() {
    _count++;
    _controller.sink.add(_count);
  }

  void dispose() {
    _controller.close();
  }
}

void main() {
  final counter = Counter();

  counter.stream.listen((count) {
    print('Counter: $count');
  });

  counter.increment();
  counter.increment();
  counter.increment();

  counter.dispose();
  //counter.increment();
}
