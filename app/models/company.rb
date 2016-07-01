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
end