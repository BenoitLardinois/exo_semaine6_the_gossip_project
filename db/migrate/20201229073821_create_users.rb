class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.text :description
      t.integer :age
      t.references :city, index: true
      t.timestamps
    end
  end
end
