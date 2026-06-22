import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/splash/presentation/splash_screen.dart';
import '../features/home/presentation/home_screen.dart';
import '../features/camera/presentation/camera_screen.dart';
import '../features/upload/presentation/upload_screen.dart';
import '../features/result/presentation/result_screen.dart';
import '../features/recommendation/presentation/recommendation_screen.dart';
import '../features/history/presentation/history_screen.dart';
import '../features/profile/presentation/profile_screen.dart';

class AppRoutes {
  static const splash = '/';

  static const home = '/home';

  static const camera = '/camera';

  static const upload = '/upload';

  static const result = '/result';

  static const recommendation =
      '/recommendation';

  static const history = '/history';

  static const profile = '/profile';
}

final GoRouter appRouter =
    GoRouter(
  initialLocation: AppRoutes.splash,

  routes: [

    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) =>
          const SplashScreen(),
    ),

    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) =>
          const HomeScreen(),
    ),

    GoRoute(
      path: AppRoutes.camera,
      builder: (context, state) =>
          const CameraScreen(),
    ),

    GoRoute(
      path: AppRoutes.upload,
      builder: (context, state) =>
          const UploadScreen(),
    ),

    GoRoute(
      path: AppRoutes.result,
      builder: (context, state) =>
          const ResultScreen(),
    ),

    GoRoute(
      path:
          AppRoutes.recommendation,
      builder: (context, state) =>
          const RecommendationScreen(),
    ),

    GoRoute(
      path: AppRoutes.history,
      builder: (context, state) =>
          const HistoryScreen(),
    ),

    GoRoute(
      path: AppRoutes.profile,
      builder: (context, state) =>
          const ProfileScreen(),
    ),
  ],
);