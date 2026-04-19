import 'package:flutter/material.dart';
import 'dart:math';

class BmiCalculatorScreen extends StatefulWidget {
  const BmiCalculatorScreen({super.key});

  @override
  State<BmiCalculatorScreen> createState() => _BmiCalculatorScreenState();
}

class _BmiCalculatorScreenState extends State<BmiCalculatorScreen> with SingleTickerProviderStateMixin {
  int height = 170;
  int weight = 65;
  double? bmiResult;
  String? bmiCategory;
  Color? categoryColor;

  late AnimationController _animController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _scaleAnimation = CurvedAnimation(parent: _animController, curve: Curves.elasticOut);
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  void calculateBMI() {
    setState(() {
      bmiResult = weight / pow(height / 100, 2);
      if (bmiResult! < 18.5) {
        bmiCategory = 'UNDERWEIGHT';
        categoryColor = Colors.blueAccent;
      } else if (bmiResult! >= 18.5 && bmiResult! < 25) {
        bmiCategory = 'NORMAL';
        categoryColor = Colors.greenAccent;
      } else {
        bmiCategory = 'OVERWEIGHT';
        categoryColor = Colors.redAccent;
      }
    });
    _animController.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Height Card
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('HEIGHT', style: TextStyle(fontSize: 18.0, color: Colors.white54, letterSpacing: 2.0)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(height.toString(), style: const TextStyle(fontSize: 50.0, fontWeight: FontWeight.w900)),
                            const Text(' cm', style: TextStyle(fontSize: 18.0, color: Colors.white54)),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: const Color(0xFF8D8E98),
                            thumbColor: Theme.of(context).colorScheme.primary,
                            overlayColor: Theme.of(context).colorScheme.primary.withOpacity(0.29),
                            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape: const RoundSliderOverlayShape(overlayRadius: 30.0),
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: 100.0,
                            max: 220.0,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                                bmiResult = null;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                // Weight Card
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('WEIGHT', style: TextStyle(fontSize: 18.0, color: Colors.white54, letterSpacing: 2.0)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(weight.toString(), style: const TextStyle(fontSize: 50.0, fontWeight: FontWeight.w900)),
                            const Text(' kg', style: TextStyle(fontSize: 18.0, color: Colors.white54)),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: Icons.remove,
                              onPressed: () {
                                setState(() {
                                  if (weight > 20) weight--;
                                  bmiResult = null;
                                });
                              },
                            ),
                            const SizedBox(width: 20.0),
                            RoundIconButton(
                              icon: Icons.add,
                              onPressed: () {
                                setState(() {
                                  if (weight < 250) weight++;
                                  bmiResult = null;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                // Animated Result Area
                if (bmiResult != null)
                  Expanded(
                    child: ScaleTransition(
                      scale: _scaleAnimation,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [categoryColor!.withOpacity(0.8), categoryColor!.withOpacity(0.4)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: categoryColor!.withOpacity(0.5),
                              blurRadius: 15,
                              offset: const Offset(0, 5),
                            )
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              bmiCategory!,
                              style: const TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 2),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              bmiResult!.toStringAsFixed(1),
                              style: const TextStyle(fontSize: 60.0, fontWeight: FontWeight.w900, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                else
                  const Expanded(child: SizedBox.shrink()),
              ],
            ),
          ),
        ),
        // Calculate Button
        GestureDetector(
          onTap: calculateBMI,
          child: Container(
            margin: const EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: 80.0,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                  blurRadius: 20,
                  offset: const Offset(0, -5),
                )
              ],
            ),
            child: const Center(
              child: Text(
                'CALCULATE BMI',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 1.5),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({super.key, required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      onPressed: onPressed,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
      child: Icon(icon, color: Colors.white),
    );
  }
}
