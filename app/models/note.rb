class Note < ActiveRecord::Base
  belongs_to :student
  has_one :roster, through: :student
end

# cocktails
# ingredients
# measurement

# Cocktail
# has_many :measurements
# has_many :ingredients, through: :measurements

# name: "margarita"

# Ingredient
# has_many :measurements
# has_many :cocktails, through: :measurements

# name: "tequila"

# Measurement
# belongs_to :cocktail
# belongs_to :ingredient

# amount: "2 shots"
# ingredient_id
# cocktail_id