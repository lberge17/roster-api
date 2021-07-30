class Roster < ActiveRecord::Base
  has_many :students
  has_many :notes, through: :students
end