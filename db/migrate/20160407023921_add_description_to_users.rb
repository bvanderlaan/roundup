class AddDescriptionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :description, :text, null: false
  end
end
