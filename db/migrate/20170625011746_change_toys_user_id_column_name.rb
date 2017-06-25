class ChangeToysUserIdColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :toys, :user_id, :owner_id
  end
end
