import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final Function(String) onCategorySelected;
  final String? selectedCategory;

  const CategoryWidget({
    super.key,
    required this.onCategorySelected,
    required this.selectedCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () => onCategorySelected("Low Carb"),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: selectedCategory == "Low Carb" ? Colors.white : Colors.transparent,
                  border: Border.all(color: Colors.white, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 6,
                      offset: const Offset(0, 4), // changes position of shadow
                    ),
                    BoxShadow(
                      color: Colors.white.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 6,
                      offset: const Offset(0, 0), // outer glow effect
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 6,
                        offset: const Offset(0, 0), // inner glow effect
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Icon(Icons.fitness_center, size: 40, color: selectedCategory == "Low Carb" ? Colors.black : const Color.fromARGB(255, 75, 70, 70)),
                ),
              ),
              const SizedBox(height: 5),
              Text("Low Carb", style: TextStyle(color: selectedCategory == "Low Carb" ? Colors.black : Colors.white,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic,
                fontFamily: "SFProDisplay",
              )),
            ],
          ),
        ),
        GestureDetector(
          onTap: () => onCategorySelected("Veggie"),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: selectedCategory == "Veggie" ? Colors.white : Colors.transparent,
                  border: Border.all(color: Colors.white, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 6,
                      offset: const Offset(0, 4), // changes position of shadow
                    ),
                    BoxShadow(
                      color: Colors.white.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 6,
                      offset: const Offset(0, 0), // outer glow effect
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 6,
                        offset: const Offset(0, 0), // inner glow effect
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Icon(Icons.eco, size: 40, color: selectedCategory == "Veggie" ? Colors.black : const Color.fromARGB(255, 15, 138, 56)),
                ),
              ),
              const SizedBox(height: 5),
              Text("Veggie", style: TextStyle(color: selectedCategory == "Veggie" ? Colors.black : Colors.white,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic,
                fontFamily: "SFProDisplay",
              )),
            ],
          ),
        ),
        GestureDetector(
          onTap: () => onCategorySelected("Fast Food"),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: selectedCategory == "Fast Food" ? Colors.white : Colors.transparent,
                  border: Border.all(color: Colors.white, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 6,
                      offset: const Offset(0, 4), // changes position of shadow
                    ),
                    BoxShadow(
                      color: Colors.white.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 6,
                      offset: const Offset(0, 0), // outer glow effect
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 6,
                        offset: const Offset(0, 0), // inner glow effect
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Icon(Icons.fastfood, size: 40, color: selectedCategory == "Fast Food" ? Colors.black : const Color.fromARGB(255, 91, 71, 71)),
                ),
              ),
              const SizedBox(height: 5),
              Text("Fast Food", style: TextStyle(color: selectedCategory == "Fast Food" ? Colors.black : Colors.white,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic,
                fontFamily: "SFProDisplay",
              )),
            ],
          ),
        ),
        GestureDetector(
          onTap: () => onCategorySelected("Dessert"),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: selectedCategory == "Dessert" ? Colors.white : Colors.transparent,
                  border: Border.all(color: Colors.white, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 6,
                      offset: const Offset(0, 4), // changes position of shadow
                    ),
                    BoxShadow(
                      color: Colors.white.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 6,
                      offset: const Offset(0, 0), // outer glow effect
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 6,
                        offset: const Offset(0, 0), // inner glow effect
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Icon(Icons.cake_outlined, size: 40, color: selectedCategory == "Dessert" ? Colors.black : const Color.fromARGB(255, 193, 16, 111)),
                ),
              ),
              const SizedBox(height: 5),
              Text("Dessert", style: TextStyle(color: selectedCategory == "Dessert" ? Colors.black : Colors.white,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic,
                fontFamily: "SFProDisplay",
              )),
            ],
          ),
        ),
      ],
    );
  }
}
