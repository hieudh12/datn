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
    username: 'hieu do',
    email: 'hieudo@gmail.com',
    password: '123456'
  },
  {
    username: 'giang pham',
    email: 'giagiaph@gmail.com',
    password: '123456'
  }
])

# Seed categories
categories = Category.create([
  {
    name: 'Review',
    description: 'The author experience of regional specialties throughout Vietnam'
  },
  {
    name: 'Tet foods',
    description: 'How to prepare dishes in the traditional Tet of Vietnamese'
  },
  {
    name: 'Central foods',
    description: 'Processing specialties of The Central Vietnam'
  },
  {
    name: 'Saigon foods',
    description: 'How to prepare favorite food in Saigon'
  },
  {
    name: 'Hanoi foods',
    description: 'How to prepare dishes in bold Ha Thanh old'
  },
  {
    name: 'Summer foods',
    description: 'Summer Delicacies'
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
      is_premium: false,
      category: category
    },
    {
      name: 'GRANNYS BANANA CREAM PIE',
      time_to_cook: 1,
      energy: 3000,
      recipe: 'In a saucepan, combine sugar, flour, and salt; stir in milk and mix well. Cook over medium heat, stirring constantly, until the mixture thickens and comes to a boil; boil for 2 minutes. Remove from the heat. Stir a small amount of cream mixture into egg yolks; return all to saucepan. Cook for 2 minutes, stirring constantly; remove from the heat. Add butter and vanilla; mix well; allow to cool slightly. Slice the bananas and place evenly in pastry shell; pour cream mixture over bananas. Cool; before serving, garnish with whipped cream or Cool Whip and bananas. Refrigerate any leftovers.',
      is_premium: false,
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