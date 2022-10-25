import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final swipedViewModel = ChangeNotifierProvider<SwipedViewModel>((ref) {
  return SwipedViewModel(
    ref.read,
  );
});

enum CardStatus { next, back }

class SwipedViewModel extends ChangeNotifier {
  final Reader reader;
  SwipedViewModel(this.reader) {
    resetUsers();
  }
  List<String> _urlImages = [];
  bool _isDragging = false;
  double _angle = 0;
  Offset _position = Offset.zero;
  Size screenSize = Size.zero;
  String text = "";

  List<String> get urlImages => _urlImages;
  bool get isDragging => _isDragging;
  Offset get position => _position;
  double get angle => _angle;

  void setScreenSize(Size screenSize) => screenSize = screenSize;

  void startPosition(DragStartDetails details) {
    _isDragging = true;
    notifyListeners();
  }

  void updatePositon(DragUpdateDetails details) {
    _position += details.delta;

    final x = _position.dx;
    _angle = 45 * x / screenSize.width;
    notifyListeners();
  }

  void endPosition() {
    _isDragging = false;
    notifyListeners();
    final starus = getStatus();

    switch (starus) {
      case CardStatus.back:
        back();
        break;
      case CardStatus.next:
        next();
        break;
      default:
        resetPositon();
    }
  }

  void resetPositon() {
    _isDragging = false;
    _position = Offset.zero;
    _angle = 0;

    notifyListeners();
  }

  CardStatus? getStatus() {
    final x = _position.dx;

    const delta = 100;

    if (x >= delta) {
      return CardStatus.back;
    } else if (x <= delta) {
      return CardStatus.next;
    }
  }

  void back() {
    _angle = 20;
    _position += Offset(screenSize.width / 2, 0);
    text = "back";
    notifyListeners();
  }

  void next() {
    _angle = -20;
    _position -= Offset(screenSize.width / 2, 0);
    text = "next";
    notifyListeners();
  }

  void nextPhoto() {
    _angle = 20;
    _position += Offset(2 * screenSize.width, 0);
    _nextCard();
    notifyListeners();
  }

  Future _nextCard() async {
    if (_urlImages.isEmpty) return;
    await Future.delayed(const Duration(milliseconds: 200));
    _urlImages.removeLast();
    notifyListeners();
  }

  void resetUsers() {
    _urlImages = <String>[
      "https://crea.ismcdn.jp/mwimgs/6/a/-/img_6a71bad1d5959be485219fbda79c45bd213586.jpg",
      "https://www.crank-in.net/img/db/1352781_1200.jpg",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5QODGCU3X-dBwOkTlwPvP7fYFx6b0zY9rog&usqp=CAU"
    ].reversed.toList();
    notifyListeners();
  }
}
