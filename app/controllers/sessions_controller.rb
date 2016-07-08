class SessionsController < ApplicationController

    def new
    end

    def create
        # Students use the enib email adress. If the email address isn't a student one, test if it is a company one :
        if params[:session][:email].include?("@enib.fr") && user = Student.find_by_email(params[:session][:email])
        else
            user = Company.find_by_email(params[:session][:email])
        end
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = { "type" => user.class.to_s, "id" => user.id }
            redirect_to root_path
        else
            redirect_to login_path, alert: "Login failed"
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path
    end

end
