class CreateAuthenticationTokens < ActiveRecord::Migration[7.0]
  def change
    create_table :authentication_tokens do |t|
      t.string :auth_token
      t.integer :user_id

      t.timestamps
    end
  end
end
