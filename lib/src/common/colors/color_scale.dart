import 'package:flutter/material.dart';

class DSColorScale {
  final Color base;
  final Color dark;
  final Color darker;
  final Color light;
  final Color lighter;

  const DSColorScale({
    required this.base,
    required this.dark,
    required this.darker,
    required this.light,
    required this.lighter,
  });
}

class DSNeutralScale {
  final Color s24;
  final Color s46;
  final Color s72;
  final Color s88;
  final Color s96;
  final Color s100;

  const DSNeutralScale({
    required this.s24,
    required this.s46,
    required this.s72,
    required this.s88,
    required this.s96,
    required this.s100,
  });
}
