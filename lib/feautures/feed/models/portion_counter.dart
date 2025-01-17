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
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(
              Icons.remove,
              size: 34,
              color: Color.fromARGB(221, 40, 36, 36),
            ),
            onPressed: _decrement,
          ),
          Text(
            "$_portionCount", 
            style: const TextStyle(fontSize: 34, color: Colors.white), 
          ),
          IconButton(
            icon: const Icon(
              Icons.add,
              size: 34,
              color: Colors.red,
            ),
            onPressed: _increment,
          ),
          const SizedBox(height: 10),

        ],
      ),
    );
  }
}
