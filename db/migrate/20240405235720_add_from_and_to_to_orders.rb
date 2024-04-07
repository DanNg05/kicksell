class AddFromAndToToOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :from, :date
    add_column :orders, :to, :date
  end
end
