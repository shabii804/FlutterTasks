
import 'package:flutter/material.dart';
import 'main.dart';

class OpacityAnimation extends StatefulWidget {
  const OpacityAnimation({super.key});

  @override
  State<OpacityAnimation> createState() =>
      _OpacityAnimationState();
}

class _OpacityAnimationState extends State<OpacityAnimation> {
  double opacity = 1.0;
  bool isOpening = false;

  void openMenu() {
    if (isOpening) return;

    setState(() {
      isOpening = true;
      opacity = 0.0;
    });

    Future.delayed(const Duration(milliseconds: 2000), () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
          const MenuScreen(),
          transitionsBuilder:
              (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 1000),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?w=1200',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(color: Colors.brown);
            },
          ),

          Container(
            color: Colors.black.withValues(alpha: 0.60),
          ),

          Center(
            child: AnimatedOpacity(
              opacity: opacity,
              duration: const Duration(milliseconds: 1000),
              curve: Curves.easeInOut,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.restaurant,
                      size: 75,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Welcome to Our Restaurant',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Delicious food, wonderful moments!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton.icon(
                      onPressed: isOpening ? null : openMenu,
                      icon: const Icon(Icons.restaurant_menu),
                      label: const Text('Explore Our Menu'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 26,
                          vertical: 18,
                        ),
                        textStyle: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
