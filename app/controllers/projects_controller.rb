class ProjectsController < ApplicationController    

    def index
        require_student
        @projects = Project.all
    end

    def new
        require_company
        @project = Project.new
    end

    def create
        require_company
        @project = Project.new
        if @project.save
            session[:user_id] = @project.id
            redirect_to root_path
        else
            redirect_to new_project_url
        end
    end

    def show
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def project_params
        params.require(:user).permit()
    end

end
