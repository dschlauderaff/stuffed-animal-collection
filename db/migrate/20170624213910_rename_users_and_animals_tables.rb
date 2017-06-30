class RenameUsersAndAnimalsTables < ActiveRecord::Migration[5.1]
  def change
  rename_table :animals, :toys
  end
end
