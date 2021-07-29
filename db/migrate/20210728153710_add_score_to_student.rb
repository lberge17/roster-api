class AddScoreToStudent < ActiveRecord::Migration[6.1]
  def up
    add_column :students, :score, :integer
  end

  def down
    remove_column :students, :score
  end
end