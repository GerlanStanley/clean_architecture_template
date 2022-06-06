import 'package:flutter/material.dart';

import 'core/inject/inject.dart';

main() {
  Inject.initialize();

  runApp(const MaterialApp());
}