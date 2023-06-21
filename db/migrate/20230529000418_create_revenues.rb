class CreateRevenues < ActiveRecord::Migration[7.0]
  def change
    create_table :revenues do |t|
      t.string :name
      t.string :description
      t.decimal :quantity
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
