class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :location
      t.datetime :startdatetime
      t.integer :duration

      t.timestamps null: false
    end
  end
end
