import 'package:loading_animations/loading_animations.dart';
import 'package:flutter/material.dart';

LoadingBouncingGrid customLoadingBouncingGrid(Color circleColor) {
  return LoadingBouncingGrid.circle(
    borderColor: circleColor,
              size: 50.0,
              backgroundColor: Colors.transparent,
              duration: Duration(milliseconds: 5000),
  );
}