class CompaniesController < ApplicationController
        
    def index
        require_student
        @companies = Company.all
    end

    def new
        @company = Company.new
    end

    def create
        @company = Company.new(company_params)
        if (!(@student.email.include? "@enib.fr") || !(Student.find_by_email(@student.email))) && !(Company.find_by_email(@student.email)) && @company.save
            session[:user_id] = @company.id
            redirect_to root_path
        else
            redirect_to signup_company_url
        end
    end

    def show
        require_admin_or_company params[:id]
        @company = Company.find(params[:id])
        @projects = @company.projects
    end

    def edit
        require_admin_or_company params[:id]
        @company = Company.find(params[:id])
    end

    def update
        require_admin_or_company params[:id]
        @company = Company.find(params[:id])
        if @company.update_attributes(company_params)
            redirect_to(action: 'show', id: @company.id)
        else
            render 'edit'
        end
    end

    def destroy
        require_admin
        @company = Company.find(params[:id])
        @path = Rails.root.join("documents/students/").join(@company.id.to_s)
        # For now, we don't delete the company folder,
        # because we don't want to delete the projects inside it.
        @company.destroy
        redirect_to companies_path
    end

    private

    def company_params
        params.require(:company).permit(
            :name,
            :description,
            :fields,
            :address,
            :email,
            :siret,
            :password,
            :password_confirmation,
            :hidden
        )
    end

end
