import 'package:foodie_screen/feautures/feed/models/recipe.dart';

/*
List<FoodItem> foodRecipe = [
  FoodItem(
    imagePath: "assets/images/butterchicken.png",
    imageTitle: "Butter Chicken",
    imageSubTime: " 30 Min.",
    imagePrice: "   2 Pers./ 16,98 € ",
    // imageFav: " ",
    // iconClock: " ",
   ),
  FoodItem(
    imagePath: "assets/images/pancakes.png",
    imageTitle: "Pancakes mit Apfelsirup",
    imageSubTime: "30 Min.",
    imagePrice: "   2 Pers./ 15,98 € ",
    // imageFav: " ",
    // iconClock:" ",
  ),
  FoodItem(
    imagePath: "assets/images/falafelhumus.png",
    imageTitle: "Falafel mit Humus",
    imageSubTime: "40 Min.",
    imagePrice: " 2 Pers./ 11,98 €  ",
    // imageFav: "",
    // iconClock:" ",
  ),
  FoodItem(
    imagePath: "assets/images/pizza.png",
    imageTitle: "Pizza Caprese",
    imageSubTime: "40 Min.",
    imagePrice: "2 Pers./ 13.99 € ",
    // imageFav: " ",
    // iconClock:" ",
   ),
  FoodItem(
    imagePath: "assets/images/taco.png",
    imageTitle: "Vegane Tacos",
    imageSubTime: "30 Min",
    imagePrice: "2 Pers./ 12.00 €",
    // imageFav: " ",
    // iconClock:" ",
  ),
  FoodItem(
    imagePath: "assets/images/steak.png",
    imageTitle: "Steake mit Kartoffeln",
    imageSubTime: "40 Min.",
    imagePrice: "19,00 €",
    // imageFav: " ",
    // iconClock:" ",
  ),
  FoodItem(
    imagePath: "assets/images/burger.png",
    imageTitle: "Hamburger",
    imageSubTime: "40 Min",
    imagePrice: "2 Pers./ 19.00 €€",
    // imageFav: " ",
    // iconClock:" ",
  ),
  FoodItem(
    imagePath: "assets/images/sushi.png",
    imageTitle: "Sushi",
    imageSubTime: "30 Min",
    imagePrice: "2 Pers./ 16,98 €",
    // imageFav: " ",
    // iconClock:" ",
  ),
  FoodItem(
    imagePath: "assets/images/subörek.png",
    imageTitle: "Su Börek",
    imageSubTime: "Pistachio Icecream",
    imagePrice: "2 Pers./ 15,98 €",
    // imageFav: " ",
    // iconClock: " ",
  ),
  FoodItem(
    imagePath: "assets/images/fishanchips.png",
    imageTitle: "Fisch und Chips",
    imageSubTime: "30 Min",
    imagePrice: "2 Pers./ 16,98 €",
    // imageFav: " ",
    // iconClock:" ",
  ),
  FoodItem(
    imagePath: "assets/images/image.png",
    imageTitle: "Lasagne",
    imageSubTime: "30 Min",
    imagePrice: "2 Pers./ 13,98 €",
    // imageFav: " ",
    // iconClock:" ",
  ),
  // FoodItem(
  //   imagePath: "assets/images/souflfé.png",
  //   imageTitle: "Soufflé",
  //   imageSubTime: "30 Min",
  //   imagePrice: "2 Pers./ 12.00 €",
  //   // imageFav: " ",
  //   // iconClock:" ",
  // ),
  FoodItem(
    imagePath: "assets/images/gratin.png",
    imageTitle: "Kartoffelgratin",
    imageSubTime: "30 Minr",
    imagePrice: "2 Pers./ 19,00 €",
    // imageFav: " ",
    // iconClock:" ",
    // imageDescription:
    //     "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.",
    // imageIngredients: "Lecker",
    // imageReviews: ":stern:️:stern:️:stern:️:stern:️:stern:️:stern:️",
  ),
];*/

