import 'package:bereal/contact/contact_screen.dart';
import 'package:bereal/home/home_screen.dart';
import 'package:bereal/onboarding/onboarding_screen.dart';
import 'package:bereal/profile/profile_screen.dart';
import 'package:bereal/real_camera/real_camera_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) => const HomeScreen(),
        redirect: (context, state) async {
          const storage = FlutterSecureStorage();
          FlutterNativeSplash.remove();
          final user = await storage.read(key: 'user');
          if (user == null) {
            return '/onboarding';
          }

          return null;
        },
        routes: <GoRoute>[
          GoRoute(
            path: 'contact',
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                  transitionDuration: const Duration(milliseconds: 200),
                  child: const ContactScreen(),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    return Stack(
                      children: <Widget>[
                        SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(-1.0, 0.0),
                            end: const Offset(0.0, 0.0),
                          ).animate(
                            CurvedAnimation(
                              parent: animation,
                              curve: Curves.linear,
                            ),
                          ),
                          child: child,
                        ),
                        SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(0.0, 0.0),
                            end: const Offset(1.0, 0.0),
                          ).animate(
                            CurvedAnimation(
                              parent: animation,
                              curve: Curves.linear,
                            ),
                          ),
                          child: const HomeScreen(),
                        )
                      ],
                    );
                  });
            },
          ),
          GoRoute(
            path: 'profile',
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                  transitionDuration: const Duration(milliseconds: 200),
                  child: const ProfileScreen(),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    return Stack(
                      children: <Widget>[
                        SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(1.0, 0.0),
                            end: const Offset(0.0, 0.0),
                          ).animate(
                            CurvedAnimation(
                              parent: animation,
                              curve: Curves.linear,
                            ),
                          ),
                          child: child,
                        ),
                        SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(0.0, 0.0),
                            end: const Offset(-1.0, 0.0),
                          ).animate(
                            CurvedAnimation(
                              parent: animation,
                              curve: Curves.linear,
                            ),
                          ),
                          child: const HomeScreen(),
                        )
                      ],
                    );
                  });
            },
          )
        ]),
    GoRoute(
      path: '/camera',
      builder: (context, state) => const RealCameraScreen(),
    ),
    GoRoute(
        path: '/onboarding', builder: (BuildContext context, GoRouterState state) => const OnboardingScreen(step: 0)),
  ],
);
