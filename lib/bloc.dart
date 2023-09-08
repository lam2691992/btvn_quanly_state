import 'dart:async';

class UserInterAct {
  int _like = 0;
 final StreamController<int> _likeStreamController = StreamController();
  StreamSink<int> get likeSink => _likeStreamController.sink;
  Stream<int> get likeStream => _likeStreamController.stream;
  int _comment = 0;
  StreamController<int> commentStream = StreamController();


   final StreamController<int> _interActStreamController = StreamController();
  StreamSink<int> get interActSink => _interActStreamController.sink;
  Stream<int> get interActStream => _interActStreamController.stream;
  void tangsoLike() async {
    likeSink.add(++_like);
    interActSink.add(_like + _comment);
  }

  void tangsoCommet() {
    commentStream.sink.add(++_comment);
      interActSink.add(_like + _comment);
  }

  void dispose() {
    _likeStreamController.close();
    commentStream.close();
    _interActStreamController.close();
  }
}
