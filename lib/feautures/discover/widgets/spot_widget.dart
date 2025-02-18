import 'package:flutter/material.dart';
import 'package:foodie_screen/config/colors.dart';

class SpotWidget extends StatelessWidget {
  const SpotWidget({
    super.key, required this.text, required this.picture
  });

  final String text;
  final String picture;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Center(
        child: Container(
          height: 180,
          width: 180,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(picture),
              fit: BoxFit.cover,
            ),
            color: darkblackWithOpacity,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color:blackWithOpacity,
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              const Expanded(child: SizedBox()),
              Container(
                height: 55,
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
                decoration: BoxDecoration(
                  color: blackWithOpacity,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: blackWithOpacity,
                      spreadRadius: 2,
                      blurRadius: 6,
                      offset: const Offset(0, 3), 
                    ),
                  ],
                ),
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      text,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                        fontFamily: "SFProDisplay",
                        color: Color.fromARGB(255, 255, 249, 249),
                        shadows: [
                          Shadow(
                            blurRadius: 3,
                            color: Colors.black,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
