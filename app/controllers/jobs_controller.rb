class JobsController < ApplicationController

    def new
        require_student
        @job = Job.new
    end

    def create
        require_student
        if current_user.admin?
            @job = Job.new(admin_job_params)
        else
            @job = Job.new(job_params)
            @job.student_id = current_user.id
        end
        @job.project_id = params[:project_id]
        if @job.save
            redirect_to student_path @job.student
        else
            redirect_to create_job_path
        end
    end

    def edit
        require_admin
        @job = Job.find(params[:id])
    end

    def update
        require_admin
        @job = Job.find(params[:id])

        if @student.update_attributes(admin_job_params)
            redirect_to student_path @job.student.id
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
        @student = @job.student
        @job.destroy
        redirect_to student_path(@student.id)
    end

    def undo
        require_admin
        @job = Job.find(params[:id])
        @job.state = "waiting"
        @job.save
        redirect_to student_path(@job.student.id)
    end

    def confirm
        require_admin
        @job = Job.find(params[:id])
        @job.state = "confirmed"
        @job.save
        redirect_to student_path(@job.student.id)
    end

    def reject
        require_admin
        @job = Job.find(params[:id])
        @job.state = "rejected"
        @job.save
        redirect_to student_path(@job.student.id)
    end

    def finish
        require_admin
        @job = Job.find(params[:id])
        @job.state = "finished"
        @job.save
        redirect_to student_path(@job.student.id)
    end

    private

    def job_params
        params.require(:job).permit(
            :name,
            :description
        )
    end

    def admin_job_params
        params.require(:job).permit(
            :student_id,
            :name,
            :state,
            :description
        )
    end

end
