class CreateBusines < ActiveRecord::Migration[6.1]
  def change
    create_table :busines do |t|
      t.string :name
      t.string :address
      t.string :description
      t.string :owner
      t.string :mercantil_code

      t.timestamps
    end
  end
end
