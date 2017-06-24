class ChangeStuffedAnimalsColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :animals, :type, :variety
  end
end
