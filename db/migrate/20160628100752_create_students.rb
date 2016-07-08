class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :nick_name
      t.string :rank
      t.string :picture, default: "documents/avatar.svg"
      t.string :semester, default: "S1"
      t.boolean :field_meca, default: false
      t.boolean :field_elec, default: false
      t.boolean :field_info, default: false
      t.text :description
      t.string :email, null: false
      t.string :phone
      t.string :secu_number
      t.string :rib
      t.string :resume
      t.boolean :admin, default: false
      t.string :password_digest
      t.timestamps null: false
    end
  end
end