class AddCategoryToShoes < ActiveRecord::Migration[7.1]
  def change
    add_column :shoes, :category, :string
  end
end
