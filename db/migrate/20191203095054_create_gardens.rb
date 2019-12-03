class CreateGardens < ActiveRecord::Migration[5.2]
  def change
    create_table :gardens do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.string :location
      t.integer :capacity
      t.integer :size
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
