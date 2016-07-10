module ApplicationHelper

    def undo_job_path job
        "/undo_job/" + job.id.to_s
    end

    def confirm_job_path job
        "/confirm_job/" + job.id.to_s
    end

    def reject_job_path job
        "/reject_job/" + job.id.to_s
    end

    def finish_job_path job
        "/finish_job/" + job.id.to_s
    end

    def destroy_job_path job
        "/destroy_job/" + job.id.to_s
    end

    def toggle_admin_path student
        "/students/" + student.id.to_s + "/toggle_admin"
    end

    def undo_project_path project
    end

end
