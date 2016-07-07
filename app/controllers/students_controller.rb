class StudentsController < ApplicationController

    def index
        require_admin
        @students = Student.all
    end

    def new
        @student = Student.new
    end

    def create
        if current_user && current_user.admin?
            @student = Student.new(admin_student_params)
        else
            @student = Student.new(student_params)
        end
        @student.email.downcase!
        # if no student with the same email is found, create it
        if !(Student.find_by("email == ?", @student.email)) && @student.save
            if current_user && current_user.admin?
                redirect_to students_path
            else
                session[:user_id] = @student.id
                redirect_to root_path
            end
        else
            redirect_to signup_student_path
        end
    end

    def show
        require_admin_or_student params[:id]
        @student = Student.find(params[:id])
    end

    def edit
        require_admin_or_student params[:id]
        @student = Student.find(params[:id])
    end

    def update
        require_admin_or_student params[:id]
        @student = Student.find(params[:id])
        if @student.update_attributes(student_params)
            redirect_to(action: 'show', id: @student.id)
        else
            render 'edit'
        end
    end

    def destroy
        require_admin
        @student = Student.find(params[:id])
        @path = Rails.root.join("documents/students/").join(@student.id.to_s)

        @path.rmtree if @path.exist?
        @student.jobs.destroy_all
        @student.destroy
        redirect_to students_path
    end

    def toggle_admin
        require_admin
        @student = Student.find(params[:id])
        @student.admin = !@student.admin
        @student.save
        redirect_to student_path(@student)
    end

    private

    def student_params
        params.require(:student).permit(
            :first_name,
            :last_name,
            :nick_name,
            :picture,
            :semester,
            :fields,
            :description,
            :email,
            :phone,
            :secu_number,
            :rib,
            :password,
            :password_confirmation
        )
    end

    def admin_student_params
        params.require(:student).permit(
            :first_name,
            :last_name,
            :nick_name,
            :picture,
            :semester,
            :rank,
            :description,
            :email,
            :phone,
            :secu_number,
            :rib,
            :password,
            :password_confirmation
        )
    end

end
