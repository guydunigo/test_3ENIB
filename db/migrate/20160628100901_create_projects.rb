class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.belongs_to :company, index: true
      t.string :name, null: false
      t.string :fields
      t.text :description
      t.date :end_date
      t.string :state, default: "waiting" # waiting -> confirmed -> launched -> finished 
      t.text :diary
      t.boolean :hidden, default: false
      t.timestamps null: false
    end
  end
end
