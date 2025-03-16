import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:influencer/renkler.dart';

class BottomBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  List<IconData> icons = [
    Icons.home,
    Icons.category,
    Icons.person
  ];

  List<String> labels = [
    'Ana Sayfa',
    'Kategoriler',
    'Profil'
  ];

  Tween<double> tween = Tween<double>(begin: 1.0, end: 1.2);
  bool animationCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: koyuMavi,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            color: Colors.transparent,
            child: TweenAnimationBuilder(
              key: ValueKey(widget.currentIndex),
              tween: tween,
              duration: Duration(milliseconds: animationCompleted ? 2000 : 200),
              curve: animationCompleted ? Curves.elasticOut : Curves.easeOut,
              onEnd: () {
                setState(() {
                  animationCompleted = true;
                  tween = Tween(begin: 1.2, end: 1.0);
                });
              },
              builder: (context, value, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(icons.length, (i) {
                    return Transform(
                      alignment: Alignment.bottomCenter,
                      transform: Matrix4.identity()
                        ..scale(i == widget.currentIndex ? value : 1.0)
                        ..translate(
                            0.0, i == widget.currentIndex ? 15.0 * (1 - value) : 0.0),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            animationCompleted = false;
                            tween = Tween(begin: 1.0, end: 1.2);
                          });
                          widget.onTap(i);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                          decoration: BoxDecoration(
                            color: i == widget.currentIndex ? beyaz.withAlpha(51) : Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                icons[i],
                                size: 26,
                                color: i == widget.currentIndex ? beyaz : beyaz.withAlpha(179),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                labels[i],
                                style: TextStyle(
                                  color: i == widget.currentIndex ? beyaz : beyaz.withAlpha(179),
                                  fontSize: 12,
                                  fontWeight: i == widget.currentIndex ? FontWeight.w600 : FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
} 