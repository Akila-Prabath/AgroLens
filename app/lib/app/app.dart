import 'package:flutter/material.dart';

import 'router.dart';
import 'theme.dart';

class AgroLensApp extends StatelessWidget {
  const AgroLensApp({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return MaterialApp.router(
      title: 'AgroLens',

      debugShowCheckedModeBanner:
          false,

      theme:
          AgroLensTheme.lightTheme,

      routerConfig: appRouter,
    );
  }
}