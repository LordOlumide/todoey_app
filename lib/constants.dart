import 'package:flutter/material.dart';

const kBottomContainerDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(20.0),
      topLeft: Radius.circular(20.0),
    ),
);

const kSmallTitleTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 18,
);

const kBigTitleTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 40,
  fontWeight: FontWeight.w700,
);

const kAddTaskScreenDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(20),
    topRight: Radius.circular(20),
  ),
);