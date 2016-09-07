class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.date :birth_date, null: false
      t.string :color, null: false
      t.string :name, null: false
      t.string :sex, null: false
      t.text :descriptions, null: false
    end
    add_index :cats, :birth_date
    add_index :cats, :name
  end
end
