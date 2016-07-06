class JobsController < ApplicationController

    def new
        @job = Job.new
    end

    def create
        @job = Job.new(job_params)
        if @job.save
            redirect_to show_student_path @job.student
        else
            redirect_to create_job_path
        end
    end

    def edit
        require_admin
        @job = Job.find(params[:id])
    end

    def update
        @job = Job.find(params[:id])
        require_admin
        if @student.update_attributes(job_params)
            redirect_to show_student_path @job.student.id
        else
            render 'edit'
        end
    end

    def destroy
        @job = Job.find(params[:id])
        if @job.waiting?
            require_admin_or_student @job.student.id
        else
            require_admin
        end
        @job.destroy
    end

    private

    def job_params
        params.require(:job).permit(
            :name,
            :description
        )
    end

end
