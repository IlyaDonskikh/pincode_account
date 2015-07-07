class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :phone
      t.string :name
      t.string :email
      t.string :role
      t.string :api_key
      t.string :password

      t.timestamps null: false
    end
  end
end