List<Recipe> recipes = [
    Recipe(
       imagePath: "assets/images/pancakes.png",
       preparationTime: "30 Min",
       portionAmount: "2 Pers.",
       price: 16.98,
      recipeName: "Pancakes mit Apfelsirup",
      category: "veggie",
      ingredients: [
        Ingredients(amount: 200, unit: "g", text: "Mehl"),
        Ingredients(amount: 1, unit: "TL", text: "Backpulver"),
        Ingredients(amount: 2, unit: "EL", text: "Zucker"),
        Ingredients(amount: 1, unit: "", text: "Ei"),
        Ingredients(amount: 200, unit: "ml", text: "Milch"),
        Ingredients(amount: 1, unit: "TL", text: "Vanillezucker"),
        Ingredients(amount: 1, unit: "", text: "Prise Salz"),
        Ingredients(amount: 2, unit: "EL", text: "Butter (geschmolzen)"),
        Ingredients(amount: 0, unit: "", text: "Apfelsirup (zum Servieren)"),
      ],
      preparations: [
        Preparation(title: "1. Step", preparationTexts: [
          "Mehl, Backpulver, Zucker und Salz in einer Schüssel vermengen.",
  
        ]),
          Preparation(title: "2. Step", preparationTexts: [
       
          "Ei, Milch, Vanillezucker und geschmolzene Butter hinzufügen und zu einem glatten Teig verrühren.",
      
        ]),
          Preparation(title: "3. Step", preparationTexts: [
        
          "Eine Pfanne erhitzen und mit etwas Öl oder Butter einfetten.",
   
        ]),
          Preparation(title: "4. Step", preparationTexts: [
        
       
          "Mit einer Kelle kleine Portionen des Teigs in die Pfanne geben und auf beiden Seiten goldbraun backen.",
         
        ]),
          Preparation(title: "5. Step", preparationTexts: [
        
          "Die Pancakes auf einen Teller stapeln und mit Apfelsirup servieren.",
        ]),
      ],
      portion: 1,
      tipp: null,
    ),
    Recipe(
         imagePath: "assets/images/falafelhumus.png",
      recipeName: "Falafel mit Humus",
      preparationTime: "40 Min",
      portionAmount: "2 Pers.",
      price: 11,
      category: "veggie",
      ingredients: [
        Ingredients(amount: 250, unit: "g", text: "Kichererbsen (getrocknet)"),
        Ingredients(amount: 1, unit: "", text: "Zwiebel"),
        Ingredients(amount: 2, unit: "", text: "Knoblauchzehen"),
        Ingredients(amount: 1, unit: "TL", text: "Kreuzkümmel"),
        Ingredients(amount: 1, unit: "TL", text: "Koriander"),
        Ingredients(amount: 1, unit: "TL", text: "Paprikapulver"),
        Ingredients(amount: 2, unit: "EL", text: "Mehl"),
        Ingredients(amount: 1, unit: "TL", text: "Backpulver"),
        Ingredients(amount: 0, unit: "", text: "Salz und Pfeffer"),
        Ingredients(amount: 0, unit: "", text: "Öl zum Frittieren"),
        Ingredients(amount: 200, unit: "g", text: "Kichererbsen (gekocht)"),
        Ingredients(amount: 2, unit: "EL", text: "Tahini"),
        Ingredients(amount: 1, unit: "", text: "Knoblauchzehe"),
        Ingredients(amount: 2, unit: "EL", text: "Zitronensaft"),
        Ingredients(amount: 3, unit: "EL", text: "Olivenöl"),
        Ingredients(amount: 0, unit: "", text: "Salz und Pfeffer"),
      ],
      preparations: [
        Preparation(title: "Zubereitung", preparationTexts: [
          "Die Kichererbsen über Nacht einweichen und dann abtropfen lassen.",
          "Zwiebel und Knoblauch fein hacken, die Kichererbsen mit den Gewürzen, Mehl und Backpulver pürieren.",
          "Aus der Masse kleine Bällchen formen und in heißem Öl goldbraun frittieren.",
          "Für den Humus alle Zutaten in einem Mixer zu einer cremigen Masse verarbeiten.",
          "Die Falafel mit Humus servieren.",
        ]),
      ],
      portion: 1,
      tipp: null,
    ),
    Recipe(
      recipeName: "Pizza Caprese",
      preparationTime: "30 Min",
      portionAmount: "2 Pers.",
      price: 12.5,
      category: "veggie",
          imagePath: "assets/images/pizza.png",
      ingredients: [
        Ingredients(amount: 1, unit: "", text: "Pizzateig"),
        Ingredients(amount: 200, unit: "g", text: "Tomaten"),
        Ingredients(amount: 200, unit: "g", text: "Mozzarella"),
        Ingredients(amount: 2, unit: "EL", text: "Olivenöl"),
        Ingredients(amount: 1, unit: "TL", text: "Balsamico-Essig"),
        Ingredients(amount: 0, unit: "", text: "Frisches Basilikum"),
        Ingredients(amount: 0, unit: "", text: "Salz und Pfeffer"),
      ],
      preparations: [
        Preparation(title: "Zubereitung", preparationTexts: [
          "Den Pizzateig ausrollen und auf einem Blech ausbreiten.",
          "Die Tomaten in Scheiben schneiden und auf dem Teig verteilen.",
          "Mozzarella in Scheiben schneiden und auf die Tomaten legen.",
          "Mit Olivenöl und Balsamico beträufeln, mit Salz und Pfeffer würzen.",
          "Im vorgeheizten Ofen bei 220°C ca. 15 Minuten backen.",
          "Mit frischem Basilikum garnieren und servieren.",
        ]),
      ],
      portion: 1,
      tipp: null,
    ),
    Recipe(
      recipeName: "Vegane Tacos",
        preparationTime: "30 Min",
      portionAmount: "2 Pers.",
      price: 12.5,
      category: "veggie",
      imagePath: "assets/images/taco.png",
      ingredients: [
        Ingredients(amount: 8, unit: "", text: "kleine Tortillas"),
        Ingredients(amount: 200, unit: "g", text: "schwarze Bohnen (aus der Dose)"),
        Ingredients(amount: 1, unit: "", text: "Avocado"),
        Ingredients(amount: 1, unit: "", text: "Tomate"),
        Ingredients(amount: 1, unit: "", text: "Zwiebel"),
        Ingredients(amount: 1, unit: "Handvoll", text: "Koriander"),
        Ingredients(amount: 2, unit: "EL", text: "Olivenöl"),
        Ingredients(amount: 1, unit: "", text: "Saft einer Limette"),
        Ingredients(amount: 0, unit: "", text: "Salz und Pfeffer"),
      ],
      preparations: [
        Preparation(title: "Zubereitung", preparationTexts: [
          "Die Zwiebel und Tomate würfeln, die Avocado in Scheiben schneiden.",
          "Die Bohnen in einer Pfanne mit Olivenöl erhitzen, mit Salz, Pfeffer und Limettensaft würzen.",
          "Die Tortillas erwärmen und mit den Bohnen, Tomaten, Zwiebeln, Avocado und Koriander füllen.",
          "Mit weiteren Gewürzen nach Belieben abschmecken und servieren.",
        ]),
      ],
      portion: 1,
      tipp: null,
    ),
    Recipe(
      recipeName: "Steak mit Kartoffeln",
        imagePath: "assets/images/steak.png",
          preparationTime: "30 Min",
      portionAmount: "2 Pers.",
      category:"low carb",
      price: 12.5,
      ingredients: [
        Ingredients(amount: 2, unit: "", text: "Rindersteaks (je ca. 200 g)"),
        Ingredients(amount: 600, unit: "g", text: "Kartoffeln"),
        Ingredients(amount: 2, unit: "EL", text: "Olivenöl"),
        Ingredients(amount: 2, unit: "", text: "Knoblauchzehen"),
        Ingredients(amount: 1, unit: "", text: "Rosmarinzweig"),
        Ingredients(amount: 1, unit: "TL", text: "Salz"),
        Ingredients(amount: 1, unit: "TL", text: "Pfeffer"),
        Ingredients(amount: 50, unit: "g", text: "Butter (optional)"),
      ],
      preparations: [
        Preparation(title: "Zubereitung", preparationTexts: [
          "Die Kartoffeln schälen und in Würfel schneiden. In einer Pfanne mit Olivenöl anbraten, bis sie goldbraun sind.",
          "Die Steaks in einer heißen Pfanne mit etwas Öl braten, mit Salz, Pfeffer und Rosmarin würzen.",
          "Die Steaks je nach gewünschter Garstufe braten.",
          "Die Kartoffeln und Steaks anrichten und optional mit etwas Butter servieren.",
        ]),
      ],
      portion: 1,
      tipp: "Für extra Geschmack kann man die Steaks mit Knoblauchbutter servieren.",
    ),
    Recipe(

      recipeName: "Hamburger",
          imagePath: "assets/images/burger.png",
            preparationTime: "30 Min",
      portionAmount: "2 Pers.",
      price: 12.5,
      category: "fast food",
      ingredients: [
        Ingredients(amount: 2, unit: "", text: "Burgerbrötchen"),
        Ingredients(amount: 2, unit: "", text: "Rinderpattys"),
        Ingredients(amount: 2, unit: "", text: "Scheiben Käse"),
        Ingredients(amount: 1, unit: "", text: "Tomate"),
        Ingredients(amount: 1, unit: "", text: "Zwiebel"),
        Ingredients(amount: 1, unit: "Handvoll", text: "Salat"),
        Ingredients(amount: 0, unit: "", text: "Ketchup (optional)"),
        Ingredients(amount: 0, unit: "", text: "Senf (optional)"),
        Ingredients(amount: 0, unit: "", text: "Salz und Pfeffer"),
      ],
      preparations: [
        Preparation(title: "Zubereitung", preparationTexts: [
          "Die Burgerbrötchen aufschneiden und leicht anrösten.",
          "Tomaten und Zwiebel in Scheiben schneiden.",
          "Die Rinderpattys in einer heißen Pfanne oder auf dem Grill braten.",
          "Die Patties nach Belieben mit Käse belegen und schmelzen lassen.",
          "Die Burgerbrötchen mit Ketchup und Senf bestreichen.",
          "Burgerbrötchen mit Salat, Tomaten, Zwiebel und den Patties belegen und servieren.",
        ]),
      ],
      portion: 1,
      tipp: "Für extra Geschmack die Burger mit Jalapeños oder Bacon belegen.",
    ),
  ];
