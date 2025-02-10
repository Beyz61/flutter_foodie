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
          Preparation(title: "1. Step", preparationTexts: [
           "Die Kichererbsen über Nacht einweichen und dann abtropfen lassen."  
        ]),
          Preparation(title: "2. Step", preparationTexts: [
          "Zwiebel und Knoblauch fein hacken, die Kichererbsen mit den Gewürzen, Mehl und Backpulver pürieren.",
          ]),
          Preparation(title: "3. Step", preparationTexts: [
          "Aus der Masse kleine Bällchen formen und in heißem Öl goldbraun frittieren.",
          ]),
          Preparation(title: "4. Step", preparationTexts: [
          "Für den Humus alle Zutaten in einem Mixer zu einer cremigen Masse verarbeiten.",
          ]),
          Preparation(title: "5. Step", preparationTexts: [
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
        Preparation(title: "1. Step", preparationTexts: [
          "Den Pizzateig ausrollen und auf einem Blech ausbreiten.",
          ]),
          Preparation(title: "2. Step", preparationTexts: [
          "Die Tomaten in Scheiben schneiden und auf dem Teig verteilen.",
          ]),
          Preparation(title: "3. Step", preparationTexts: [
          "Mozzarella in Scheiben schneiden und auf die Tomaten legen.",
          ]),
          Preparation(title: "4. Step", preparationTexts: [
          "Mit Olivenöl und Balsamico beträufeln, mit Salz und Pfeffer würzen.",
          ]),
          Preparation(title: "5. Step", preparationTexts: [
          "Im vorgeheizten Ofen bei 220°C ca. 15 Minuten backen.",
          ]),
          Preparation(title: "6. Step", preparationTexts: [
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
          Preparation(title: "1. Step", preparationTexts: [         
           "Die Zwiebel und Tomate würfeln, die Avocado in Scheiben schneiden.",]),
            Preparation(title: "2. Step", preparationTexts: [
          "Die Bohnen in einer Pfanne mit Olivenöl erhitzen, mit Salz, Pfeffer und Limettensaft würzen.",]),
          Preparation(title: "3. Step", preparationTexts: [
          "Die Tortillas erwärmen und mit den Bohnen, Tomaten, Zwiebeln, Avocado und Koriander füllen.",]),
          Preparation(title: "4. Step", preparationTexts: [
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
        Preparation(title: "1. Step", preparationTexts: [          
         "Die Kartoffeln schälen und in Würfel schneiden. In einer Pfanne mit Olivenöl anbraten, bis sie goldbraun sind.",
          ]),
          Preparation(title: "2. Step", preparationTexts: [
          "Die Steaks in einer heißen Pfanne mit etwas Öl braten, mit Salz, Pfeffer und Rosmarin würzen.",
          ]),
          Preparation(title: "3. Step", preparationTexts: [
          "Die Steaks je nach gewünschter Garstufe braten.",
          ]),
          Preparation(title: "4. Step", preparationTexts: [
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
        Preparation(title: "1. Step", preparationTexts: [          
          "Die Burgerbrötchen aufschneiden und leicht anrösten.",
          ]),
          Preparation(title: "2. Step", preparationTexts: [
          "Tomaten und Zwiebel in Scheiben schneiden.",
          ]),
          Preparation(title: "3. Step", preparationTexts: [
          "Die Rinderpattys in einer heißen Pfanne oder auf dem Grill braten.",
          ]),
          Preparation(title: "4. Step", preparationTexts: [
          "Die Patties nach Belieben mit Käse belegen und schmelzen lassen.",
          ]),
          Preparation(title: "5. Step", preparationTexts: [
          "Die Burgerbrötchen mit Ketchup und Senf bestreichen.",
          ]),
          Preparation(title: "6. Step", preparationTexts: [
          "Burgerbrötchen mit Salat, Tomaten, Zwiebel und den Patties belegen und servieren.",
        ]),
      ],
      portion: 1,
      tipp: "Für extra Geschmack die Burger mit Jalapeños oder Bacon belegen.",
    ),
    Recipe(
    recipeName: "Sushi",
    imagePath: "assets/images/sushi.png",
    preparationTime: "30 Min",
    portionAmount: "2 Pers.",
    price: 16.98,
    category: "veggie",
    ingredients: [
      Ingredients(amount: 200, unit: "g", text: "Sushi-Reis"),
      Ingredients(amount: 1, unit: "", text: "Nori-Blatt"),
      Ingredients(amount: 100, unit: "g", text: "Lachs (oder Gemüse für vegane Variante)"),
      Ingredients(amount: 1, unit: "", text: "Avocado"),
      Ingredients(amount: 1, unit: "", text: "Karotte"),
      Ingredients(amount: 2, unit: "EL", text: "Reisessig"),
      Ingredients(amount: 1, unit: "TL", text: "Zucker"),
      Ingredients(amount: 1-2, unit: "TL", text: "Salz"),
      Ingredients(amount: 0, unit: "", text: "Sojasauce (zum Servieren)"),
    ],
    preparations: [
      Preparation(title: "1. Step", preparationTexts: [
        "Sushi-Reis waschen und nach Packungsanleitung kochen. Reisessig mit Zucker und Salz vermischen und unter den Reis heben.",
      ]),
      Preparation(title: "2. Step", preparationTexts: [
        "Die Avocado und Karotte in feine Streifen schneiden, Lachs ebenfalls in dünne Streifen schneiden.",
      ]),
      Preparation(title: "3. Step", preparationTexts: [
        "Nori-Blatt auf eine Bambusmatte legen, mit einer dünnen Schicht Reis bedecken und mit Gemüse oder Lachs füllen.",
      ]),
      Preparation(title: "4. Step", preparationTexts: [
        "Das Sushi vorsichtig aufrollen und in mundgerechte Stücke schneiden.",
      ]),
      Preparation(title: "5. Step", preparationTexts: [
        "Mit Sojasauce servieren.",
      ]),
    ],
    portion: 1,
    tipp: null,
  ),
  Recipe(
    recipeName: "Su Börek",
    imagePath: "assets/images/subörek.png",
    preparationTime: "30 Min",
    portionAmount: "2 Pers.",
    price: 15.98,
    category: "veggie",
    ingredients: [
      Ingredients(amount: 6, unit: "", text: "Yufka-Blätter"),
      Ingredients(amount: 300, unit: "g", text: "Spinat"),
      Ingredients(amount: 200, unit: "g", text: "Feta-Käse"),
      Ingredients(amount: 1, unit: "", text: "Zwiebel"),
      Ingredients(amount: 2, unit: "", text: "Knoblauchzehen"),
      Ingredients(amount: 2, unit: "EL", text: "Olivenöl"),
      Ingredients(amount: 1, unit: "", text: "Ei"),
      Ingredients(amount: 1, unit: "TL", text: "Salz"),
      Ingredients(amount: 1-2, unit: "TL", text: "Pfeffer"),
    ],
    preparations: [
      Preparation(title: "1. Step", preparationTexts: [
        "Spinat waschen und grob hacken. Zwiebel und Knoblauch in Olivenöl anbraten, Spinat dazugeben und zusammenfallen lassen.",
      ]),
      Preparation(title: "2. Step", preparationTexts: [
        "Feta-Käse zerbröseln und unter die Spinatmischung heben.",
      ]),
      Preparation(title: "3. Step", preparationTexts: [
        "Yufka-Blätter auf einem Blech ausbreiten, die Füllung darauf verteilen und einrollen. Mit Ei bestreichen.",
      ]),
      Preparation(title: "4. Step", preparationTexts: [
        "Im vorgeheizten Ofen bei 180°C ca. 25-30 Minuten goldbraun backen.",
      ]),
      Preparation(title: "5. Step", preparationTexts: [
        "In Stücke schneiden und servieren.",
      ]),
    ],
    portion: 1,
    tipp: null,
  ),
  Recipe(
    recipeName: "Fisch und Chips",
    imagePath: "assets/images/fishanchips.png",
    preparationTime: "30 Min",
    portionAmount: "2 Pers.",
    price: 16.98,
    category: "fast food",
    ingredients: [
      Ingredients(amount: 400, unit: "g", text: "Kabeljaufilets"),
      Ingredients(amount: 200, unit: "g", text: "Mehl"),
      Ingredients(amount: 1, unit: "TL", text: "Backpulver"),
      Ingredients(amount: 300, unit: "ml", text: "Bier"),
      Ingredients(amount: 1, unit: "", text: "Ei"),
      Ingredients(amount: 1, unit: "TL", text: "Salz"),
      Ingredients(amount: 05, unit: "TL", text: "Pfeffer"),
      Ingredients(amount: 500, unit: "g", text: "Kartoffeln"),
      Ingredients(amount: 0, unit: "", text: "Öl zum Frittieren"),
      Ingredients(amount: 0, unit: "", text: "Zitronenspalten (zum Servieren)"),
    ],
    preparations: [
      Preparation(title: "1. Step", preparationTexts: [
        "Die Kartoffeln schälen und in Stifte schneiden. In heißem Öl frittieren, bis sie goldbraun sind.",
      ]),
      Preparation(title: "2. Step", preparationTexts: [
        "Mehl, Backpulver, Bier, Ei, Salz und Pfeffer zu einem glatten Teig verrühren.",
      ]),
      Preparation(title: "3. Step", preparationTexts: [
        "Die Kabeljaufilets durch den Teig ziehen und in heißem Öl frittieren, bis sie knusprig und goldbraun sind.",
      ]),
      Preparation(title: "4. Step", preparationTexts: [
        "Die Fischfilets und Pommes auf einem Teller anrichten und mit Zitronenspalten servieren.",
      ]),
    ],
    portion: 1,
    tipp: null,
  ),
  Recipe(
    recipeName: "Lasagne",
    imagePath: "assets/images/lasagne.png",
    preparationTime: "30 Min",
    portionAmount: "2 Pers.",
    price: 13.98,
    category: "italian",
    ingredients: [
      Ingredients(amount: 200, unit: "g", text: "Lasagneblätter"),
      Ingredients(amount: 400, unit: "g", text: "Hackfleisch"),
      Ingredients(amount: 1, unit: "", text: "Zwiebel"),
      Ingredients(amount: 2, unit: "", text: "Knoblauchzehen"),
      Ingredients(amount: 1, unit: "Dose", text: "Tomaten (gehackt)"),
      Ingredients(amount: 2, unit: "EL", text: "Tomatenmark"),
      Ingredients(amount: 200, unit: "ml", text: "Bechamelsauce"),
      Ingredients(amount: 200, unit: "g", text: "Mozzarella"),
      Ingredients(amount: 1, unit: "TL", text: "Oregano"),
      Ingredients(amount: 1, unit: "TL", text: "Basilikum"),
      Ingredients(amount: 1, unit: "TL", text: "Salz"),
      Ingredients(amount: 05, unit: "TL", text: "Pfeffer"),
      Ingredients(amount: 2, unit: "EL", text: "Olivenöl"),
    ],
    preparations: [
      Preparation(title: "1. Step", preparationTexts: [
        "Zwiebel und Knoblauch fein hacken und in Olivenöl anbraten. Hackfleisch dazugeben und krümelig braten.",
      ]),
      Preparation(title: "2. Step", preparationTexts: [
        "Tomaten, Tomatenmark, Oregano, Basilikum, Salz und Pfeffer hinzufügen und köcheln lassen.",
      ]),
      Preparation(title: "3. Step", preparationTexts: [
        "Eine Auflaufform mit Lasagneblättern auslegen, eine Schicht Hackfleischsauce und Bechamelsauce darauf verteilen. Mit Mozzarella bestreuen.",
      ]),
      Preparation(title: "4. Step", preparationTexts: [
        "Schichten wiederholen, bis alle Zutaten aufgebraucht sind. Mit einer Schicht Mozzarella abschließen.",
      ]),
      Preparation(title: "5. Step", preparationTexts: [
        "Im vorgeheizten Ofen bei 180°C ca. 30-40 Minuten backen, bis die Lasagne goldbraun ist.",
      ]),
    ],
    portion: 1,
    tipp: null,
  ),
  Recipe(
    recipeName: "Soufflé",
    imagePath: "assets/images/image copy.png",
    preparationTime: "30 Min",
    portionAmount: "2 Pers.",
    price: 12.00,
    category: "dessert",
    ingredients: [
      Ingredients(amount: 100, unit: "g", text: "Zartbitterschokolade"),
      Ingredients(amount: 50, unit: "g", text: "Butter"),
      Ingredients(amount: 2, unit: "", text: "Eier"),
      Ingredients(amount: 50, unit: "g", text: "Zucker"),
      Ingredients(amount: 1, unit: "EL", text: "Mehl"),
      Ingredients(amount: 1, unit: "Prise", text: "Salz"),
      Ingredients(amount: 0, unit: "", text: "Puderzucker (zum Bestäuben)"),
    ],
    preparations: [
      Preparation(title: "1. Step", preparationTexts: [
        "Schokolade und Butter im Wasserbad schmelzen.",
      ]),
      Preparation(title: "2. Step", preparationTexts: [
        "Eier trennen, Eigelb mit Zucker schaumig schlagen. Geschmolzene Schokolade unterrühren.",
      ]),
      Preparation(title: "3. Step", preparationTexts: [
        "Eiweiß mit einer Prise Salz steif schlagen und unter die Schokoladenmasse heben.",
      ]),
      Preparation(title: "4. Step", preparationTexts: [
        "Förmchen mit Butter einfetten und mit Mehl bestäuben. Teig einfüllen.",
      ]),
      Preparation(title: "5. Step", preparationTexts: [
        "Im vorgeheizten Ofen bei 180°C ca. 12-15 Minuten backen, bis das Soufflé aufgegangen ist.",
      ]),
      Preparation(title: "6. Step", preparationTexts: [
        "Mit Puderzucker bestäuben und sofort servieren.",
      ]),
    ],
    portion: 1,
    tipp: null,
  ),
  Recipe(
    recipeName: "Kartoffelgratin",
    imagePath: "assets/images/gratin.png",
    preparationTime: "30 Min",
    portionAmount: "2 Pers.",
    price: 19.00,
    category: "side dish",
    ingredients: [
      Ingredients(amount: 600, unit: "g", text: "Kartoffeln"),
      Ingredients(amount: 200, unit: "ml", text: "Sahne"),
      Ingredients(amount: 100, unit: "g", text: "Käse (gerieben)"),
      Ingredients(amount: 1, unit: "", text: "Knoblauchzehe"),
      Ingredients(amount: 1, unit: "TL", text: "Salz"),
      Ingredients(amount: 05, unit: "TL", text: "Pfeffer"),
      Ingredients(amount: 1, unit: "Prise", text: "Muskatnuss"),
      Ingredients(amount: 1, unit: "EL", text: "Butter"),
    ],
    preparations: [
      Preparation(title: "1. Step", preparationTexts: [
        "Die Kartoffeln schälen und in dünne Scheiben schneiden.",
      ]),
      Preparation(title: "2. Step", preparationTexts: [
        "Knoblauch fein hacken und mit Sahne, Salz, Pfeffer und Muskatnuss vermischen.",
      ]),
      Preparation(title: "3. Step", preparationTexts: [
        "Eine Auflaufform mit Butter einfetten, die Kartoffelscheiben schichtweise einlegen und mit der Sahnemischung übergießen.",
      ]),
      Preparation(title: "4. Step", preparationTexts: [
        "Mit geriebenem Käse bestreuen und im vorgeheizten Ofen bei 180°C ca. 40-45 Minuten backen, bis das Gratin goldbraun ist.",
      ]),
    ],
    portion: 1,
    tipp: null,
  ),
];
