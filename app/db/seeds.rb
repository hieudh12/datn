# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Admin.create(
  email: 'admin@example.com',
  password: '123456'
)

User.create([
  {
    username: 'user123',
    email: '123@abc.com',
    password: '123456'
  },
  {
    username: 'user1234',
    email: '1234@abc.com',
    password: '123456'
  }
])

# Seed categories
categories = Category.create([
  {
    name: 'Heathy food',
    description: 'Good for your heath'
  },
  {
    name: 'Meaty food',
    description: 'For meat lovers'
  },
  {
    name: 'Vegan food',
    description: 'Vegetarians'
  },
  {
    name: 'Beef dish',
    description: 'Best beef dishes ever'
  },
  {
    name: 'Pork dish',
    description: 'Best pork dishes ever'
  },
])

# Seed recipes
categories.each do |category|
  recipes = Recipe.create([
    {
      name: 'PEPPER POPPER SLIDERS',
      time_to_cook: 0.75,
      energy: 2000,
      recipe: 'Bake rolls following directions on package. In a small bowl, combine peppers, bacon and cream cheese. Mix well. In a large bowl, combine garlic, salt and pepper. Crumble beef over garlic mixture and mix well. Shape into twelve 3 to 4-inch patties. Spoon pepper mixture onto center of six patties. Top with remaining patties and press edges firmly to seal. Grill burgers and top with cheese. Split rolls and fill with burgers, tomato, lettuce and guacamole.',
      is_premium: true,
      category: category
    },
    {
      name: 'GRANNYS BANANA CREAM PIE',
      time_to_cook: 1,
      energy: 3000,
      recipe: 'In a saucepan, combine sugar, flour, and salt; stir in milk and mix well. Cook over medium heat, stirring constantly, until the mixture thickens and comes to a boil; boil for 2 minutes. Remove from the heat. Stir a small amount of cream mixture into egg yolks; return all to saucepan. Cook for 2 minutes, stirring constantly; remove from the heat. Add butter and vanilla; mix well; allow to cool slightly. Slice the bananas and place evenly in pastry shell; pour cream mixture over bananas. Cool; before serving, garnish with whipped cream or Cool Whip and bananas. Refrigerate any leftovers.',
      is_premium: true,
      category: category
    },
    {
      name: 'BETTER THAN OLIVE GARDEN ALFREDO SAUCE',
      time_to_cook: 0.25,
      energy: 1500,
      recipe: 'Melt butter in medium saucepan with olive oil over medium/low heat. Add the garlic, cream, white pepper and bring mixture to a simmer.Stir often.Add the Parmesan cheese and simmer sauce for 8-10 minutes or until sauce has thickened and is smooth.When sauce has thickened add the Mozzarella cheese and stir until smooth. STIR FREQUENTLY.While the sauce cooks, boil noodles for 3-5 minutes. Place pasta on serving plates and spoon sauce over pasta. Garnish with parsley, freshly cracked black pepper and more grated parmesan (optional).',
      is_premium: true,
      category: category
    },
    {
      name: 'CHRISTINAS KILLER DIP',
      time_to_cook: 0.5,
      energy: 2000,
      recipe: 'Defrost the spinach. Place it in a colander and press it until as much moisture as possible is removed. Mix all ingredients (1/2 of the cheddar), and blend well. Put it in a shallow baking dish (stoneware works best) in the oven for 20 minutes at 350°F. Remove from oven. While still hot top it with remaining cheese, heat in oven again for 5 minutes. Remove and cool below lava stage and serve. Goes well with tortilla chips.',
      is_premium: false,
      category: category
    },
    {
      name: 'MANHATTAN MEATBALLS',
      time_to_cook: 1.5,
      energy: 2000,
      recipe: 'Combine meat, crumbs, onion, eggs, parsley and salt; mix lightly. Shape into approimately 18 meatballs. Brown in margarine; drain. Place in casserole dish. Combine preserves and barbecue sauce; pour over meatballs. Bake at 350 degrees for 45 minutes.',
      is_premium: true,
      category: category
    },
    {
      name: 'CRANBERRY SAUCE MOSCOW MULES',
      time_to_cook: 0.5,
      energy: 1000,
      recipe: 'Fill a cocktail shaker halfway with ice. Pour in the cranberry sauce, lime juice, honey, and vodka. Cover and shake vigorously until well combined and chilled through. Divide among four short glasses filled with ice. Top each off with ginger beer and then garnish with fresh cranberries, a cinnamon stick and a lime wedge!',
      is_premium: false,
      category: category
    },
    {
      name: 'PEANUT BUTTER CHOCOLATE PIE',
      time_to_cook: 0.5,
      energy: 2000,
      recipe: 'In a large bowl beat cream cheese until smooth. Add peanut butter and 1 cup of the sugar. Beat until well blended. In a small bowl beat 1/2 cup of whipping cream until soft peaks form. Gradually beat in remaining 1/4 cup sugar and vanilla. Slowly fold cream mixture into peanut butter mixture. Pour into cooled pie shell. For the topping-in a double boiler over hot but not boiling water melt chocolate and cream together, whisking until smooth. Cool to luke warm and then pour over pie. You may need to rock the pie back and forth to get even coverage. One inch in from the edge form a circle with the chopped nuts and then chill for at least 2 hours. Once topping has set you can cover with plastic wrap. You can freeze this pie for storage or for a frozen summer treat.',
      is_premium: true,
      category: category
    },
    {
      name: 'THANKSGIVING PUMPKIN PIE',
      time_to_cook: 1.5,
      energy: 3000,
      recipe: 'Preheat oven to 400°F and have ready a pie shield and a large rimmed cookie sheet. Line a DEEP DISH glass pie plate with the pie pastry round, fluting the edges decoratively as desired. Combine in order the pumpkin, sugar, salt, cinnamon, ginger, nutmeg, and cloves. Lightly beat eggs together with both milks, then add to the pumpkin mixture, stirring well to combine--it will be rather thin. Pour as much filling as you can into unbaked pie pastry and bake at 400°F for 50 minutes (or until knife inserted halfway between center and edge comes out without any goo on it). If there is any extra filling use to fill a smaller mini pie plate or discard.',
      is_premium: true,
      category: category
    },
    {
      name: 'DUTCH APPLE PIE',
      time_to_cook: 1,
      energy: 1500,
      recipe: 'Preheat oven to 375°F. Fit pie crust into pie plate. In a large bowl, mix sliced apples, lemon juice, both sugars,flour, cinnamon and nutmeg. Pile into crust. Prepare topping: In a medium bowl, with a pastry blender or a fork, mix flour, both sugars, and butter until coarsely crumbled. Sprinkle evenly over apples. Bake at 375°F for 50 minutes.',
      is_premium: true,
      category: category
    },
    {
      name: 'SWEET POTATO PIE',
      time_to_cook: 1.5,
      energy: 2000,
      recipe: 'In a mixing bowl, cream butter and sugar. Add eggs; mix well. Add milk, sweet potatoes, vanilla, cinnamon, nutmeg, and salt; mix well. Pour into pie shell. Bake at 425 degrees for 15 minutes. Reduce heat to 350 degrees; bake 35-40 minutes longer or until pie tests done. Cool; Store in refrigerator.',
      is_premium: false,
      category: category
    },
    {
      name: 'BROWNED BUTTER PECAN PIE',
      time_to_cook: 1.5,
      energy: 2000,
	  recipe: 'Preheat oven to 425 degrees. Brown butter in saucepan until golden brown. Do not burn. Let cool. Mix all ingredients in order listed and mix well. Add browned butter and blend well. Pour in unbaked pie shell and bake at 425 degrees for 10 minutes. Lower oven to 325 degrees and bake an additional 40 minutes.',
      is_premium: false,
      category: category
    },
    {
    	name: 'BEEF STEW WITH MUSTARD DUMPLINGS',
    	time_to_cook: 2.5,
    	energy: 5000,
    	recipe: 'Heat the oil in a large heavy stock pot. Roll the meat in the flour and shake off the excess. Brown the meat in the pot. While the meat is browning, mix the tomato sauce, stock, and the herbs and spices together in a bowl. Once the meat has browned, arrange the onions and carrots over the meat and add the stock mixture. Partially cover the pot and simmer gently for about 2 hours. While the stew is simmering, make the dumpling dough. Sift together the flour and baking powder. Add the spices. In a separate bowl, add the milk to the beaten egg, then stir into the flour mixture. Add the melted butter and stir to blend. The dough should be soft but not sticky. On a lightly floured surface, roll out the dough to about a 1/4 inch thickness and cut with a very small circular cutter (like a doughnut hole cutter). Once the stew has simmered for 2 hours, drop the dumplings into the stew, cover and simmer for 10 minutes, then serve.',
    	is_premium: true,
    	category: category
    },
    {
    	name: 'EASY GRANDS CHEESE PIZZAS',
    	time_to_cook: 0.5,
    	energy: 1000,
    	recipe: 'Heat oven to 375 degrees. Press each biscuit to 6-inch round and place on greased cookie sheets. Top with pizza sauce, cheese and whatever toppings you like. Bake 10-15 minutes.',
    	is_premium: true,
    	category: category
    },
    {
    	name: 'SMOKEY SLOW COOKER CHILI',
    	time_to_cook: 5,
    	energy: 4000,
    	recipe: '1. Heat a large nonstick skillet over medium-high heat. Coat pan with cooking spray. Add ground pork to pan; cook 5 minutes or until browned, stirring to slightly crumble. Drain well. Transfer pork to an electric slow cooker. 2. Recoat pan with cooking spray. Add pork shoulder; cook 5 minutes or until lightly browned, turning occasionally. Transfer pork to slow cooker. 3. Recoat pan with cooking spray. Add onion and bell pepper; sauté 8 minutes, stirring frequently. Add garlic; sauté 1 minute. Add tomato paste; cook 1 minute, stirring constantly. Stir in beer; cook 1 minute. Transfer onion mixture to slow cooker. Add 1/4 teaspoon salt, chili powder, and next 9 ingredients (through ham hock) to slow cooker. Cover and cook on HIGH 5 hours or until meat is tender. Remove bay leaves and ham hock; discard. Stir in remaining 1/4 teaspoon salt and sugar. Ladle about 1 1/3 cups chili into each of 8 bowls; top each serving with 1 tablespoon cilantro, 1 tablespoon green onions, and 1 tablespoon cheese. Serve each serving with 1 lime wedge.',
    	is_premium: false,
    	category: category
    },
    {
    	name: 'MOVIE NIGHT MEATBALL SUBS',
    	time_to_cook: 0.5,
    	energy: 1000,
    	recipe: 'Preheat oven to 450 degrees F. Slice a thin layer off the top of each sub roll. Remove some of the bread inside to form a bread "boat". I like to reserve the unused bread chunks for fresh breadcrumbs, or they can be used in bread pudding. Brush inside of hollowed rolls with olive oil. Fill bottom of buns with 1/2 cup shredded mozzarella each. Place on a baking sheet and bake until buns are lightly browned and cheese is melted. Fill subs with Fresh Tomato Sauce and 3 meatballs. Top with more sauce, sprinkle with the grated cheese (and more mozzarella if you like). Return subs to oven briefly, just to melt the cheese on top. Be sure to have lots of napkins handy, and enjoy.',
    	is_premium: true,
    	category: category
    },
    {
    	name: 'PIGS IN BLANKETS',
    	time_to_cook: 1,
    	energy: 1500,
    	recipe: 'Preheat the oven to 350&deg;F. Cut narrow strips of bacon that are just long enough to wrap once around the mini sausage/chipolata. Place seam-side down on a baking tray and bake for 15-20 minutes until the bacon is crisp and slightly browned. For the dip mix the mayo and mustard together until smooth then sprinkle with the smoked paprika. Serve the sausages warm with the dip.',
    	is_premium: false,
    	category: category
    }
  ])

