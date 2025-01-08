import 'package:color_shade_tint/color_shader.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class AColor {
  final Color? color;
  final String label;

  AColor(this.label, this.color);
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    final MaterialColor baseColor = Colors.red;

    final testColor = Color(0xFFE0C080); //baseColor.shade500;

    final myColors = testColor.toMaterialColor();

    final List<AColor> swatch = [
      AColor("50", myColors.shade50),
      AColor("100", myColors.shade100),
      AColor("200", myColors.shade200),
      AColor("300", myColors.shade300),
      AColor("400", myColors.shade400),
      AColor("500", myColors.shade500),
      AColor("600", myColors.shade600),
      AColor("700", myColors.shade700),
      AColor("800", myColors.shade800),
      AColor("900", myColors.shade900),
    ];

    final List<AColor> mColors = [
      AColor("0.5.", baseColor.shade50),
      AColor("100.", baseColor.shade100),
      AColor("200.", baseColor.shade200),
      AColor("300.", baseColor.shade300),
      AColor("400.", baseColor.shade400),
      // AColor("-.", baseColor),
      AColor("500.", baseColor.shade500),
      AColor("600.", baseColor.shade600),
      AColor("700.", baseColor.shade700),
      AColor("800.", baseColor.shade800),
      AColor("900.", baseColor.shade900),
    ];

    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Row(
              children: swatch
                  .map((item) => Ink(
                        color: item.color ?? Colors.amber,
                        width: 50,
                        height: 50,
                        child: Text(item.label),
                      ))
                  .toList(),
            ),
            Row(
              children: mColors
                  .map((item) => Ink(
                        color: item.color ?? Colors.amber,
                        width: 50,
                        height: 50,
                        child: Text(item.label),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
