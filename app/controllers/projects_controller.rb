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

    def undo
        require_admin
        @project = Project.find(params[:id])
        if @project.state = "finished"
            @project.state =  "launched"
        elsif @project.state = "launched"
            @project.state = "confirmed"
        else
            @project.state = "waiting"
        end
        @project.save
        redirect_to project_path(@project)
    end

    def confirm
        require_admin
        @project = Project.find(params[:id])
        @project.state = "confirmed"
        @project.save
        redirect_to project_path(@project)
    end

    def launch
        require_admin
        @project = Project.find(params[:id])
        @project.state = "launched"
        @project.save
        redirect_to project_path(@project)
    end

    def finish
        require_admin
        @project = Project.find(params[:id])
        @project.state = "finised"
        @project.save
        redirect_to project_path(@project)
    end

    private

    def project_params
        params.require(:user).permit()
    end

end
