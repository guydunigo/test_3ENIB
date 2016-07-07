class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.belongs_to :project, index: true
      t.belongs_to :student, index: true
      t.string :name
      t.string :state, default: "waiting" # waiting -> confirmed/rejected -> finished
      t.text :description
      t.timestamps null: false
    end
  end
end
