require_dependency 'iconly/application_controller'

module Iconly
  class ProjectsController < ApplicationController
    before_action :set_project, only: [:show, :edit, :update, :destroy]

    def index
      @projects = current_user.projects.order(:name)
    end

    def show
      @packages = Icon.all_packages(current_user.id, params[:q])
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

    def generate_font
      if (zip_file = Project::Downloader.new(@project).call)
        send_file zip_file
      else
        flash[:error] = 'Sorry an error occurred generating the font, please try again.'
        redirect_to @project
      end
    end

    def destroy
      @project.destroy
      redirect_to projects_url, notice: 'Project is gone to the bin.'
    end

    private

    def set_project
      @project = current_user.projects.friendly.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name)
    end
  end
end
