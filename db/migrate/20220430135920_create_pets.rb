class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.string :category
      t.string :name
      t.text :description
      t.string :specie
      t.boolean :available, default: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
