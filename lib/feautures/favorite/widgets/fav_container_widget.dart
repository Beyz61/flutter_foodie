import 'package:flutter/material.dart';

class DisplayFavContainer extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final String picture;

   final VoidCallback onDelete;

  const DisplayFavContainer({
    super.key,
    required this.onTap,
    required this.text,
    required this.picture,
     required this.onDelete,
  });

  void _confirmDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black.withOpacity(0.8),
          title: const Text(
            "Kollektion löschen?",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "Abbrechen",
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: () async {
                 onDelete(); 
                 Navigator.of(context).pop();
              },
              child: const Text(
                "Löschen",
                style: TextStyle(color: Colors.red),
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
      onTap: onTap,
      child: Center(
        child: Container(
           height: 234,
           width: 215,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(picture), fit: BoxFit.fill),
             color: const Color.fromARGB(200, 233, 189, 149).withOpacity(0.8),
            borderRadius: BorderRadius.circular(20),
            
          ),
          child: Column(
            children: [
              const Expanded(child: SizedBox(),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(flex: 5, child: SizedBox()),
                  Text(
                    text,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      fontFamily: "SFProDisplay",
                      color: Color.fromARGB(255, 255, 249, 249),
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Color.fromARGB(255, 255, 249, 249),
                      size: 18,
                    ),
                    onPressed: () {
                      _confirmDelete(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}