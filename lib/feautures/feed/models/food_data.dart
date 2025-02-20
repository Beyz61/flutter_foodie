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
    imageTitle: "Fisch & Chips",
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
      category: "Dessert",
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
          "Mehl, Backpulver, Zucker & Salz in einer Schüssel vermengen.",
  
        ]),
          Preparation(title: "2. Step", preparationTexts: [
       
          "Ei, Milch, Vanillezucker & geschmolzene Butter hinzufügen & zu einem glatten Teig verrühren.",
      
        ]),
          Preparation(title: "3. Step", preparationTexts: [
        
          "Eine Pfanne erhitzen & mit etwas Öl oder Butter einfetten.",
   
        ]),
          Preparation(title: "4. Step", preparationTexts: [
        
       
          "Mit einer Kelle kleine Portionen des Teigs in die Pfanne geben & auf beiden Seiten goldbraun backen.",
         
        ]),
          Preparation(title: "5. Step", preparationTexts: [
        
          "Die Pancakes auf einen Teller stapeln & mit Apfelsirup servieren.",
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
      category: "Veggie",
      ingredients: [
        Ingredients(amount: 250, unit: "g", text: "Kichererbsen (getrocknet)"),
        Ingredients(amount: 1, unit: "", text: "Zwiebel"),
        Ingredients(amount: 2, unit: "", text: "Knoblauchzehen"),
        Ingredients(amount: 1, unit: "TL", text: "Kreuzkümmel"),
        Ingredients(amount: 1, unit: "TL", text: "Koriander"),
        Ingredients(amount: 1, unit: "TL", text: "Paprikapulver"),
        Ingredients(amount: 2, unit: "EL", text: "Mehl"),
        Ingredients(amount: 1, unit: "TL", text: "Backpulver"),
        Ingredients(amount: 0, unit: "", text: "Salz & Pfeffer"),
        Ingredients(amount: 0, unit: "", text: "Öl zum Frittieren"),
        Ingredients(amount: 200, unit: "g", text: "Kichererbsen (gekocht)"),
        Ingredients(amount: 2, unit: "EL", text: "Tahini"),
        Ingredients(amount: 1, unit: "", text: "Knoblauchzehe"),
        Ingredients(amount: 2, unit: "EL", text: "Zitronensaft"),
        Ingredients(amount: 3, unit: "EL", text: "Olivenöl"),
        Ingredients(amount: 0, unit: "", text: "Salz & Pfeffer"),
      ],
      preparations: [
          Preparation(title: "1. Step", preparationTexts: [
           "Die Kichererbsen über Nacht einweichen & dann abtropfen lassen."  
        ]),
          Preparation(title: "2. Step", preparationTexts: [
          "Zwiebel & Knoblauch fein hacken, die Kichererbsen mit den Gewürzen, Mehl & Backpulver pürieren.",
          ]),
          Preparation(title: "3. Step", preparationTexts: [
          "Aus der Masse kleine Bällchen formen & in heißem Öl goldbraun frittieren.",
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
      category: "Veggie",
          imagePath: "assets/images/pizza.png",
      ingredients: [
        Ingredients(amount: 1, unit: "", text: "Pizzateig"),
        Ingredients(amount: 200, unit: "g", text: "Tomaten"),
        Ingredients(amount: 200, unit: "g", text: "Mozzarella"),
        Ingredients(amount: 2, unit: "EL", text: "Olivenöl"),
        Ingredients(amount: 1, unit: "TL", text: "Balsamico-Essig"),
        Ingredients(amount: 0, unit: "", text: "Frisches Basilikum"),
        Ingredients(amount: 0, unit: "", text: "Salz & Pfeffer"),
      ],
      preparations: [
        Preparation(title: "1. Step", preparationTexts: [
          "Den Pizzateig ausrollen & auf einem Blech ausbreiten.",
          ]),
          Preparation(title: "2. Step", preparationTexts: [
          "Die Tomaten in Scheiben schneiden & auf dem Teig verteilen.",
          ]),
          Preparation(title: "3. Step", preparationTexts: [
          "Mozzarella in Scheiben schneiden & auf die Tomaten legen.",
          ]),
          Preparation(title: "4. Step", preparationTexts: [
          "Mit Olivenöl & Balsamico beträufeln, mit Salz & Pfeffer würzen.",
          ]),
          Preparation(title: "5. Step", preparationTexts: [
          "Im vorgeheizten Ofen bei 220°C ca. 15 Minuten backen.",
          ]),
          Preparation(title: "6. Step", preparationTexts: [
          "Mit frischem Basilikum garnieren & servieren.",
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
      category: "Veggie",
      imagePath: "assets/images/taco.png",
      ingredients: [
        Ingredients(amount: 8, unit: "", text: "kleine Tortillas"),
        Ingredients(amount: 200, unit: "g", text: "schwarze Bohnen (Dose)"),
        Ingredients(amount: 1, unit: "", text: "Avocado"),
        Ingredients(amount: 1, unit: "", text: "Tomate"),
        Ingredients(amount: 1, unit: "", text: "Zwiebel"),
        Ingredients(amount: 1, unit: "Handvoll", text: "Koriander"),
        Ingredients(amount: 2, unit: "EL", text: "Olivenöl"),
        Ingredients(amount: 1, unit: "", text: "Saft einer Limette"),
        Ingredients(amount: 0, unit: "", text: "Salz & Pfeffer"),
      ],
      preparations: [
          Preparation(title: "1. Step", preparationTexts: [         
           "Die Zwiebel & Tomate würfeln, die Avocado in Scheiben schneiden.",]),
            Preparation(title: "2. Step", preparationTexts: [
          "Die Bohnen in einer Pfanne mit Olivenöl erhitzen, mit Salz, Pfeffer & Limettensaft würzen.",]),
          Preparation(title: "3. Step", preparationTexts: [
          "Die Tortillas erwärmen & mit den Bohnen, Tomaten, Zwiebeln, Avocado & Koriander füllen.",]),
          Preparation(title: "4. Step", preparationTexts: [
          "Mit weiteren Gewürzen nach Belieben abschmecken & servieren.",
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
      category:"Low Carb",
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
         "Die Kartoffeln schälen & in Würfel schneiden. In einer Pfanne mit Olivenöl anbraten, bis sie goldbraun sind.",
          ]),
          Preparation(title: "2. Step", preparationTexts: [
          "Die Steaks in einer heißen Pfanne mit etwas Öl braten, mit Salz, Pfeffer & Rosmarin würzen.",
          ]),
          Preparation(title: "3. Step", preparationTexts: [
          "Die Steaks je nach gewünschter Garstufe braten.",
          ]),
          Preparation(title: "4. Step", preparationTexts: [
          "Die Kartoffeln & Steaks anrichten & optional mit etwas Butter servieren.",
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
      category: "Fast Food",
      ingredients: [
        Ingredients(amount: 2, unit: "", text: "Burgerbrötchen"),
        Ingredients(amount: 2, unit: "", text: "Rinderpattys"),
        Ingredients(amount: 2, unit: "", text: "Scheiben Käse"),
        Ingredients(amount: 1, unit: "", text: "Tomate"),
        Ingredients(amount: 1, unit: "", text: "Zwiebel"),
        Ingredients(amount: 1, unit: "Handvoll", text: "Salat"),
        Ingredients(amount: 0, unit: "", text: "Ketchup (optional)"),
        Ingredients(amount: 0, unit: "", text: "Senf (optional)"),
        Ingredients(amount: 0, unit: "", text: "Salz & Pfeffer"),
      ],
      preparations: [
        Preparation(title: "1. Step", preparationTexts: [          
          "Die Burgerbrötchen aufschneiden & leicht anrösten.",
          ]),
          Preparation(title: "2. Step", preparationTexts: [
          "Tomaten & Zwiebel in Scheiben schneiden.",
          ]),
          Preparation(title: "3. Step", preparationTexts: [
          "Die Rinderpattys in einer heißen Pfanne oder auf dem Grill braten.",
          ]),
          Preparation(title: "4. Step", preparationTexts: [
          "Die Patties nach Belieben mit Käse belegen & schmelzen lassen.",
          ]),
          Preparation(title: "5. Step", preparationTexts: [
          "Die Burgerbrötchen mit Ketchup & Senf bestreichen.",
          ]),
          Preparation(title: "6. Step", preparationTexts: [
          "Burgerbrötchen mit Salat, Tomaten, Zwiebel & den Patties belegen & servieren.",
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
    category: "Veggie",
    ingredients: [
      Ingredients(amount: 200, unit: "g", text: "Sushi-Reis"),
      Ingredients(amount: 1, unit: "", text: "Nori-Blatt"),
      Ingredients(amount: 100, unit: "g", text: "Lachs (alternativ Gemüse)"),
      Ingredients(amount: 1, unit: "", text: "Avocado"),
      Ingredients(amount: 1, unit: "", text: "Karotte"),
      Ingredients(amount: 2, unit: "EL", text: "Reisessig"),
      Ingredients(amount: 1, unit: "TL", text: "Zucker"),
      Ingredients(amount: 1-2, unit: "TL", text: "Salz"),
      Ingredients(amount: 0, unit: "", text: "Sojasauce (zum Servieren)"),
    ],
    preparations: [
      Preparation(title: "1. Step", preparationTexts: [
        "Sushi-Reis waschen & nach Packungsanleitung kochen. Reisessig mit Zucker & Salz vermischen & unter den Reis heben.",
      ]),
      Preparation(title: "2. Step", preparationTexts: [
        "Die Avocado & Karotte in feine Streifen schneiden, Lachs ebenfalls in dünne Streifen schneiden.",
      ]),
      Preparation(title: "3. Step", preparationTexts: [
        "Nori-Blatt auf eine Bambusmatte legen, mit einer dünnen Schicht Reis bedecken & mit Gemüse oder Lachs füllen.",
      ]),
      Preparation(title: "4. Step", preparationTexts: [
        "Das Sushi vorsichtig aufrollen & in m&gerechte Stücke schneiden.",
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
    category: "Veggie",
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
        "Spinat waschen & grob hacken. Zwiebel & Knoblauch in Olivenöl anbraten, Spinat dazugeben & zusammenfallen lassen.",
      ]),
      Preparation(title: "2. Step", preparationTexts: [
        "Feta-Käse zerbröseln & unter die Spinatmischung heben.",
      ]),
      Preparation(title: "3. Step", preparationTexts: [
        "Yufka-Blätter auf einem Blech ausbreiten, die Füllung darauf verteilen & einrollen. Mit Ei bestreichen.",
      ]),
      Preparation(title: "4. Step", preparationTexts: [
        "Im vorgeheizten Ofen bei 180°C ca. 25-30 Minuten goldbraun backen.",
      ]),
      Preparation(title: "5. Step", preparationTexts: [
        "In Stücke schneiden & servieren.",
      ]),
    ],
    portion: 1,
    tipp: null,
  ),
  Recipe(
    recipeName: "Fisch & Chips",
    imagePath: "assets/images/fishanchips.png",
    preparationTime: "30 Min",
    portionAmount: "2 Pers.",
    price: 16.98,
    category: "Fast Food",
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
        "Die Kartoffeln schälen & in Stifte schneiden. In heißem Öl frittieren, bis sie goldbraun sind.",
      ]),
      Preparation(title: "2. Step", preparationTexts: [
        "Mehl, Backpulver, Bier, Ei, Salz & Pfeffer zu einem glatten Teig verrühren.",
      ]),
      Preparation(title: "3. Step", preparationTexts: [
        "Die Kabeljaufilets durch den Teig ziehen & in heißem Öl frittieren, bis sie knusprig & goldbraun sind.",
      ]),
      Preparation(title: "4. Step", preparationTexts: [
        "Die Fischfilets & Pommes auf einem Teller anrichten & mit Zitronenspalten servieren.",
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
    category: " Fast Food",
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
        "Zwiebel & Knoblauch fein hacken & in Olivenöl anbraten. Hackfleisch dazugeben & krümelig braten.",
      ]),
      Preparation(title: "2. Step", preparationTexts: [
        "Tomaten, Tomatenmark, Oregano, Basilikum, Salz & Pfeffer hinzufügen & köcheln lassen.",
      ]),
      Preparation(title: "3. Step", preparationTexts: [
        "Eine Auflaufform mit Lasagneblättern auslegen, eine Schicht Hackfleischsauce & Bechamelsauce darauf verteilen. Mit Mozzarella bestreuen.",
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
  // Recipe(
  //   recipeName: "Souffle",
  //   imagePath: "assets/images/lecker1111.png",
  //   preparationTime: "30 Min",
  //   portionAmount: "2 Pers.",
  //   price: 12.00,
  //   category: "Dessert",
  //   ingredients: [
  //     Ingredients(amount: 100, unit: "g", text: "Zartbitterschokolade"),
  //     Ingredients(amount: 50, unit: "g", text: "Butter"),
  //     Ingredients(amount: 2, unit: "", text: "Eier"),
  //     Ingredients(amount: 50, unit: "g", text: "Zucker"),
  //     Ingredients(amount: 1, unit: "EL", text: "Mehl"),
  //     Ingredients(amount: 1, unit: "Prise", text: "Salz"),
  //     Ingredients(amount: 0, unit: "", text: "Puderzucker (zum Bestäuben)"),
  //   ],
  //   preparations: [
  //     Preparation(title: "1. Step", preparationTexts: [
  //       "Schokolade & Butter im Wasserbad schmelzen.",
  //     ]),
  //     Preparation(title: "2. Step", preparationTexts: [
  //       "Eier trennen, Eigelb mit Zucker schaumig schlagen. Geschmolzene Schokolade unterrühren.",
  //     ]),
  //     Preparation(title: "3. Step", preparationTexts: [
  //       "Eiweiß mit einer Prise Salz steif schlagen & unter die Schokoladenmasse heben.",
  //     ]),
  //     Preparation(title: "4. Step", preparationTexts: [
  //       "Förmchen mit Butter einfetten & mit Mehl bestäuben. Teig einfüllen.",
  //     ]),
  //     Preparation(title: "5. Step", preparationTexts: [
  //       "Im vorgeheizten Ofen bei 180°C ca. 12-15 Minuten backen, bis das Soufflé aufgegangen ist.",
  //     ]),
  //     Preparation(title: "6. Step", preparationTexts: [
  //       "Mit Puderzucker bestäuben & sofort servieren.",
  //     ]),
  //   ],
  //   portion: 1,
  //   tipp: null,
  // ),
  Recipe(
    recipeName: "Kartoffelgratin",
    imagePath: "assets/images/gratin.png",
    preparationTime: "30 Min",
    portionAmount: "2 Pers.",
    price: 19.00,
    category: "Veggie",
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
        "Die Kartoffeln schälen & in dünne Scheiben schneiden.",
      ]),
      Preparation(title: "2. Step", preparationTexts: [
        "Knoblauch fein hacken & mit Sahne, Salz, Pfeffer & Muskatnuss vermischen.",
      ]),
      Preparation(title: "3. Step", preparationTexts: [
        "Eine Auflaufform mit Butter einfetten, die Kartoffelscheiben schichtweise einlegen & mit der Sahnemischung übergießen.",
      ]),
      Preparation(title: "4. Step", preparationTexts: [
        "Mit geriebenem Käse bestreuen & im vorgeheizten Ofen bei 180°C ca. 40-45 Minuten backen, bis das Gratin goldbraun ist.",
      ]),
    ],
    portion: 1,
    tipp: null,
  ),
  Recipe(
    recipeName: "Chicken Salat",
    imagePath: "assets/images/chickensalad.png",
    preparationTime: "20 Min",
    portionAmount: "2 Pers.",
    price: 10.00,
    category: "Low Carb",
    ingredients: [
      Ingredients(amount: 200, unit: "g", text: "Hähnchenbrust"),
      Ingredients(amount: 100, unit: "g", text: "Salatmix"),
      Ingredients(amount: 1, unit: "", text: "Avocado"),
      Ingredients(amount: 1, unit: "", text: "Tomate"),
      Ingredients(amount: 50, unit: "g", text: "Feta-Käse"),
      Ingredients(amount: 2, unit: "EL", text: "Olivenöl"),
      Ingredients(amount: 1, unit: "EL", text: "Zitronensaft"),
      Ingredients(amount: 1, unit: "Prise", text: "Salz"),
      Ingredients(amount: 1, unit: "Prise", text: "Pfeffer"),
    ],
    preparations: [
      Preparation(title: "1. Step", preparationTexts: [
        "Hähnchenbrust in Streifen schneiden & in einer Pfanne mit Olivenöl anbraten.",
      ]),
      Preparation(title: "2. Step", preparationTexts: [
        "Salatmix, Avocado, Tomate & Feta-Käse in einer Schüssel vermengen.",
      ]),
      Preparation(title: "3. Step", preparationTexts: [
        "Hähnchenstreifen hinzufügen & mit Olivenöl, Zitronensaft, Salz & Pfeffer abschmecken.",
      ]),
      Preparation(title: "4. Step", preparationTexts: [
        "Gut vermengen & servieren.",
      ]),
    ],
    portion: 1,
    tipp: "Für extra Geschmack etwas Balsamico-Essig hinzufügen.",
  ),
  Recipe(
    recipeName: "Chicken Wings",
    imagePath: "assets/images/chickenwings.png",
    preparationTime: "30 Min",
    portionAmount: "2 Pers.",
    price: 12.00,
    category: "Fast Food",
    ingredients: [
      Ingredients(amount: 500, unit: "g", text: "Hähnchenflügel"),
      Ingredients(amount: 2, unit: "EL", text: "Olivenöl"),
      Ingredients(amount: 1, unit: "TL", text: "Paprikapulver"),
      Ingredients(amount: 1, unit: "TL", text: "Knoblauchpulver"),
      Ingredients(amount: 1, unit: "TL", text: "Zwiebelpulver"),
      Ingredients(amount: 1, unit: "Prise", text: "Salz"),
      Ingredients(amount: 1, unit: "Prise", text: "Pfeffer"),
      Ingredients(amount: 100, unit: "ml", text: "BBQ-Sauce"),
    ],
    preparations: [
      Preparation(title: "1. Step", preparationTexts: [
        "Hähnchenflügel mit Olivenöl, Paprikapulver, Knoblauchpulver, Zwiebelpulver, Salz & Pfeffer marinieren.",
      ]),
      Preparation(title: "2. Step", preparationTexts: [
        "Im vorgeheizten Ofen bei 200°C ca. 25 Minuten backen.",
      ]),
      Preparation(title: "3. Step", preparationTexts: [
        "Mit BBQ-Sauce bestreichen & weitere 5 Minuten backen.",
      ]),
      Preparation(title: "4. Step", preparationTexts: [
        "Heiß servieren.",
      ]),
    ],
    portion: 1,
    tipp: "Mit frischen Kräutern garnieren.",
  ),
  Recipe(
    recipeName: "Pumpkin Suppe",
    imagePath: "assets/images/pumpkin_soup.png",
    preparationTime: "40 Min",
    portionAmount: "2 Pers.",
    price: 8.00,
    category: "Low Carb",
    ingredients: [
      Ingredients(amount: 500, unit: "g", text: "Kürbis"),
      Ingredients(amount: 1, unit: "", text: "Zwiebel"),
      Ingredients(amount: 2, unit: "", text: "Knoblauchzehen"),
      Ingredients(amount: 500, unit: "ml", text: "Gemüsebrühe"),
      Ingredients(amount: 200, unit: "ml", text: "Kokosmilch"),
      Ingredients(amount: 1, unit: "TL", text: "Ingwer (gerieben)"),
      Ingredients(amount: 1, unit: "Prise", text: "Salz"),
      Ingredients(amount: 1, unit: "Prise", text: "Pfeffer"),
      Ingredients(amount: 1, unit: "EL", text: "Olivenöl"),
    ],
    preparations: [
      Preparation(title: "1. Step", preparationTexts: [
        "Kürbis schälen & würfeln. Zwiebel & Knoblauch hacken.",
      ]),
      Preparation(title: "2. Step", preparationTexts: [
        "Zwiebel & Knoblauch in Olivenöl anbraten. Kürbis hinzufügen & kurz mitbraten.",
      ]),
      Preparation(title: "3. Step", preparationTexts: [
        "Mit Gemüsebrühe ablöschen & ca. 20 Minuten köcheln lassen.",
      ]),
      Preparation(title: "4. Step", preparationTexts: [
        "Kokosmilch & Ingwer hinzufügen & pürieren. Mit Salz & Pfeffer abschmecken.",
      ]),
      Preparation(title: "5. Step", preparationTexts: [
        "Heiß servieren.",
      ]),
    ],
    portion: 1,
    tipp: "Mit Kürbiskernen & frischen Kräutern garnieren.",
  ),
  Recipe(
    recipeName: "Schokoladenkuchen",
    imagePath: "assets/images/schokokuchen.png",
    preparationTime: "45 Min",
    portionAmount: "8 Pers.",
    price: 20.00,
    category: "Dessert",
    ingredients: [
      Ingredients(amount: 200, unit: "g", text: "Zartbitterschokolade"),
      Ingredients(amount: 200, unit: "g", text: "Butter"),
      Ingredients(amount: 200, unit: "g", text: "Zucker"),
      Ingredients(amount: 4, unit: "", text: "Eier"),
      Ingredients(amount: 100, unit: "g", text: "Mehl"),
      Ingredients(amount: 1, unit: "TL", text: "Backpulver"),
      Ingredients(amount: 1, unit: "Prise", text: "Salz"),
    ],
    preparations: [
      Preparation(title: "1. Step", preparationTexts: [
        "Schokolade & Butter im Wasserbad schmelzen.",
      ]),
      Preparation(title: "2. Step", preparationTexts: [
        "Eier & Zucker schaumig schlagen, geschmolzene Schokolade unterrühren.",
      ]),
      Preparation(title: "3. Step", preparationTexts: [
        "Mehl, Backpulver & Salz unterheben.",
      ]),
      Preparation(title: "4. Step", preparationTexts: [
        "Teig in eine gefettete Form füllen & bei 180°C ca. 25-30 Minuten backen.",
      ]),
    ],
    portion: 1,
    tipp: "Mit Puderzucker bestäuben & servieren.",
  ),
  Recipe(
    recipeName: "Erdbeer-Tiramisu",
    imagePath: "assets/images/erdbeer_tiramisu.png",
    preparationTime: "30 Min",
    portionAmount: "6 Pers.",
    price: 15.00,
    category: "Dessert",
    ingredients: [
      Ingredients(amount: 500, unit: "g", text: "Erdbeeren"),
      Ingredients(amount: 250, unit: "g", text: "Mascarpone"),
      Ingredients(amount: 200, unit: "ml", text: "Sahne"),
      Ingredients(amount: 100, unit: "g", text: "Zucker"),
      Ingredients(amount: 1, unit: "Packung", text: "Löffelbiskuits"),
      Ingredients(amount: 100, unit: "ml", text: "Orangensaft"),
    ],
    preparations: [
      Preparation(title: "1. Step", preparationTexts: [
        "Erdbeeren waschen & in Scheiben schneiden.",
      ]),
      Preparation(title: "2. Step", preparationTexts: [
        "Mascarpone, Sahne & Zucker verrühren.",
      ]),
      Preparation(title: "3. Step", preparationTexts: [
        "Löffelbiskuits in Orangensaft tauchen & in eine Form schichten.",
      ]),
      Preparation(title: "4. Step", preparationTexts: [
        "Mascarponecreme & Erdbeeren darauf verteilen, Schichten wiederholen.",
      ]),
    ],
    portion: 1,
    tipp: "Mit Kakaopulver bestäuben & kalt servieren.",
  ),
  Recipe(
    recipeName: "Panna Cotta",
    imagePath: "assets/images/panna_cotta.png",
    preparationTime: "20 Min",
    portionAmount: "4 Pers.",
    price: 10.00,
    category: "Dessert",
    ingredients: [
      Ingredients(amount: 500, unit: "ml", text: "Sahne"),
      Ingredients(amount: 100, unit: "g", text: "Zucker"),
      Ingredients(amount: 1, unit: "Stange", text: "Vanille"),
      Ingredients(amount: 4, unit: "Blatt", text: "Gelatine"),
      Ingredients(amount: 200, unit: "g", text: "Beeren (zum Servieren)"),
    ],
    preparations: [
      Preparation(title: "1. Step", preparationTexts: [
        "Sahne, Zucker & Vanille in einem Topf erhitzen.",
      ]),
      Preparation(title: "2. Step", preparationTexts: [
        "Gelatine in kaltem Wasser einweichen, ausdrücken & in der heißen Sahne auflösen.",
      ]),
      Preparation(title: "3. Step", preparationTexts: [
        "In Förmchen füllen & im Kühlschrank fest werden lassen.",
      ]),
      Preparation(title: "4. Step", preparationTexts: [
        "Mit Beeren servieren.",
      ]),
    ],
    portion: 1,
    tipp: "Mit Minzblättern garnieren.",
  ),
  Recipe(
    recipeName: "Gemüsepfanne",
    imagePath: "assets/images/gemuse_pfanne.png",
    preparationTime: "20 Min",
    portionAmount: "2 Pers.",
    price: 8.00,
    category: "Veggie",
    ingredients: [
      Ingredients(amount: 1, unit: "", text: "Zucchini"),
      Ingredients(amount: 1, unit: "", text: "Paprika"),
      Ingredients(amount: 1, unit: "", text: "Karotte"),
      Ingredients(amount: 1, unit: "", text: "Zwiebel"),
      Ingredients(amount: 2, unit: "EL", text: "Sojasauce"),
      Ingredients(amount: 1, unit: "EL", text: "Olivenöl"),
      Ingredients(amount: 1, unit: "Prise", text: "Salz"),
      Ingredients(amount: 1, unit: "Prise", text: "Pfeffer"),
    ],
    preparations: [
      Preparation(title: "1. Step", preparationTexts: [
        "Gemüse waschen & in Streifen schneiden.",
      ]),
      Preparation(title: "2. Step", preparationTexts: [
        "Olivenöl in einer Pfanne erhitzen, Gemüse darin anbraten.",
      ]),
      Preparation(title: "3. Step", preparationTexts: [
        "Mit Sojasauce ablöschen & mit Salz & Pfeffer abschmecken.",
      ]),
      Preparation(title: "4. Step", preparationTexts: [
        "Heiß servieren.",
      ]),
    ],
    portion: 1,
    tipp: "Mit Sesam bestreuen.",
  ),
  Recipe(
    recipeName: "Auberginenauflauf",
    imagePath: "assets/images/auberginenauflauf.png",
    preparationTime: "40 Min",
    portionAmount: "4 Pers.",
    price: 12.00,
    category: "Veggie",
    ingredients: [
      Ingredients(amount: 2, unit: "", text: "Auberginen"),
      Ingredients(amount: 1, unit: "", text: "Zwiebel"),
      Ingredients(amount: 2, unit: "", text: "Knoblauchzehen"),
      Ingredients(amount: 400, unit: "g", text: "Tomaten (gehackt)"),
      Ingredients(amount: 200, unit: "g", text: "Mozzarella"),
      Ingredients(amount: 2, unit: "EL", text: "Olivenöl"),
      Ingredients(amount: 1, unit: "TL", text: "Oregano"),
      Ingredients(amount: 1, unit: "Prise", text: "Salz"),
      Ingredients(amount: 1, unit: "Prise", text: "Pfeffer"),
    ],
    preparations: [
      Preparation(title: "1. Step", preparationTexts: [
        "Auberginen in Scheiben schneiden & salzen, 10 Minuten ziehen lassen.",
      ]),
      Preparation(title: "2. Step", preparationTexts: [
        "Zwiebel & Knoblauch hacken & in Olivenöl anbraten.",
      ]),
      Preparation(title: "3. Step", preparationTexts: [
        "Tomaten hinzufügen & köcheln lassen, mit Oregano, Salz & Pfeffer abschmecken.",
      ]),
      Preparation(title: "4. Step", preparationTexts: [
        "Auberginenscheiben abtupfen & in einer Pfanne anbraten.",
      ]),
      Preparation(title: "5. Step", preparationTexts: [
        "Auberginen & Tomatensauce in eine Auflaufform schichten, mit Mozzarella belegen.",
      ]),
      Preparation(title: "6. Step", preparationTexts: [
        "Im vorgeheizten Ofen bei 180°C ca. 25-30 Minuten backen.",
      ]),
    ],
    portion: 1,
    tipp: "Mit frischem Basilikum garnieren.",
  ),
  Recipe(
    recipeName: "Quinoa-Salat",
    imagePath: "assets/images/quino.png",
    preparationTime: "20 Min",
    portionAmount: "2 Pers.",
    price: 10.00,
    category: "Veggie",
    ingredients: [
      Ingredients(amount: 200, unit: "g", text: "Quinoa"),
      Ingredients(amount: 1, unit: "", text: "Gurke"),
      Ingredients(amount: 1, unit: "", text: "Paprika"),
      Ingredients(amount: 1, unit: "", text: "Avocado"),
      Ingredients(amount: 1, unit: "Handvoll", text: "Petersilie"),
      Ingredients(amount: 2, unit: "EL", text: "Olivenöl"),
      Ingredients(amount: 1, unit: "EL", text: "Zitronensaft"),
      Ingredients(amount: 1, unit: "Prise", text: "Salz"),
      Ingredients(amount: 1, unit: "Prise", text: "Pfeffer"),
    ],
    preparations: [
      Preparation(title: "1. Step", preparationTexts: [
        "Quinoa nach Packungsanleitung kochen & abkühlen lassen.",
      ]),
      Preparation(title: "2. Step", preparationTexts: [
        "Gurke, Paprika & Avocado würfeln, Petersilie hacken.",
      ]),
      Preparation(title: "3. Step", preparationTexts: [
        "Quinoa & Gemüse in einer Schüssel vermengen.",
      ]),
      Preparation(title: "4. Step", preparationTexts: [
        "Mit Olivenöl, Zitronensaft, Salz & Pfeffer abschmecken.",
      ]),
      Preparation(title: "5. Step", preparationTexts: [
        "Gut vermengen & servieren.",
      ]),
    ],
    portion: 1,
    tipp: "Mit Feta-Käse bestreuen.",
  ),
  Recipe(
    recipeName: "Zoodles mit Pesto",
    imagePath: "assets/images/zoodles_pesto.png",
    preparationTime: "15 Min",
    portionAmount: "2 Pers.",
    price: 8.00,
    category: "Low Carb",
    ingredients: [
      Ingredients(amount: 2, unit: "", text: "Zucchini"),
      Ingredients(amount: 50, unit: "g", text: "Basilikum"),
      Ingredients(amount: 30, unit: "g", text: "Parmesan"),
      Ingredients(amount: 30, unit: "g", text: "Pinienkerne"),
      Ingredients(amount: 1, unit: "Zehe", text: "Knoblauch"),
      Ingredients(amount: 50, unit: "ml", text: "Olivenöl"),
      Ingredients(amount: 1, unit: "Prise", text: "Salz"),
      Ingredients(amount: 1, unit: "Prise", text: "Pfeffer"),
    ],
    preparations: [
      Preparation(title: "1. Step", preparationTexts: [
        "Zucchini mit einem Spiralschneider in Zoodles schneiden.",
      ]),
      Preparation(title: "2. Step", preparationTexts: [
        "Basilikum, Parmesan, Pinienkerne, Knoblauch & Olivenöl in einem Mixer zu Pesto verarbeiten.",
      ]),
      Preparation(title: "3. Step", preparationTexts: [
        "Zoodles in einer Pfanne kurz anbraten.",
      ]),
      Preparation(title: "4. Step", preparationTexts: [
        "Mit Pesto vermengen & mit Salz & Pfeffer abschmecken.",
      ]),
      Preparation(title: "5. Step", preparationTexts: [
        "Heiß servieren.",
      ]),
    ],
    portion: 1,
    tipp: "Mit gerösteten Pinienkernen bestreuen.",
  ),
  Recipe(
    recipeName: "Blumenkohlreis",
    imagePath: "assets/images/blumenkohl.png",
    preparationTime: "20 Min",
    portionAmount: "2 Pers.",
    price: 6.00,
    category: "Low Carb",
    ingredients: [
      Ingredients(amount: 1, unit: "", text: "Blumenkohl"),
      Ingredients(amount: 1, unit: "", text: "Zwiebel"),
      Ingredients(amount: 2, unit: "EL", text: "Olivenöl"),
      Ingredients(amount: 1, unit: "Prise", text: "Salz"),
      Ingredients(amount: 1, unit: "Prise", text: "Pfeffer"),
      Ingredients(amount: 1, unit: "Prise", text: "Kurkuma"),
    ],
    preparations: [
      Preparation(title: "1. Step", preparationTexts: [
        "Blumenkohl in Röschen teilen & in einer Küchenmaschine zu Reis verarbeiten.",
      ]),
      Preparation(title: "2. Step", preparationTexts: [
        "Zwiebel hacken & in Olivenöl anbraten.",
      ]),
      Preparation(title: "3. Step", preparationTexts: [
        "Blumenkohlreis hinzufügen & kurz mitbraten.",
      ]),
      Preparation(title: "4. Step", preparationTexts: [
        "Mit Salz, Pfeffer & Kurkuma abschmecken.",
      ]),
      Preparation(title: "5. Step", preparationTexts: [
        "Heiß servieren.",
      ]),
    ],
    portion: 1,
    tipp: "Mit frischen Kräutern garnieren.",
  ),
  Recipe(
    recipeName: "Gefüllte Paprika",
    imagePath: "assets/images/dolma.png",
    preparationTime: "30 Min",
    portionAmount: "2 Pers.",
    price: 10.00,
    category: "Low Carb",
    ingredients: [
      Ingredients(amount: 2, unit: "", text: "Paprika"),
      Ingredients(amount: 200, unit: "g", text: "Hackfleisch"),
      Ingredients(amount: 1, unit: "", text: "Zwiebel"),
      Ingredients(amount: 2, unit: "", text: "Knoblauchzehen"),
      Ingredients(amount: 1, unit: "Dose", text: "Tomaten (gehackt)"),
      Ingredients(amount: 1, unit: "TL", text: "Oregano"),
      Ingredients(amount: 1, unit: "Prise", text: "Salz"),
      Ingredients(amount: 1, unit: "Prise", text: "Pfeffer"),
      Ingredients(amount: 2, unit: "EL", text: "Olivenöl"),
    ],
    preparations: [
      Preparation(title: "1. Step", preparationTexts: [
        "Paprika halbieren & entkernen.",
      ]),
      Preparation(title: "2. Step", preparationTexts: [
        "Zwiebel & Knoblauch hacken & in Olivenöl anbraten.",
      ]),
      Preparation(title: "3. Step", preparationTexts: [
        "Hackfleisch hinzufügen & krümelig braten.",
      ]),
      Preparation(title: "4. Step", preparationTexts: [
        "Tomaten & Gewürze hinzufügen & köcheln lassen.",
      ]),
      Preparation(title: "5. Step", preparationTexts: [
        "Paprikahälften mit der Hackfleischmischung füllen & im vorgeheizten Ofen bei 180°C ca. 20 Minuten backen.",
      ]),
    ],
    portion: 1,
    tipp: "Mit geriebenem Käse bestreuen.",
  ),
  Recipe(
    recipeName: "Hot Dogs",
    imagePath: "assets/images/hotdog.png",
    preparationTime: "15 Min",
    portionAmount: "2 Pers.",
    price: 8.00,
    category: "Fast Food",
    ingredients: [
      Ingredients(amount: 2, unit: "", text: "Hot Dog Brötchen"),
      Ingredients(amount: 2, unit: "", text: "Würstchen"),
      Ingredients(amount: 1, unit: "", text: "Zwiebel"),
      Ingredients(amount: 1, unit: "", text: "Gurke"),
      Ingredients(amount: 1, unit: "EL", text: "Senf"),
      Ingredients(amount: 1, unit: "EL", text: "Ketchup"),
      Ingredients(amount: 1, unit: "Prise", text: "Salz"),
      Ingredients(amount: 1, unit: "Prise", text: "Pfeffer"),
    ],
    preparations: [
      Preparation(title: "1. Step", preparationTexts: [
        "Würstchen in heißem Wasser erhitzen.",
      ]),
      Preparation(title: "2. Step", preparationTexts: [
        "Zwiebel & Gurke in Scheiben schneiden.",
      ]),
      Preparation(title: "3. Step", preparationTexts: [
        "Hot Dog Brötchen aufschneiden & mit Senf & Ketchup bestreichen.",
      ]),
      Preparation(title: "4. Step", preparationTexts: [
        "Würstchen in die Brötchen legen & mit Zwiebel & Gurke belegen.",
      ]),
      Preparation(title: "5. Step", preparationTexts: [
        "Mit Salz & Pfeffer abschmecken.",
      ]),
    ],
    portion: 1,
    tipp: "Mit Röstzwiebeln bestreuen.",
  ),
  Recipe(
    recipeName: "Pommes Frites",
    imagePath: "assets/images/pommes.png",
    preparationTime: "30 Min",
    portionAmount: "2 Pers.",
    price: 5.00,
    category: "Fast Food",
    ingredients: [
      Ingredients(amount: 500, unit: "g", text: "Kartoffeln"),
      Ingredients(amount: 1, unit: "EL", text: "Olivenöl"),
      Ingredients(amount: 1, unit: "Prise", text: "Salz"),
      Ingredients(amount: 1, unit: "Prise", text: "Pfeffer"),
      Ingredients(amount: 1, unit: "Prise", text: "Paprikapulver"),
    ],
    preparations: [
      Preparation(title: "1. Step", preparationTexts: [
        "Kartoffeln schälen & in Stifte schneiden.",
      ]),
      Preparation(title: "2. Step", preparationTexts: [
        "Kartoffelstifte in einer Schüssel mit Olivenöl, Salz, Pfeffer & Paprikapulver vermengen.",
      ]),
      Preparation(title: "3. Step", preparationTexts: [
        "Auf einem Backblech verteilen & im vorgeheizten Ofen bei 200°C ca. 25-30 Minuten backen.",
      ]),
      Preparation(title: "4. Step", preparationTexts: [
        "Heiß servieren.",
      ]),
    ],
    portion: 1,
    tipp: "Mit Ketchup oder Mayonnaise servieren.",
  ),
  Recipe(
    recipeName: "Chicken Nuggets",
    imagePath: "assets/images/nugetts.png",
    preparationTime: "20 Min",
    portionAmount: "2 Pers.",
    price: 10.00,
    category: "Fast Food",
    ingredients: [
      Ingredients(amount: 300, unit: "g", text: "Hähnchenbrust"),
      Ingredients(amount: 100, unit: "g", text: "Mehl"),
      Ingredients(amount: 2, unit: "", text: "Eier"),
      Ingredients(amount: 100, unit: "g", text: "Paniermehl"),
      Ingredients(amount: 1, unit: "Prise", text: "Salz"),
      Ingredients(amount: 1, unit: "Prise", text: "Pfeffer"),
      Ingredients(amount: 0, unit: "", text: "Öl zum Frittieren"),
    ],
    preparations: [
      Preparation(title: "1. Step", preparationTexts: [
        "Hähnchenbrust in m&gerechte Stücke schneiden.",
      ]),
      Preparation(title: "2. Step", preparationTexts: [
        "Mehl, Eier & Paniermehl jeweils in separate Schalen geben.",
      ]),
      Preparation(title: "3. Step", preparationTexts: [
        "Hähnchenstücke zuerst in Mehl, dann in Ei & schließlich in Paniermehl wenden.",
      ]),
      Preparation(title: "4. Step", preparationTexts: [
        "In heißem Öl frittieren, bis sie goldbraun sind.",
      ]),
      Preparation(title: "5. Step", preparationTexts: [
        "Heiß servieren.",
      ]),
    ],
    portion: 1,
    tipp: "Mit BBQ-Sauce oder Ketchup servieren.",
  ),
];
