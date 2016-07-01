class Project < ActiveRecord::Base
    belongs_to :company
    has_many :jobs
    has_many :students, through: :jobs
    has_many :projectfiles
end
