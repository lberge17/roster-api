class Note < ActiveRecord::Base
  belongs_to :student
  has_one :roster, through: :student

  def self.render_all
    self.all.map do |n|
      {
        content: n.content,
        student: n.student,
        roster: n.roster
      }
    end
  end

  def self.find_by_path(path)
    id = path.split("/notes/")[1].to_i # ["http://localhost:9393", "3"]
    Note.find_by_id(id)
  end
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