import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/app.dart';
import 'core/services/tflite_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Hive
  await Hive.initFlutter();

  // TFLite
  final tfliteService =
      TFLiteService();

  await tfliteService.loadModel();

  runApp(
    const ProviderScope(
      child: AgroLensApp(),
    ),
  );
}