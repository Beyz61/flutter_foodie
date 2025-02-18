import 'package:flutter/material.dart';
import 'package:foodie_screen/config/colors.dart';

class MessageBubble extends StatelessWidget {
  final Map<String, String> message;

  const MessageBubble({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.containsKey("user")
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          color: message.containsKey("user")
              ? orangeWithoutOpacity
              : darkblackWithOpacity,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: message.containsKey("user")
                ? Colors.white
                : Colors.white,
            width: 1,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: message.containsKey("user")
                    ? "Ich: \n"
                    : "Foodie: \n",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 17,
                  color: message.containsKey("user")
                      ? const Color.fromARGB(255, 0, 0, 0)
                      : const Color.fromARGB(255, 255, 102, 0),
                ),
              ),
              TextSpan(
                text: message.containsKey("user")
                    ? message["user"]
                    : message["gemini"],
                style: TextStyle(
                  fontSize: 15,
                  color: message.containsKey("user")
                      ? const Color.fromARGB(255, 244, 243, 242)
                      : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
