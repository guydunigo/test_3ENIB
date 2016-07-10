class Project < ActiveRecord::Base
    belongs_to :company
    has_many :jobs
    has_many :students, through: :jobs
    has_many :projectfiles

    def waiting?
        self.state == "waiting" && self.project.state == "validated"
    end

    def confirmed?
        self.state == "confirmed"
    end

    def launched?
        self.state == "confirmed" && self.project.state == "launched"
    end

    def finished?
        self.state == "finished"
    end
end
