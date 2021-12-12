class AddCleanToClothes < ActiveRecord::Migration[6.1]
  def change
    add_column :clothes, :clean, :boolean
  end
end
