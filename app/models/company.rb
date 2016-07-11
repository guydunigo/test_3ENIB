class Company < ActiveRecord::Base
    has_many :projects
    has_secure_password

    def admin?
        false
    end

    def student?
        false
    end

    def company?
        true
    end

    def waiting?
        answer = false;
        self.projects.each do |project|
            answer ||= project.waiting? || project.confirmed?
        end
        return answer
    end

    def working?
        working = false;
        self.projects.each do |project|
            working ||= project.launched?
        end
        return working
    end
end