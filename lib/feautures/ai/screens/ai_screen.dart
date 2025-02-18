import "package:flutter/material.dart";
import "package:flutter_dotenv/flutter_dotenv.dart";
import 'package:foodie_screen/feautures/ai/widgets/header.dart';
import 'package:foodie_screen/feautures/ai/widgets/ingredient_container.dart';
import 'package:foodie_screen/feautures/ai/widgets/message_bubble.dart';
import "package:google_generative_ai/google_generative_ai.dart";

class AIScreen extends StatefulWidget {
  const AIScreen({super.key});

  @override
  AIScreenState createState() => AIScreenState();
}

class AIScreenState extends State<AIScreen> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, String>> _messages = [];
  late GenerativeModel _model;
  final String? apiKey = dotenv.env["API_KEY"];
  final List<String> _ingredients = [
    "Tomate", "Käse", "Basilikum", "Knoblauch", "Zwiebel", "Paprika",
    "Hähnchen", "Rindfleisch", "Schweinefleisch", "Fisch", "Reis", "Nudeln",
    "Kartoffeln", "Karotten", "Brokkoli", "Spinat", "Pilze", "Zucchini",
    "Aubergine", "Mais", "Erbsen", "Bohnen", "Linsen", "Kichererbsen",
    "Joghurt", "Milch", "Butter", "Sahne", "Eier", "Honig", "Zucker",
    "Mehl", "Olivenöl", "Essig", "Salz", "Pfeffer", "Chili", "Ingwer",
    "Zimt", "Kurkuma", "Koriander", "Petersilie", "Dill", "Rosmarin",
    "Thymian", "Oregano", "Lorbeerblatt", "Senf", "Sojasauce", "Tomatenmark"
  ];

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

    _scrollToBottom();
  }

  void _addIngredientToTextField(String ingredient) {
    setState(() {
      _controller.text = "${_controller.text} $ingredient".trim();
    });
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
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
                  const Header(),
                  Expanded(
                    flex: 4,
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount: _messages.length,
                      itemBuilder: (context, index) {
                        final message = _messages[index];
                        return MessageBubble(message: message);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: _ingredients.map((ingredient) {
                              return IngredientContainer(
                                ingredient: ingredient,
                                onTap: () => _addIngredientToTextField(ingredient),
                              );
                            }).toList(),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
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
