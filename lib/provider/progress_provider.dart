import 'package:flutter/material.dart';

class ProgressModelProvider extends ChangeNotifier {
  late AnimationController _animationController;
  late Animation<double> _animationValue;

  void setAnimationController({required TickerProvider vsync}) {
    _animationController = AnimationController(
      vsync: vsync,
      duration: const Duration(seconds: 5),
    );
    _animationValue =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController)
          ..addListener(() {
            notifyListeners();
          });

    _animationController.repeat();
    // _animationController.upperBound;
  }

  AnimationController get animationController => _animationController;
  double get animationValue => _animationValue.value;

  void disposeAnimationController() {
    _animationController.dispose();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
