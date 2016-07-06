class StudentsController < ApplicationController

    def index
        require_admin
        @students = Student.all
    end

    def new
        @student = Student.new
    end

    def create
        @student = Student.new(student_params)
        if @student.save
            session[:user_id] = @student.id
            redirect_to root_path
        else
            redirect_to signup_path
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
            :resume,
            :password,
            :password_confirmation
        )
    end

end
