import 'package:flutter/material.dart';
import 'package:influencer/renkler.dart';
import 'package:influencer/filtre.dart';

class FilterButton extends StatelessWidget {
  final bool isBorder;
  final Color? color;
  const FilterButton({super.key, required this.isBorder, this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Filtre()),
        );
      },
      child: Container(
        height: 45,
        width: 120,
        decoration: BoxDecoration(
          color: siyah,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Filtrele',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: beyaz,
                )),
            const SizedBox(width: 12),
            Icon(
              Icons.tune,
              color: acikMavi,
              size: 20,
            )
          ],
        ),
      ),
    );
  }
} 