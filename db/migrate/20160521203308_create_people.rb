class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :email_address
      t.string :about

      t.timestamps null: false
    end
  end
end
