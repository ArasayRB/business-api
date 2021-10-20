class CreateServices < ActiveRecord::Migration[6.1]
  def change
    create_table :services do |t|
      t.string :title
      t.string :description
      t.float :aproximate_price
      t.integer :top_people
      t.integer :min_people
      t.references :busine, null: false, foreign_key: true

      t.timestamps
    end
  end
end
