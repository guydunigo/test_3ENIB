class Project < ActiveRecord::Base
    belongs_to :company
    has_many :jobs
    has_many :students, through: :jobs
    has_many :projectfiles

    def waiting?
        self.state == "waiting"
    end

    def confirmed?
        self.state == "confirmed"
    end

    def launched?
        self.state == "launched"
    end

    def finished?
        self.state == "finished"
    end
end
