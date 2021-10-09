class CreateClothes < ActiveRecord::Migration[6.1]
  def change
    create_table :clothes do |t|
      t.integer :user_id
      t.string :quadrant
      t.string :clothing_category
      t.string :color
      t.string :occasion

      t.timestamps
    end
  end
end
