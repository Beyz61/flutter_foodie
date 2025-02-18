import 'package:flutter/material.dart';
import 'package:foodie_screen/config/colors.dart';

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
                  color: selectedCategory == "Low Carb" ? const Color.fromARGB(255, 255, 98, 0) : Colors.transparent,
                  border: Border.all(color: const Color.fromARGB(255, 255, 255, 255), width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: blackWithOpacity,
                      spreadRadius: 2,
                      blurRadius: 6,
                      offset: const Offset(0, 4),
                    ),
                    BoxShadow(
                      color: witheWithOpacity,
                      spreadRadius: 2,
                      blurRadius: 6,
                      offset: const Offset(0, 0), 
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
                        color: withedarkWithOpacity,
                        spreadRadius: 2,
                        blurRadius: 6,
                        offset: const Offset(0, 0), 
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Icon(Icons.fitness_center, size: 40, 
                  color: selectedCategory == "Low Carb" ? 
                  const Color.fromARGB(255, 4, 36, 84) : const Color.fromARGB(255, 31, 82, 158)),
                ),
              ),
              const SizedBox(height: 5),
              Text("Low Carb", style: TextStyle(color: selectedCategory == "Low Carb" ? const Color.fromARGB(255, 255, 255, 255) : Colors.white,
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
                  color: selectedCategory == "Veggie" ? const Color.fromARGB(255, 249, 92, 8) : Colors.transparent,
                  border: Border.all(color: Colors.white, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: blackWithOpacity,
                      spreadRadius: 2,
                      blurRadius: 6,
                      offset: const Offset(0, 4), 
                    ),
                    BoxShadow(
                      color: witheWithOpacity,
                      spreadRadius: 2,
                      blurRadius: 6,
                      offset: const Offset(0, 0), 
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
                        color: withedarkWithOpacity,
                        spreadRadius: 2,
                        blurRadius: 6,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Icon(Icons.eco, size: 40, color: selectedCategory == "Veggie" ? const Color.fromARGB(255, 5, 66, 9) : const Color.fromARGB(255, 15, 138, 56)),
                ),
              ),
              const SizedBox(height: 5),
              Text("Veggie", style: TextStyle(color: selectedCategory == "Veggie" ? const Color.fromARGB(255, 255, 255, 255) : Colors.white,
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
                  color: selectedCategory == "Fast Food" ? const Color.fromARGB(255, 255, 98, 0) : Colors.transparent,
                  border: Border.all(color: Colors.white, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: blackWithOpacity,
                      spreadRadius: 2,
                      blurRadius: 6,
                      offset: const Offset(0, 4), 
                    ),
                    BoxShadow(
                      color: witheWithOpacity,
                      spreadRadius: 2,
                      blurRadius: 6,
                      offset: const Offset(0, 0),
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
                        color: withedarkWithOpacity,
                        spreadRadius: 2,
                        blurRadius: 6,
                        offset: const Offset(0, 0), 
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Icon(Icons.fastfood, size: 40,
                   color: selectedCategory == "Fast Food" ? const Color.fromARGB(255, 68, 49, 49) : const Color.fromARGB(255, 91, 71, 71)),
                ),
              ),
              const SizedBox(height: 5),
              Text("Fast Food", style: TextStyle(color: selectedCategory == "Fast Food" ? const Color.fromARGB(255, 255, 255, 255) : Colors.white,
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
                  color: selectedCategory == "Dessert" ? 
                  const Color.fromARGB(255, 255, 98, 0) : Colors.transparent,
                  border: Border.all(color: Colors.white, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: blackWithOpacity,
                      spreadRadius: 2,
                      blurRadius: 6,
                      offset: const Offset(0, 4), 
                    ),
                    BoxShadow(
                      color:witheWithOpacity,
                      spreadRadius: 2,
                      blurRadius: 6,
                      offset: const Offset(0, 0), 
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
                        color: withedarkWithOpacity,
                        spreadRadius: 2,
                        blurRadius: 6,
                        offset: const Offset(0, 0), 
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Icon(Icons.cake_outlined, size: 40,
                   color: selectedCategory == "Dessert" ? const Color.fromARGB(255, 88, 6, 50) : const Color.fromARGB(255, 193, 16, 111)),
                ),
              ),
              const SizedBox(height: 5),
              Text("Dessert", style: TextStyle(color: selectedCategory == "Dessert" ? const Color.fromARGB(255, 247, 246, 246) : Colors.white,
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
