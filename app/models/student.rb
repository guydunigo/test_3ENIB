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
end
