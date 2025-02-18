import 'package:flutter/material.dart';
import 'package:foodie_screen/config/colors.dart';
import 'package:foodie_screen/data/repository/recipe/shared_preferences_recipe_repository.dart';
import 'package:provider/provider.dart';

class DisplayFavContainer extends StatefulWidget {
  final Function()? onTap;
  final String text;
  final String? picture;
  final VoidCallback onDelete;

  const DisplayFavContainer({
    super.key,
    required this.onTap,
    required this.text,
    this.picture,
    required this.onDelete,
  });

  @override
  _DisplayFavContainerState createState() => _DisplayFavContainerState();
}

class _DisplayFavContainerState extends State<DisplayFavContainer> {
  late String collectionName;

  @override
  void initState() {
    super.initState();
    collectionName = widget.text;
  }

  void _confirmDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: darkblackWithOpacity,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Colors.white, width: 1), 
          ),
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
                widget.onDelete();
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

  void _editCollectionName(BuildContext context) {
    final TextEditingController controller = TextEditingController(text: widget.text);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final sharedProvider = Provider.of<SharedPreferencesRecipeRepository>(context);
        return AlertDialog(
          backgroundColor: darkblackWithOpacity,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Colors.white, width: 1), 
          ),
          title: const Text(
            "Kollektion bearbeiten",
            style: TextStyle(color: Colors.white),
          ),
          content: TextField(
            controller: controller,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              hintText: "Kollektion Name",
              hintStyle: TextStyle(color: Colors.white54),
            ),
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
              onPressed: () {
                sharedProvider.changeCollectionName(widget.text, controller.text);
                Navigator.of(context).pop();
              },
              child: const Text(
                "Speichern",
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
      onTap: widget.onTap,
      child: Center(
        child: Container(
          height: 234,
          width: 215,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(widget.picture ?? "assets/icon/bosssss.png"),
              fit: BoxFit.cover,
              scale: 4.0, 
            ),
            color: blackWithOpacityCollection,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: blackWithOpacity,
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  width: 30, 
                  height: 30,
                  decoration: BoxDecoration(
                    color:blackWithOpacity,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: IconButton(
                      padding: EdgeInsets.zero, 
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 18, 
                      ),
                      onPressed: () {
                        _editCollectionName(context);
                      },
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  width: 30, 
                  height: 30,
                  decoration: BoxDecoration(
                    color: darkblackWithOpacity,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.orange,
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: IconButton(
                      padding: EdgeInsets.zero, 
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.orange,
                        size: 18, 
                      ),
                      onPressed: () {
                        _confirmDelete(context);
                      },
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  const Expanded(child: SizedBox(),),
                  Container(
                    height: 55, 
                    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
                    decoration: BoxDecoration(
                      color:lightdarkblackWithOpacity,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(12), 
                        bottomRight: Radius.circular(12)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              widget.text,
                              style: const TextStyle(
                                fontSize: 18,
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
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ),
                      ],
                    ),
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