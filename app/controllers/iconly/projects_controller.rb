require_dependency 'iconly/application_controller'

module Iconly
  class ProjectsController < ApplicationController
    before_action :set_project, only: [:show, :edit, :update, :destroy, :generate_font]

    def index
      @projects = ProjectIcon.all_projects(current_user.id, params[:q])
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
        redirect_to project_path(@project),
                    notice: '<i class="iconly-baby mr-05"></i> Great, a new project was created!'
      else
        render :new
      end
    end

    def update
      if @project.update(project_params)
        redirect_to project_path(@project),
                    notice: '<i class="iconly-baby mr-05"></i> Awsome, project updated all right!'
      else
        render :edit
      end
    end

    def generate_font
      if (zip_file = Project::Downloader.new(@project).call)
        send_file zip_file
      else
        flash[:error] = '<i class="iconly-baby2 mr-05"></i> '\
                        'Sorry an error occurred generating the font, please try again.'
        redirect_to project_path(@project)
      end
    end

    def destroy
      @project.destroy
      redirect_to projects_url, notice: '<i class="iconly-baby mr-05"></i> Project is gone to the bin.'
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
