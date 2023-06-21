class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :paternal_name
      t.string :maternal_name
      t.string :sex
      t.date :date_of_birth
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
