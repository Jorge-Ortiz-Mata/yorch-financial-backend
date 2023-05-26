class AddSummaryToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :summary, :string
  end
end
