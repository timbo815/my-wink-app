class Create < ActiveRecord::Migration
  def change
    create_table :users do |t|
     t.string :email
     t.string :password
     t.string :auth_token
     t.string :refresh_token
     t.timestamps
    end
  end
end
