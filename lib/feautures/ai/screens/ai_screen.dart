import "package:flutter/material.dart";
import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:foodie_screen/config/colors.dart";
import "package:google_generative_ai/google_generative_ai.dart";

class AIScreen extends StatefulWidget {
  const AIScreen({super.key});

  @override
  AIScreenState createState() => AIScreenState();
}

class AIScreenState extends State<AIScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];
  late GenerativeModel _model;
  final String? apiKey = dotenv.env["API_KEY"];

  @override
  void initState() {
    super.initState();
    if (apiKey != null) {
      _model = GenerativeModel(model: "gemini-1.5-flash", apiKey: apiKey!);
    }
  }

  void _sendMessage() async {
    if (_controller.text.isEmpty || apiKey == null) return;

    String userMessage = _controller.text;
    setState(() {
      _messages.add({"user": userMessage});
    });
    _controller.clear();

    final content = [Content.text("Antworte auf den folgenden Text mit einem Rezept:$userMessage")];
    final response = await _model.generateContent(content);

    setState(() {
      _messages.add({"gemini": response.text ?? "No response"});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 24, 23, 22),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 75, 67, 59),
              Color.fromARGB(255, 24, 23, 22),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 290,
              left: 0,
              right: 0,
              child: Center(
                child: Opacity(
                  opacity: 0.6,
                  child: Image.asset(
                    "assets/icon/icon.png",
                    width: 300,
                    height: 300,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Column(
                children: [
                  const Center(
                    child: Text(
                      "Chat mit Foodie",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.italic,
                        fontFamily: "SFProDisplay",
                        color: Color.fromARGB(255, 242, 101, 8),
                        shadows: [
                          Shadow(
                            blurRadius: 5,
                            color: Colors.black,
                            offset: Offset(1, 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: ListView.builder(
                      itemCount: _messages.length,
                      itemBuilder: (context, index) {
                        final message = _messages[index];
                        return Align(
                          alignment: message.containsKey("user")
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                            decoration: BoxDecoration(
                              color: message.containsKey("user")
                                  ? const Color.fromARGB(255, 255, 102, 0).withOpacity(0.7)
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
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _controller,
                            decoration: const InputDecoration(
                                hintText: "Finde dein Rezept...",
                                hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 255, 250, 245)),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Color.fromARGB(255, 255, 250, 245)),
                                ),
                            ),
                            style: const TextStyle(
                              color: Color.fromARGB(255, 255, 254, 254),
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic,
                              fontFamily: "SFProDisplay",
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.send, color: Color.fromARGB(255, 255, 108, 3)),
                          onPressed: _sendMessage,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
