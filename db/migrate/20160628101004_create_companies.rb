class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :picture, default: "documents/avatar.svg"
      t.boolean :field_meca, default: false
      t.boolean :field_elec, default: false
      t.boolean :field_info, default: false
      t.text :description
      t.string :email, null: false
      t.string :phone
      t.string :address
      t.string :siret
      t.string :password_digest
      t.boolean :hidden, default: false
      t.timestamps null: false
    end
  end
end