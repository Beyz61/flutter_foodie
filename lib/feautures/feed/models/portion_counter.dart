import 'package:flutter/material.dart';
import 'package:foodie_screen/feautures/feed/models/recipe.dart';

class PortionCounter extends StatefulWidget {
  final Recipe recipe;
  final Function() callback;
  const PortionCounter({super.key, required this.recipe, required this.callback});


  @override
  _PortionCounterState createState() => _PortionCounterState();
}

class _PortionCounterState extends State<PortionCounter> {
  late int _portionCount;

  @override
  void initState() {
    _portionCount = widget.recipe.portion;
    super.initState();
  }

  void _increment() {
    setState(() {
      _portionCount++;
      widget.recipe.portion++;
    });
    widget.callback();
  }

  void _decrement() {
    if (_portionCount > 1) {
      setState(() {
        _portionCount--;
        widget.recipe.portion--;
      });
      widget.callback();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150, 
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5), 
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            offset: const Offset(4, 4),
            blurRadius: 8,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: Colors.white.withOpacity(0.1),
            offset: const Offset(-4, -4),
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Portion",
            style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontFamily: "SFProDisplay",
                    shadows: [
                      Shadow(
                        offset: Offset(0, 3),
                        blurRadius: 6,
                        color: Colors.black54,
                      ),
                    ],
                  ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.remove,
                  size: 39,
                  color: Color.fromARGB(221, 57, 215, 255),
                  shadows: [
                    Shadow(
                      offset: Offset(0, 1),
                      blurRadius: 2,
                      color: Color.fromARGB(106, 236, 233, 233),
                    ),
                  ],
                ),
                onPressed: _decrement,
                iconSize: 34,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                splashRadius: 24,
                color: Colors.white,
              ),
              Text(
                "$_portionCount", 
                style: const TextStyle(fontSize: 39, fontWeight: FontWeight.w600, color: Colors.white, shadows: [
                  Shadow(
                    offset: Offset(2, 2),
                    blurRadius: 3,
                    color: Colors.black,
                  ),
                ]), 
              ),
              IconButton(
                icon: const Icon(
                  Icons.add,
                  size: 38,
                  
                  color: Colors.red,
                ),
                onPressed: _increment,
              ),
              const SizedBox(height: 10),
            ],
          ),
        ],
      ),
    );
  }
}
