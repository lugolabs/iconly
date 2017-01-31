require_dependency 'iconly/application_controller'

module Iconly
  class ProjectsController < ApplicationController
    before_action :require_sign_in
    before_action :set_project, only: [:show, :edit, :update, :destroy]

    def index
      @projects = current_user.projects.order(:name)
    end

    def show
    end

    def new
      @project = Project.new
    end

    def edit
    end

    def create
      @project = current_user.projects.build(project_params)

      if @project.save
        redirect_to @project, notice: 'Great, a new project was created!'
      else
        render :new
      end
    end

    def update
      if @project.update(project_params)
        redirect_to @project, notice: 'Awsome, project updated all right!'
      else
        render :edit
      end
    end

    def destroy
      @project.destroy
      redirect_to projects_url, notice: 'Project is gone to the bin.'
    end

    private

    def set_project
      @project = current_user.projects.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name)
    end
  end
end
