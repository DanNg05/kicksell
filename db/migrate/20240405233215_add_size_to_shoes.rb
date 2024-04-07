class AddSizeToShoes < ActiveRecord::Migration[7.1]
  def change
    add_column :shoes, :size, :string
  end
end
