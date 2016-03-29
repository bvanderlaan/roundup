class CreateRsvps < ActiveRecord::Migration
  def change
    create_table :rsvps do |t|
      t.boolean :is_going, :default => false

      t.timestamps null: false
    end
  end
end
