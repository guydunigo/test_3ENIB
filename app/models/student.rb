class Student < ActiveRecord::Base
    has_many :jobs
    has_many :projects, through: :jobs
    has_secure_password
    
    def admin?
        self.admin
    end

    def student?
        true
    end

    def company?
        false
    end

    def waiting?
        answer = false;
        self.jobs.each do |job|
            answer = true unless job.confirmed || job.project.state == "finished"
        end
        return answer
    end

    def working?
        working = false;
        self.jobs.each do |job|
            working ||= job.confirmed || job.project.state = "launched"
        end
        return working
    end
end
