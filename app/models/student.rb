class Student < ActiveRecord::Base
  belongs_to :roster
  has_many :notes

  # def notes
  #   Note.where("student_id = ?", self.id)
  # end

  # def notes=(notes_objects)
  # end

  # def notes<<(note_object)
  # end
end