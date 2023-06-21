class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.string :title
      t.string :description
      t.string :quantity
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
