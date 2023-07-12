import 'dart:math';

import 'package:flutter/material.dart';

import 'heart_broken_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final cardSize = 160.0;

  late final holeSizeTween = Tween<double>(
    begin: 0,
    end: 1.5 * cardSize,
  );

  late final holeAnimationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 300),
  );

  double get holeSize => holeSizeTween.evaluate(holeAnimationController);

  late final cardOffsetAnimationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1000),
  );

  /// Card Animation
  late final cardOffsetTween = Tween<double>(
    begin: 0,
    end: 2 * cardSize,
  ).chain(CurveTween(curve: Curves.easeInBack));
  late final cardRotationTween = Tween<double>(
    begin: 0,
    end: 0.5,
  ).chain(CurveTween(curve: Curves.easeInBack));

  double get cardOffset =>
      cardOffsetTween.evaluate(cardOffsetAnimationController);
  double get cardRotation =>
      cardRotationTween.evaluate(cardOffsetAnimationController);

  @override
  void initState() {
    super.initState();
    holeAnimationController.addListener(() => setState(() {}));

    /// Card Animation
    cardOffsetAnimationController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    holeAnimationController.dispose();

    /// Card Animation
    cardOffsetAnimationController.dispose();
    super.dispose();
  }

  Future<void> _onPressMinusButton() async {
    holeAnimationController.forward();
    await cardOffsetAnimationController.forward();
    Future.delayed(const Duration(milliseconds: 100),
        () => holeAnimationController.reverse());
  }

  Future<void> _onPressAddButton() async {
    cardOffsetAnimationController.reverse();
    holeAnimationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: _onPressMinusButton,
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 20),
          FloatingActionButton(
            onPressed: _onPressAddButton,
            child: const Icon(Icons.add),
          ),
        ],
      ),
      body: Center(
        child: SizedBox(
          height: cardSize * 1.25, // set size for Stack UI
          child: ClipPath(
            clipper: BlackHoleClipper(),
            child: Stack(
              alignment: Alignment.bottomCenter,
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  width: holeSize, // animate the black hole
                  child: Image.asset(
                    'assets/images/hole.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  child: Center(
                    child: Transform.translate(
                      offset: Offset(0, cardOffset),
                      child: Transform.rotate(
                        angle: cardRotation,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: HeartBrokenWidget(size: cardSize),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BlackHoleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height / 2);
    path.arcTo(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: size.width,
        height: size.height,
      ),
      0,
      pi, // import 'dart:math';
      true,
    );
    // Using -1000 guarantees the card won't be clipped at the top, regardless of its height
    path.lineTo(0, -1000);
    path.lineTo(size.width, -1000);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(BlackHoleClipper oldClipper) => false;
}
