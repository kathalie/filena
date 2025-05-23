import 'package:flutter/material.dart';

import 'core/di/di.dart';
import 'core/presentation/app.dart';

void main() async {
  //TODO Login to MinIO
  WidgetsFlutterBinding.ensureInitialized();

  await setupDI();

  runApp(
      const FilenaApp(),
  );
}