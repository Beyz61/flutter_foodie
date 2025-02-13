class Recipe {
  final String recipeName; // Rezeptname
  final List<Ingredients> ingredients; // Zutatenliste
  final List<Preparation> preparations; // Zubereitungsliste
  final String preparationTime;
  final String portionAmount;
  final double price;
  final String imagePath;
  final String category;
  int portion; // Speichern die Anzahl der Rezepte
  final String? tipp;

  Recipe({
    required this.recipeName,
    required this.ingredients,
    required this.preparations,
    required this.preparationTime,
    required this.portionAmount,
    required this.price,
    required this.imagePath,
    required this.category,
    required this.portion,
    required this.tipp,
  });

  // Gibt uns folgende Struktur aus:
  /*
    "        400 g\n"
                     "        200 g\n"
                     "         2 EL\n"
                     " 1x ca. 100 g\n"
                     "   2 ca. 10 g\n"
                     "  1x ca. 10 g\n"
                     "        200 g\n"
                     "         1 TL\n"
                     "         1 TL\n"
                     "         1 TL\n"
                     "         1/5 \n"
                     "         2 EL\n",
  */
  String getIngredientsUnitText() {
    List<String> ingredientsUnitText = [];
    for (Ingredients ingredient in ingredients) {
      ingredientsUnitText.add("        ${ingredient.amount * portion} ${ingredient.unit}");
    }
    return ingredientsUnitText.join("\n");
  }

  String getIngredientsValues() {
    return ingredients.map((ingredient) => ingredient.text).join("\n");
  }

  String buildPreparationTexts(Preparation preparation) {
    List<String> text = [];
    for (String preparationText in preparation.preparationTexts) {
      text.add(" $preparationText");
    }
    return text.join("\n");
  }
}

class Ingredients {
  final int amount;
  final String unit;
  final String text;

  Ingredients({required this.amount, required this.unit, required this.text});
}

class Preparation {
  final String title;
  final List<String> preparationTexts;

  Preparation({required this.title, required this.preparationTexts});
}