# Seed ingredient
  recipes.each do |recipe|
    Ingredient.create([
      {
        name: 'Beef steak',
        unit: 'g',
        amount: '500',
        recipe: recipe
      },
      {
        name: 'Egg',
        unit: '',
        amount: '2',
        recipe: recipe
      },
      {
        name: 'Pepper',
        unit: 'g',
        amount: '10',
        recipe: recipe
      },
      {
        name: 'Butter',
        unit: 'g',
        amount: '50',
        recipe: recipe
      },
      {
        name: 'Onion',
        unit: '',
        amount: '1',
        recipe: recipe
      },
      {
      	name: 'Ginger brandy',
      	unit: 'cup',
      	amount: '1/4',
      	recipe: recipe,
      },
      {
      	name: 'Cheddar cheese, grated',
      	unit: 'cup',
      	amount: '3',
      	recipe: recipe,
      },
      {
      	name: 'Parsley',
      	unit: 'teaspoon',
      	amount: '1/4',
      	recipe: recipe,
      },
      {
      	name: 'Milk',
      	unit: 'cup',
      	amount: '1/2',
      	recipe: recipe,
      },
      {
      	name: 'Water',
      	unit: 'cup',
      	amount: '1/2',
      	recipe: recipe,
      },
      {
      	name: 'Salt',
      	unit: 'teaspoon',
      	amount: '2',
      	recipe: recipe,
      },
      {
      	name: 'Twisted butter flavor pretzel sticks, broken in half',
      	unit: '',
      	amount: '15',
      	recipe: recipe,
      },
      {
      	name: 'Egg yolk',
      	unit: '',
      	amount: '2',
      	recipe: recipe,
      },
      {
      	name: 'Orange decorator sugar crystals',
      	unit: 'cup',
      	amount: '1/3',
      	recipe: recipe,
      },
      {
      	name: 'All-purpose flour',
      	unit: 'cup',
      	amount: '1/2',
      	recipe: recipe,
      },
      {
      	name: 'English mustard',
      	unit: 'teaspoon',
      	amount: '2',
      	recipe: recipe,
      }
    ])
  end
end