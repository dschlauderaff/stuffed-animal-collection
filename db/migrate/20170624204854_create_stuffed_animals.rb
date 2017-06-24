class CreateStuffedAnimals < ActiveRecord::Migration[5.1]
  def change
    create_table :stuffed_animals do |t|
      t.string :name
      t.string :type
      t.integer :user_id
    end
  end
end
