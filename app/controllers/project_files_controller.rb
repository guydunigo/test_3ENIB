class ProjectFilesController < ApplicationController

    def index
    end

    def new
    end

    def create
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

    def project_files_params
        params.require(:user).permit()
    end

end
