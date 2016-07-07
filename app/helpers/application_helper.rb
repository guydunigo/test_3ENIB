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

end
