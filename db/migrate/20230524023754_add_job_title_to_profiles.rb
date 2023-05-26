class AddJobTitleToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :job_title, :string
  end
end
