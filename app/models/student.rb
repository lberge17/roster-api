class Student < ActiveRecord::Base
  belongs_to :roster
  has_many :notes
end