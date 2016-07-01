class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :picture, default: "documents/avatar.svg"
      t.text :description
      t.string :fields
      t.string :address
      t.string :email, null: false
      t.string :siret
      t.string :password_digest
      t.boolean :hidden, default: false
      t.timestamps null: false
    end
  end
end