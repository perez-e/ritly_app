class CreateRitlies < ActiveRecord::Migration
  def change
    create_table :ritlies do |t|
      t.string :link
      t.string :random_string
      t.integer :visits

      t.timestamps
    end
  end
end
