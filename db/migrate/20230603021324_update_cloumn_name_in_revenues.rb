class UpdateCloumnNameInRevenues < ActiveRecord::Migration[7.0]
  def change
    rename_column :revenues, :name, :title
  end
end
