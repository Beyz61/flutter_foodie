import 'package:flutter/material.dart';
import 'package:foodie_screen/config/colors.dart';

class RichtlinienWidget extends StatelessWidget {
  const RichtlinienWidget({super.key});

  void _showRichtlinienDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: darkblackWithOpacity,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: const BorderSide(color: Colors.white, width: 1),
          ),
          title: const Text(
            'Nutzungs- und Datenschutzbestimmungen',
            style: TextStyle(
              color: Color.fromARGB(255, 246, 191, 143),
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic,
              fontFamily: "SFProDisplay",
            ),
          ),
          content: const SingleChildScrollView(
            child: Text(
              'Willkommen bei Foodie! Wir freuen uns, dass du unsere App nutzt. '
              'Deine Privatsphäre und der Schutz deiner Daten sind uns sehr wichtig. '
              'Hier sind unsere Richtlinien:\n\n'
              '1. Datensammlung: Wir sammeln nur die notwendigsten Daten, um dir die besten Rezepte und Funktionen zu bieten. '
              'Dazu gehören deine E-Mail-Adresse, Benutzername und Passwort.\n'
              '2. Datensicherheit: Deine Daten werden sicher gespeichert und niemals ohne deine Zustimmung weitergegeben. '
              'Wir verwenden moderne Sicherheitsmaßnahmen, um deine Informationen zu schützen.\n'
              '3. Nutzungsbedingungen: Bitte nutze die App verantwortungsvoll und respektiere die Rechte anderer Nutzer. '
              'Veröffentliche keine unangemessenen Inhalte und halte dich an die Community-Richtlinien.\n'
              '4. Änderungen: Wir behalten uns das Recht vor, diese Richtlinien jederzeit zu ändern. '
              'Du wirst über wesentliche Änderungen informiert und hast die Möglichkeit, die neuen Bedingungen zu akzeptieren oder die Nutzung der App einzustellen.\n\n'
              'Vielen Dank, dass du Teil der Foodie-Community bist! Wir wünschen dir viel Spaß beim Kochen und Entdecken neuer Rezepte.',
              style: TextStyle(
                color: Color.fromARGB(255, 255, 254, 254),
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic,
                fontFamily: "SFProDisplay",
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Schließen',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 108, 3),
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                  fontFamily: "SFProDisplay",
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showRichtlinienDialog(context),
      child: const Text(
        "Indem du Foodie verwendest, stimmst du unseren Nutzungs- und Datenschutzbestimmungen zu.",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: "SFProDisplay",
          color: Colors.black54,
          fontSize: 10,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline,
          decorationColor: Color.fromARGB(73, 0, 0, 0),
        ),
      ),
    );
  }
}