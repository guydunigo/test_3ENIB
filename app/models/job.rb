class Job < ActiveRecord::Base
    belongs_to :project
    belongs_to :student

    def waiting?
        self.state == "waiting" && self.project.state == "validated"
    end

    def working?
        self.state == "confirmed" && self.project.state == "launched"
    end

    def rejected?
        self.state == "rejected"
    end

    def finished?
        self.state == "finished" || (self.state == "confirmed" && self.project.state == "finished")
    end
end
