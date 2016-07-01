class CreateProjectfiles < ActiveRecord::Migration
  def change
    create_table :projectfiles do |t|
      t.belongs_to :project, index: true
      t.string :name, null: false
      t.text :description
      t.string :path, null: false
      t.string :mime_type
      t.decimal :size
      t.timestamps null: false
    end
  end
end
